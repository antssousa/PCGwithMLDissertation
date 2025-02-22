﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ObjectCreator : MonoBehaviour
{
    public enum TreeTypes
    {
        Low,
        Mid,
        High
    }

    [Header("Poisson Distribution Controller")]
    public float radius = 2;
    public Vector2 regionSize = Vector2.one * 10;
    public int rejectionSamples = 300;
    public float displayRadius = 1;
    [Range(0, 1)]
    public float fillPercent = 0.9f;
    public Vector2 offset = Vector2.zero;

    [Header("Tree Data")]
    public int treesPoolSize = 50;

    [Range(0, 1)]
    public float treeLowHeight = 0.3f;
    [Range(0, 1)]
    public float treeMidHeight = 0.7f;

    public List<GameObject> lowTrees;
    public List<GameObject> midTrees;
    public List<GameObject> highTrees;

    public Transform unusedLowTreesPool;
    public Transform unusedMidTreesPool;
    public Transform unusedHighTreesPool;

    public Material lowMaterial;
    public Material midMaterial;
    public Material highMaterial;

    List<Vector2> points;
    MapPreview mapPreview;
    TerrainGenerator terrainGen;


#if UNITY_EDITOR
    private void OnValidate()
    {
        RegeneratePoints();
        if (mapPreview == null)
        {
            mapPreview = FindObjectOfType<MapPreview>();
        }

        if (mapPreview != null)
        {
            // So that destroy Immediate can be called here
            UnityEditor.EditorApplication.delayCall += () =>
            {
                OnCreateTreesForPreviewChunk();
            };
        }
    }

    public void OnDrawGizmos()
    {
        Gizmos.DrawWireCube(transform.position, new Vector3(regionSize.x, 0, regionSize.y));
        if (points != null)
        {
            foreach (Vector2 point in points)
            {
                Gizmos.DrawSphere(transform.position + new Vector3(offset.x, 0, offset.y) + (new Vector3(point.x, 0, point.y) - new Vector3(regionSize.x / 2, 0, regionSize.y / 2)) * fillPercent, displayRadius);
            }
        }
    }

    public void OnCreateTreesForPreviewChunk()
    {
        if (Application.isPlaying)
        {
            return;
        }
        // Find MapPreview
        if (mapPreview == null)
        {
            mapPreview = FindObjectOfType<MapPreview>();
        }
        if (mapPreview == null)
        {
            return;
        }

        Bounds terrainBounds = new Bounds(new Vector2(mapPreview.meshFilter.transform.position.x, mapPreview.meshFilter.transform.position.z), Vector2.one * mapPreview.meshSettings.meshWorldSize);

        float newSizeX = terrainBounds.size.x / regionSize.x;
        float newSizeY = terrainBounds.size.y / regionSize.y;

        // Delete Old Objects
        foreach (Transform trans in mapPreview.meshFilter.transform)
        {
            GameObject.DestroyImmediate(trans.gameObject);
        }

        // Create new objects
        foreach (Vector2 point in points)
        {
            RaycastHit raycastHit;
            // Fire a ray going down
            // multiply by 0.45f to allow some buffer space between chunks
            if (Physics.Raycast((mapPreview.meshFilter.transform.position + new Vector3(offset.x * newSizeX, 0, offset.y * newSizeY)
                + (new Vector3(point.x * newSizeX, mapPreview.meshFilter.transform.position.y + 300, point.y * newSizeY) - new Vector3(terrainBounds.size.x / 2, 0, terrainBounds.size.y / 2)) * fillPercent), new Vector3(0, -1, 0), out raycastHit))
            {
                //Debug.DrawRay(new Vector3(chunk.chunkPosition.x + point.x, 200, chunk.chunkPosition.y + point.y), new Vector3(0, -1, 0));

                // If it collides with the example terrain mesh
                if (raycastHit.transform.name.Contains("ExampleMesh"))
                {
                    GameObject spawnObjectPrefab = null;

                    Material spawnMaterial = lowMaterial;

                    if (raycastHit.point.y < mapPreview.heightMapSettings.maxHeight * treeLowHeight)
                    {
                        spawnObjectPrefab = lowTrees[UnityEngine.Random.Range(0, lowTrees.Count - 1)];
                        spawnMaterial = lowMaterial;
                    }
                    else if (raycastHit.point.y < mapPreview.heightMapSettings.maxHeight * treeMidHeight)
                    {
                        spawnObjectPrefab = midTrees[UnityEngine.Random.Range(0, midTrees.Count - 1)];
                        spawnMaterial = midMaterial;
                    }
                    else
                    {
                        spawnObjectPrefab = highTrees[UnityEngine.Random.Range(0, highTrees.Count - 1)];
                        spawnMaterial = highMaterial;
                    }

                    foreach (Renderer renderer in spawnObjectPrefab.GetComponentsInChildren<Renderer>())
                    {
                        renderer.material = spawnMaterial;
                    }

                    GameObject.Instantiate(spawnObjectPrefab, raycastHit.point, Quaternion.identity, raycastHit.collider.transform);
                }
            }
        }
    }
#endif


    void Start()
    {
        for (int i = 0; i <= treesPoolSize; i++)
        {
            foreach (GameObject lowPrefab in lowTrees)
            {
                GameObject newTree = Instantiate(lowPrefab, unusedLowTreesPool);
                newTree.tag = GameConstants.TreeTag;
                newTree.SetActive(false);
            }
            foreach (GameObject midPrefab in midTrees)
            {
                GameObject newTree = Instantiate(midPrefab, unusedMidTreesPool);
                newTree.tag = GameConstants.TreeTag;
                newTree.SetActive(false);
            }
            foreach (GameObject highPrefab in highTrees)
            {
                GameObject newTree = Instantiate(highPrefab, unusedHighTreesPool);
                newTree.tag = GameConstants.TreeTag;
                newTree.SetActive(false);
            }
        }

        terrainGen = FindObjectOfType<TerrainGenerator>();
    }

    private void RegeneratePoints()
    {
        points = PoissonDiscSampling.GeneratePoints(radius, regionSize, rejectionSamples);
    }

    public GameObject GetTree(TreeTypes treeLevel)
    {
        GameObject treeObject = null;
        Material spawnMaterial = lowMaterial;

        switch (treeLevel)
        {
            case TreeTypes.Low:
                treeObject = unusedLowTreesPool.GetChild(UnityEngine.Random.Range(0, unusedLowTreesPool.childCount - 1)).gameObject;
                spawnMaterial = lowMaterial;
                break;
            case TreeTypes.Mid:
                treeObject = unusedMidTreesPool.GetChild(UnityEngine.Random.Range(0, unusedMidTreesPool.childCount - 1)).gameObject;
                spawnMaterial = midMaterial;
                break;
            case TreeTypes.High:
                treeObject = unusedHighTreesPool.GetChild(UnityEngine.Random.Range(0, unusedHighTreesPool.childCount - 1)).gameObject;
                spawnMaterial = highMaterial;
                break;
        }

        foreach (Renderer renderer in treeObject.GetComponentsInChildren<Renderer>())
        {
            renderer.material = spawnMaterial;
        }

        // Return tree with proper material attached to it
        return treeObject;
    }

    // Returning Trees to pool
    public void ReturnTreeToPool(GameObject treeToStore, TreeTypes treeType)
    {
        treeToStore.SetActive(false);
        if (treeType == TreeTypes.Low)
        {
            treeToStore.transform.SetParent(unusedLowTreesPool);
        }
        else if (treeType == TreeTypes.Mid)
        {
            treeToStore.transform.SetParent(unusedMidTreesPool);
        }
        else if (treeType == TreeTypes.High)
        {
            treeToStore.transform.SetParent(unusedHighTreesPool);
        }
        treeToStore.transform.localScale = Vector3.one;
        treeToStore.transform.position = Vector3.zero;
    }

    public void BuildChunkTreesFromPoints(TerrainChunk chunk, List<Vector2> treePoints)
    {
        if (chunk.hasTrees)
        {
            return;
        }

        float newSizeX = chunk.bounds.size.x / regionSize.x;
        float newSizeY = chunk.bounds.size.y / regionSize.y;

        foreach (Vector2 point in treePoints)
        {
            RaycastHit raycastHit;
            // Fire a ray going down
            // multiply by 0.45f to allow some buffer space between chunks
            if (Physics.Raycast((new Vector3(chunk.chunkPosition.x, 0f, chunk.chunkPosition.y) + new Vector3(offset.x * newSizeX, 0, offset.y * newSizeY)
                + (new Vector3(point.x * newSizeX, chunk.meshObject.transform.position.y + 300 , point.y * newSizeY) - new Vector3(chunk.bounds.size.x / 2, 0, chunk.bounds.size.y / 2)) * fillPercent), new Vector3(0, -1, 0), out raycastHit))
            {
                //Debug.DrawRay(new Vector3(chunk.chunkPosition.x + point.x, 200, chunk.chunkPosition.y + point.y), new Vector3(0, -1, 0));

                // If it collides with a terrainChunk
                if (raycastHit.transform.CompareTag(GameConstants.TerrainChunkTag))
                {
                    TreeTypes treeTypeToSpawn = TreeTypes.Low;
                    if (raycastHit.point.y < terrainGen.heightMapSettings.maxHeight * treeLowHeight)
                    {
                        treeTypeToSpawn = TreeTypes.Low;
                    }
                    else if (raycastHit.point.y < terrainGen.heightMapSettings.maxHeight * treeMidHeight)
                    {
                        treeTypeToSpawn = TreeTypes.Mid;
                    }
                    else
                    {
                        treeTypeToSpawn = TreeTypes.High;
                    }

                    GameObject newTree = GetTree(treeTypeToSpawn);
                    newTree.transform.SetParent(raycastHit.collider.transform);
                    newTree.transform.position = raycastHit.point;
                    newTree.SetActive(true);
                    //GameObject.Instantiate(spawnObjectPrefab, raycastHit.point, Quaternion.identity, raycastHit.collider.transform);
                }
            }
        }

        chunk.hasTrees = true;
    }

    public List<Vector2> OnCreateNewTreesForChunk(TerrainChunk chunk)
    {
        if(chunk.hasCreatedTrees)
        {
            return null;
        }

        float newSizeX = chunk.bounds.size.x / regionSize.x;
        float newSizeY = chunk.bounds.size.y / regionSize.y;

        points = PoissonDiscSampling.GeneratePoints(radius, regionSize, rejectionSamples);

        chunk.hasCreatedTrees = true;
        return points;
    }

    public void ReturnChunkObjectsToPool(TerrainChunk chunk, Transform chunkTransform)
    {
        if(!chunk.hasTrees)
        {
            return;
        }

        chunk.hasTrees = false;

        // Reverse iteration through list because you are removing ojects from the parent terrain
        for (int i = chunkTransform.childCount - 1; i >= 0; i--)
        {
            Transform treeTrans = chunkTransform.GetChild(i);
            TreeTypes treeTypeToSpawn = TreeTypes.Low;

            if (treeTrans.position.y < terrainGen.heightMapSettings.maxHeight * treeLowHeight)
            {
                treeTypeToSpawn = TreeTypes.Low;
            }
            else if (treeTrans.position.y < terrainGen.heightMapSettings.maxHeight * treeMidHeight)
            {
                treeTypeToSpawn = TreeTypes.Mid;
            }
            else
            {
                treeTypeToSpawn = TreeTypes.High;
            }
            ReturnTreeToPool(treeTrans.gameObject, treeTypeToSpawn);
        }
    }
}
