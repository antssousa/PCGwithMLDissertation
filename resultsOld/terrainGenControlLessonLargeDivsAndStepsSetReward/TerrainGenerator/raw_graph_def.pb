
C
global_step/initial_valueConst*
value	B : *
dtype0
W
global_step
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
global_step/AssignAssignglobal_stepglobal_step/initial_value*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
R
global_step/readIdentityglobal_step*
T0*
_class
loc:@global_step
;
steps_to_incrementPlaceholder*
shape: *
dtype0
9
AddAddglobal_step/readsteps_to_increment*
T0
t
AssignAssignglobal_stepAdd*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
L
vector_observationPlaceholder*
shape:���������N*
dtype0
w
%normalization_steps/Initializer/zerosConst*&
_class
loc:@normalization_steps*
value	B : *
dtype0
�
normalization_steps
VariableV2*
shape: *
shared_name *&
_class
loc:@normalization_steps*
dtype0*
	container 
�
normalization_steps/AssignAssignnormalization_steps%normalization_steps/Initializer/zeros*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
j
normalization_steps/readIdentitynormalization_steps*
T0*&
_class
loc:@normalization_steps
p
running_mean/Initializer/zerosConst*
_class
loc:@running_mean*
valueBN*    *
dtype0
}
running_mean
VariableV2*
shape:N*
shared_name *
_class
loc:@running_mean*
dtype0*
	container 
�
running_mean/AssignAssignrunning_meanrunning_mean/Initializer/zeros*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
U
running_mean/readIdentityrunning_mean*
T0*
_class
loc:@running_mean
w
!running_variance/Initializer/onesConst*#
_class
loc:@running_variance*
valueBN*  �?*
dtype0
�
running_variance
VariableV2*
shape:N*
shared_name *#
_class
loc:@running_variance*
dtype0*
	container 
�
running_variance/AssignAssignrunning_variance!running_variance/Initializer/ones*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
a
running_variance/readIdentityrunning_variance*
T0*#
_class
loc:@running_variance
;
ShapeShapevector_observation*
T0*
out_type0
A
strided_slice/stackConst*
valueB: *
dtype0
C
strided_slice/stack_1Const*
valueB:*
dtype0
C
strided_slice/stack_2Const*
valueB:*
dtype0
�
strided_sliceStridedSliceShapestrided_slice/stackstrided_slice/stack_1strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
>
Add_1Addnormalization_steps/readstrided_slice*
T0
:
SubSubvector_observationrunning_mean/read*
T0
;
CastCastAdd_1*

SrcT0*
Truncate( *

DstT0
&
truedivRealDivSubCast*
T0
?
Sum/reduction_indicesConst*
value	B : *
dtype0
P
SumSumtruedivSum/reduction_indices*

Tidx0*
	keep_dims( *
T0
/
add_2AddV2running_mean/readSum*
T0
0
Sub_1Subvector_observationadd_2*
T0

mulMulSub_1Sub*
T0
A
Sum_1/reduction_indicesConst*
value	B : *
dtype0
P
Sum_1SummulSum_1/reduction_indices*

Tidx0*
	keep_dims( *
T0
5
add_3AddV2running_variance/readSum_1*
T0
z
Assign_1Assignrunning_meanadd_2*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
�
Assign_2Assignrunning_varianceadd_3*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
�
Assign_3Assignnormalization_stepsAdd_1*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
3

group_depsNoOp	^Assign_1	^Assign_2	^Assign_3
<
sub_2Subvector_observationrunning_mean/read*
T0
P
Cast_1Castnormalization_steps/read*

SrcT0*
Truncate( *

DstT0
4
add_4/yConst*
valueB
 *  �?*
dtype0
(
add_4AddV2Cast_1add_4/y*
T0
;
	truediv_1RealDivrunning_variance/readadd_4*
T0
 
SqrtSqrt	truediv_1*
T0
*
	truediv_2RealDivsub_2Sqrt*
T0
G
normalized_state/Minimum/yConst*
valueB
 *  �@*
dtype0
S
normalized_state/MinimumMinimum	truediv_2normalized_state/Minimum/y*
T0
?
normalized_state/yConst*
valueB
 *  ��*
dtype0
R
normalized_stateMaximumnormalized_state/Minimumnormalized_state/y*
T0
5

batch_sizePlaceholder*
shape:*
dtype0
:
sequence_lengthPlaceholder*
shape:*
dtype0
;
masksPlaceholder*
shape:���������*
dtype0
A
epsilonPlaceholder*
shape:���������
*
dtype0
=
Cast_2Castmasks*

SrcT0*
Truncate( *

DstT0
M
#is_continuous_control/initial_valueConst*
value	B :*
dtype0
a
is_continuous_control
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
is_continuous_control/AssignAssignis_continuous_control#is_continuous_control/initial_value*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(
p
is_continuous_control/readIdentityis_continuous_control*
T0*(
_class
loc:@is_continuous_control
M
#trainer_major_version/initial_valueConst*
value	B : *
dtype0
a
trainer_major_version
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
trainer_major_version/AssignAssigntrainer_major_version#trainer_major_version/initial_value*
use_locking(*
T0*(
_class
loc:@trainer_major_version*
validate_shape(
p
trainer_major_version/readIdentitytrainer_major_version*
T0*(
_class
loc:@trainer_major_version
M
#trainer_minor_version/initial_valueConst*
value	B :*
dtype0
a
trainer_minor_version
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
trainer_minor_version/AssignAssigntrainer_minor_version#trainer_minor_version/initial_value*
use_locking(*
T0*(
_class
loc:@trainer_minor_version*
validate_shape(
p
trainer_minor_version/readIdentitytrainer_minor_version*
T0*(
_class
loc:@trainer_minor_version
M
#trainer_patch_version/initial_valueConst*
value	B : *
dtype0
a
trainer_patch_version
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
trainer_patch_version/AssignAssigntrainer_patch_version#trainer_patch_version/initial_value*
use_locking(*
T0*(
_class
loc:@trainer_patch_version*
validate_shape(
p
trainer_patch_version/readIdentitytrainer_patch_version*
T0*(
_class
loc:@trainer_patch_version
F
version_number/initial_valueConst*
value	B :*
dtype0
Z
version_number
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
version_number/AssignAssignversion_numberversion_number/initial_value*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
[
version_number/readIdentityversion_number*
T0*!
_class
loc:@version_number
C
memory_size/initial_valueConst*
value	B : *
dtype0
W
memory_size
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
memory_size/AssignAssignmemory_sizememory_size/initial_value*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(
R
memory_size/readIdentitymemory_size*
T0*
_class
loc:@memory_size
K
!action_output_shape/initial_valueConst*
value	B :
*
dtype0
_
action_output_shape
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
action_output_shape/AssignAssignaction_output_shape!action_output_shape/initial_value*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(
j
action_output_shape/readIdentityaction_output_shape*
T0*&
_class
loc:@action_output_shape
�
Fpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shapeConst*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
valueB"N      *
dtype0
�
Epolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/meanConst*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
valueB
 *    *
dtype0
�
Gpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddevConst*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
valueB
 *��>*
dtype0
�
Ppolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalFpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/shape*
seed�*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0*
seed2 
�
Dpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mulMulPpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalGpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel
�
@policy/main_graph_0/hidden_0/kernel/Initializer/truncated_normalAddDpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mulEpolicy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel
�
#policy/main_graph_0/hidden_0/kernel
VariableV2*
shape:	N�*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0*
	container 
�
*policy/main_graph_0/hidden_0/kernel/AssignAssign#policy/main_graph_0/hidden_0/kernel@policy/main_graph_0/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
validate_shape(
�
(policy/main_graph_0/hidden_0/kernel/readIdentity#policy/main_graph_0/hidden_0/kernel*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel
�
3policy/main_graph_0/hidden_0/bias/Initializer/zerosConst*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
valueB�*    *
dtype0
�
!policy/main_graph_0/hidden_0/bias
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
dtype0*
	container 
�
(policy/main_graph_0/hidden_0/bias/AssignAssign!policy/main_graph_0/hidden_0/bias3policy/main_graph_0/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
validate_shape(
�
&policy/main_graph_0/hidden_0/bias/readIdentity!policy/main_graph_0/hidden_0/bias*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias
�
#policy/main_graph_0/hidden_0/MatMulMatMulnormalized_state(policy/main_graph_0/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
$policy/main_graph_0/hidden_0/BiasAddBiasAdd#policy/main_graph_0/hidden_0/MatMul&policy/main_graph_0/hidden_0/bias/read*
T0*
data_formatNHWC
^
$policy/main_graph_0/hidden_0/SigmoidSigmoid$policy/main_graph_0/hidden_0/BiasAdd*
T0
|
 policy/main_graph_0/hidden_0/MulMul$policy/main_graph_0/hidden_0/BiasAdd$policy/main_graph_0/hidden_0/Sigmoid*
T0
�
Fpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shapeConst*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
valueB"      *
dtype0
�
Epolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/meanConst*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
valueB
 *    *
dtype0
�
Gpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddevConst*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
valueB
 *6��=*
dtype0
�
Ppolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalFpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/shape*
seed�*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0*
seed2
�
Dpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mulMulPpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalGpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel
�
@policy/main_graph_0/hidden_1/kernel/Initializer/truncated_normalAddDpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mulEpolicy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel
�
#policy/main_graph_0/hidden_1/kernel
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0*
	container 
�
*policy/main_graph_0/hidden_1/kernel/AssignAssign#policy/main_graph_0/hidden_1/kernel@policy/main_graph_0/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
validate_shape(
�
(policy/main_graph_0/hidden_1/kernel/readIdentity#policy/main_graph_0/hidden_1/kernel*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel
�
3policy/main_graph_0/hidden_1/bias/Initializer/zerosConst*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
valueB�*    *
dtype0
�
!policy/main_graph_0/hidden_1/bias
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
dtype0*
	container 
�
(policy/main_graph_0/hidden_1/bias/AssignAssign!policy/main_graph_0/hidden_1/bias3policy/main_graph_0/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
validate_shape(
�
&policy/main_graph_0/hidden_1/bias/readIdentity!policy/main_graph_0/hidden_1/bias*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias
�
#policy/main_graph_0/hidden_1/MatMulMatMul policy/main_graph_0/hidden_0/Mul(policy/main_graph_0/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
$policy/main_graph_0/hidden_1/BiasAddBiasAdd#policy/main_graph_0/hidden_1/MatMul&policy/main_graph_0/hidden_1/bias/read*
T0*
data_formatNHWC
^
$policy/main_graph_0/hidden_1/SigmoidSigmoid$policy/main_graph_0/hidden_1/BiasAdd*
T0
|
 policy/main_graph_0/hidden_1/MulMul$policy/main_graph_0/hidden_1/BiasAdd$policy/main_graph_0/hidden_1/Sigmoid*
T0
�
Fpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/shapeConst*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
valueB"      *
dtype0
�
Epolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/meanConst*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
valueB
 *    *
dtype0
�
Gpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/stddevConst*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
valueB
 *6��=*
dtype0
�
Ppolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalFpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/shape*
seed�*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0*
seed2
�
Dpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mulMulPpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalGpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/stddev*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel
�
@policy/main_graph_0/hidden_2/kernel/Initializer/truncated_normalAddDpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mulEpolicy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal/mean*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel
�
#policy/main_graph_0/hidden_2/kernel
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0*
	container 
�
*policy/main_graph_0/hidden_2/kernel/AssignAssign#policy/main_graph_0/hidden_2/kernel@policy/main_graph_0/hidden_2/kernel/Initializer/truncated_normal*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
validate_shape(
�
(policy/main_graph_0/hidden_2/kernel/readIdentity#policy/main_graph_0/hidden_2/kernel*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel
�
3policy/main_graph_0/hidden_2/bias/Initializer/zerosConst*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
valueB�*    *
dtype0
�
!policy/main_graph_0/hidden_2/bias
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
dtype0*
	container 
�
(policy/main_graph_0/hidden_2/bias/AssignAssign!policy/main_graph_0/hidden_2/bias3policy/main_graph_0/hidden_2/bias/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
validate_shape(
�
&policy/main_graph_0/hidden_2/bias/readIdentity!policy/main_graph_0/hidden_2/bias*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias
�
#policy/main_graph_0/hidden_2/MatMulMatMul policy/main_graph_0/hidden_1/Mul(policy/main_graph_0/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
$policy/main_graph_0/hidden_2/BiasAddBiasAdd#policy/main_graph_0/hidden_2/MatMul&policy/main_graph_0/hidden_2/bias/read*
T0*
data_formatNHWC
^
$policy/main_graph_0/hidden_2/SigmoidSigmoid$policy/main_graph_0/hidden_2/BiasAdd*
T0
|
 policy/main_graph_0/hidden_2/MulMul$policy/main_graph_0/hidden_2/BiasAdd$policy/main_graph_0/hidden_2/Sigmoid*
T0
�
Fpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/shapeConst*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
valueB"      *
dtype0
�
Epolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/meanConst*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
valueB
 *    *
dtype0
�
Gpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/stddevConst*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
valueB
 *6��=*
dtype0
�
Ppolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalFpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/shape*
seed�*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0*
seed2
�
Dpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mulMulPpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalGpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/stddev*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel
�
@policy/main_graph_0/hidden_3/kernel/Initializer/truncated_normalAddDpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mulEpolicy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal/mean*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel
�
#policy/main_graph_0/hidden_3/kernel
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0*
	container 
�
*policy/main_graph_0/hidden_3/kernel/AssignAssign#policy/main_graph_0/hidden_3/kernel@policy/main_graph_0/hidden_3/kernel/Initializer/truncated_normal*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
validate_shape(
�
(policy/main_graph_0/hidden_3/kernel/readIdentity#policy/main_graph_0/hidden_3/kernel*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel
�
3policy/main_graph_0/hidden_3/bias/Initializer/zerosConst*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
valueB�*    *
dtype0
�
!policy/main_graph_0/hidden_3/bias
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
dtype0*
	container 
�
(policy/main_graph_0/hidden_3/bias/AssignAssign!policy/main_graph_0/hidden_3/bias3policy/main_graph_0/hidden_3/bias/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
validate_shape(
�
&policy/main_graph_0/hidden_3/bias/readIdentity!policy/main_graph_0/hidden_3/bias*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias
�
#policy/main_graph_0/hidden_3/MatMulMatMul policy/main_graph_0/hidden_2/Mul(policy/main_graph_0/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
$policy/main_graph_0/hidden_3/BiasAddBiasAdd#policy/main_graph_0/hidden_3/MatMul&policy/main_graph_0/hidden_3/bias/read*
T0*
data_formatNHWC
^
$policy/main_graph_0/hidden_3/SigmoidSigmoid$policy/main_graph_0/hidden_3/BiasAdd*
T0
|
 policy/main_graph_0/hidden_3/MulMul$policy/main_graph_0/hidden_3/BiasAdd$policy/main_graph_0/hidden_3/Sigmoid*
T0
�
3policy/mu/kernel/Initializer/truncated_normal/shapeConst*#
_class
loc:@policy/mu/kernel*
valueB"   
   *
dtype0
�
2policy/mu/kernel/Initializer/truncated_normal/meanConst*#
_class
loc:@policy/mu/kernel*
valueB
 *    *
dtype0
�
4policy/mu/kernel/Initializer/truncated_normal/stddevConst*#
_class
loc:@policy/mu/kernel*
valueB
 *���;*
dtype0
�
=policy/mu/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal3policy/mu/kernel/Initializer/truncated_normal/shape*
seed�*
T0*#
_class
loc:@policy/mu/kernel*
dtype0*
seed2
�
1policy/mu/kernel/Initializer/truncated_normal/mulMul=policy/mu/kernel/Initializer/truncated_normal/TruncatedNormal4policy/mu/kernel/Initializer/truncated_normal/stddev*
T0*#
_class
loc:@policy/mu/kernel
�
-policy/mu/kernel/Initializer/truncated_normalAdd1policy/mu/kernel/Initializer/truncated_normal/mul2policy/mu/kernel/Initializer/truncated_normal/mean*
T0*#
_class
loc:@policy/mu/kernel
�
policy/mu/kernel
VariableV2*
shape:	�
*
shared_name *#
_class
loc:@policy/mu/kernel*
dtype0*
	container 
�
policy/mu/kernel/AssignAssignpolicy/mu/kernel-policy/mu/kernel/Initializer/truncated_normal*
use_locking(*
T0*#
_class
loc:@policy/mu/kernel*
validate_shape(
a
policy/mu/kernel/readIdentitypolicy/mu/kernel*
T0*#
_class
loc:@policy/mu/kernel
t
 policy/mu/bias/Initializer/zerosConst*!
_class
loc:@policy/mu/bias*
valueB
*    *
dtype0
�
policy/mu/bias
VariableV2*
shape:
*
shared_name *!
_class
loc:@policy/mu/bias*
dtype0*
	container 
�
policy/mu/bias/AssignAssignpolicy/mu/bias policy/mu/bias/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@policy/mu/bias*
validate_shape(
[
policy/mu/bias/readIdentitypolicy/mu/bias*
T0*!
_class
loc:@policy/mu/bias
�
policy_1/mu/MatMulMatMul policy/main_graph_0/hidden_3/Mulpolicy/mu/kernel/read*
transpose_b( *
T0*
transpose_a( 
g
policy_1/mu/BiasAddBiasAddpolicy_1/mu/MatMulpolicy/mu/bias/read*
T0*
data_formatNHWC
�
8policy/log_std/kernel/Initializer/truncated_normal/shapeConst*(
_class
loc:@policy/log_std/kernel*
valueB"   
   *
dtype0
�
7policy/log_std/kernel/Initializer/truncated_normal/meanConst*(
_class
loc:@policy/log_std/kernel*
valueB
 *    *
dtype0
�
9policy/log_std/kernel/Initializer/truncated_normal/stddevConst*(
_class
loc:@policy/log_std/kernel*
valueB
 *���;*
dtype0
�
Bpolicy/log_std/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormal8policy/log_std/kernel/Initializer/truncated_normal/shape*
seed�*
T0*(
_class
loc:@policy/log_std/kernel*
dtype0*
seed2
�
6policy/log_std/kernel/Initializer/truncated_normal/mulMulBpolicy/log_std/kernel/Initializer/truncated_normal/TruncatedNormal9policy/log_std/kernel/Initializer/truncated_normal/stddev*
T0*(
_class
loc:@policy/log_std/kernel
�
2policy/log_std/kernel/Initializer/truncated_normalAdd6policy/log_std/kernel/Initializer/truncated_normal/mul7policy/log_std/kernel/Initializer/truncated_normal/mean*
T0*(
_class
loc:@policy/log_std/kernel
�
policy/log_std/kernel
VariableV2*
shape:	�
*
shared_name *(
_class
loc:@policy/log_std/kernel*
dtype0*
	container 
�
policy/log_std/kernel/AssignAssignpolicy/log_std/kernel2policy/log_std/kernel/Initializer/truncated_normal*
use_locking(*
T0*(
_class
loc:@policy/log_std/kernel*
validate_shape(
p
policy/log_std/kernel/readIdentitypolicy/log_std/kernel*
T0*(
_class
loc:@policy/log_std/kernel
~
%policy/log_std/bias/Initializer/zerosConst*&
_class
loc:@policy/log_std/bias*
valueB
*    *
dtype0
�
policy/log_std/bias
VariableV2*
shape:
*
shared_name *&
_class
loc:@policy/log_std/bias*
dtype0*
	container 
�
policy/log_std/bias/AssignAssignpolicy/log_std/bias%policy/log_std/bias/Initializer/zeros*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
j
policy/log_std/bias/readIdentitypolicy/log_std/bias*
T0*&
_class
loc:@policy/log_std/bias
�
policy_1/log_std/MatMulMatMul policy/main_graph_0/hidden_3/Mulpolicy/log_std/kernel/read*
transpose_b( *
T0*
transpose_a( 
v
policy_1/log_std/BiasAddBiasAddpolicy_1/log_std/MatMulpolicy/log_std/bias/read*
T0*
data_formatNHWC
M
 policy_1/clip_by_value/Minimum/yConst*
valueB
 *   @*
dtype0
n
policy_1/clip_by_value/MinimumMinimumpolicy_1/log_std/BiasAdd policy_1/clip_by_value/Minimum/y*
T0
E
policy_1/clip_by_value/yConst*
valueB
 *  ��*
dtype0
d
policy_1/clip_by_valueMaximumpolicy_1/clip_by_value/Minimumpolicy_1/clip_by_value/y*
T0
4
policy_1/ExpExppolicy_1/clip_by_value*
T0
E
policy_1/ShapeShapepolicy_1/mu/BiasAdd*
T0*
out_type0
H
policy_1/random_normal/meanConst*
valueB
 *    *
dtype0
J
policy_1/random_normal/stddevConst*
valueB
 *  �?*
dtype0
�
+policy_1/random_normal/RandomStandardNormalRandomStandardNormalpolicy_1/Shape*
seed�*
T0*
dtype0*
seed2
v
policy_1/random_normal/mulMul+policy_1/random_normal/RandomStandardNormalpolicy_1/random_normal/stddev*
T0
_
policy_1/random_normalAddpolicy_1/random_normal/mulpolicy_1/random_normal/mean*
T0
B
policy_1/mulMulpolicy_1/Exppolicy_1/random_normal*
T0
A
policy_1/addAddV2policy_1/mu/BiasAddpolicy_1/mul*
T0
?
policy_1/subSubpolicy_1/addpolicy_1/mu/BiasAdd*
T0
=
policy_1/add_1/yConst*
valueB
 *�7�5*
dtype0
@
policy_1/add_1AddV2policy_1/Exppolicy_1/add_1/y*
T0
B
policy_1/truedivRealDivpolicy_1/subpolicy_1/add_1*
T0
;
policy_1/pow/yConst*
valueB
 *   @*
dtype0
>
policy_1/powPowpolicy_1/truedivpolicy_1/pow/y*
T0
=
policy_1/mul_1/xConst*
valueB
 *   @*
dtype0
H
policy_1/mul_1Mulpolicy_1/mul_1/xpolicy_1/clip_by_value*
T0
>
policy_1/add_2AddV2policy_1/powpolicy_1/mul_1*
T0
=
policy_1/add_3/yConst*
valueB
 *�?�?*
dtype0
B
policy_1/add_3AddV2policy_1/add_2policy_1/add_3/y*
T0
=
policy_1/mul_2/xConst*
valueB
 *   �*
dtype0
@
policy_1/mul_2Mulpolicy_1/mul_2/xpolicy_1/add_3*
T0
,
policy_1/TanhTanhpolicy_1/add*
T0
=
policy_1/pow_1/yConst*
valueB
 *   @*
dtype0
?
policy_1/pow_1Powpolicy_1/Tanhpolicy_1/pow_1/y*
T0
=
policy_1/sub_1/xConst*
valueB
 *  �?*
dtype0
@
policy_1/sub_1Subpolicy_1/sub_1/xpolicy_1/pow_1*
T0
=
policy_1/add_4/yConst*
valueB
 *�7�5*
dtype0
B
policy_1/add_4AddV2policy_1/sub_1policy_1/add_4/y*
T0
,
policy_1/LogLogpolicy_1/add_4*
T0
<
policy_1/sub_2Subpolicy_1/mul_2policy_1/Log*
T0
H
policy_1/Sum/reduction_indicesConst*
value	B :*
dtype0
i
policy_1/SumSumpolicy_1/sub_2policy_1/Sum/reduction_indices*

Tidx0*
	keep_dims(*
T0
=
policy_1/Log_1/xConst*
valueB
 *���A*
dtype0
0
policy_1/Log_1Logpolicy_1/Log_1/x*
T0
=
policy_1/mul_3/xConst*
valueB
 *   @*
dtype0
H
policy_1/mul_3Mulpolicy_1/mul_3/xpolicy_1/clip_by_value*
T0
@
policy_1/add_5AddV2policy_1/Log_1policy_1/mul_3*
T0
C
policy_1/ConstConst*
valueB"       *
dtype0
[
policy_1/MeanMeanpolicy_1/add_5policy_1/Const*

Tidx0*
	keep_dims( *
T0
=
policy_1/mul_4/xConst*
valueB
 *   ?*
dtype0
?
policy_1/mul_4Mulpolicy_1/mul_4/xpolicy_1/Mean*
T0
Q
policy_1/strided_slice/stackConst*
valueB"        *
dtype0
S
policy_1/strided_slice/stack_1Const*
valueB"       *
dtype0
S
policy_1/strided_slice/stack_2Const*
valueB"      *
dtype0
�
policy_1/strided_sliceStridedSlicepolicy_1/mu/BiasAddpolicy_1/strided_slice/stackpolicy_1/strided_slice/stack_1policy_1/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask*
ellipsis_mask *
new_axis_mask *
end_mask
M
policy_1/Reshape/shapeConst*
valueB:
���������*
dtype0
b
policy_1/ReshapeReshapepolicy_1/strided_slicepolicy_1/Reshape/shape*
T0*
Tshape0
L
policy_1/ones_like/ShapeShapepolicy_1/Reshape*
T0*
out_type0
E
policy_1/ones_like/ConstConst*
valueB
 *  �?*
dtype0
i
policy_1/ones_likeFillpolicy_1/ones_like/Shapepolicy_1/ones_like/Const*
T0*

index_type0
B
policy_1/mul_5Mulpolicy_1/ones_likepolicy_1/mul_4*
T0
*
actionIdentitypolicy_1/Tanh*
T0
-
StopGradientStopGradientaction*
T0
1
action_probsIdentitypolicy_1/sub_2*
T0
A
save/filename/inputConst*
valueB Bmodel*
dtype0
V
save/filenamePlaceholderWithDefaultsave/filename/input*
shape: *
dtype0
M

save/ConstPlaceholderWithDefaultsave/filename*
shape: *
dtype0
�
save/SaveV2/tensor_namesConst*�
value�B�Baction_output_shapeBglobal_stepBis_continuous_controlBmemory_sizeBnormalization_stepsBpolicy/log_std/biasBpolicy/log_std/kernelB!policy/main_graph_0/hidden_0/biasB#policy/main_graph_0/hidden_0/kernelB!policy/main_graph_0/hidden_1/biasB#policy/main_graph_0/hidden_1/kernelB!policy/main_graph_0/hidden_2/biasB#policy/main_graph_0/hidden_2/kernelB!policy/main_graph_0/hidden_3/biasB#policy/main_graph_0/hidden_3/kernelBpolicy/mu/biasBpolicy/mu/kernelBrunning_meanBrunning_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0
u
save/SaveV2/shape_and_slicesConst*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesaction_output_shapeglobal_stepis_continuous_controlmemory_sizenormalization_stepspolicy/log_std/biaspolicy/log_std/kernel!policy/main_graph_0/hidden_0/bias#policy/main_graph_0/hidden_0/kernel!policy/main_graph_0/hidden_1/bias#policy/main_graph_0/hidden_1/kernel!policy/main_graph_0/hidden_2/bias#policy/main_graph_0/hidden_2/kernel!policy/main_graph_0/hidden_3/bias#policy/main_graph_0/hidden_3/kernelpolicy/mu/biaspolicy/mu/kernelrunning_meanrunning_variancetrainer_major_versiontrainer_minor_versiontrainer_patch_versionversion_number*%
dtypes
2
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*�
value�B�Baction_output_shapeBglobal_stepBis_continuous_controlBmemory_sizeBnormalization_stepsBpolicy/log_std/biasBpolicy/log_std/kernelB!policy/main_graph_0/hidden_0/biasB#policy/main_graph_0/hidden_0/kernelB!policy/main_graph_0/hidden_1/biasB#policy/main_graph_0/hidden_1/kernelB!policy/main_graph_0/hidden_2/biasB#policy/main_graph_0/hidden_2/kernelB!policy/main_graph_0/hidden_3/biasB#policy/main_graph_0/hidden_3/kernelBpolicy/mu/biasBpolicy/mu/kernelBrunning_meanBrunning_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0
�
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*%
dtypes
2
�
save/AssignAssignaction_output_shapesave/RestoreV2*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(
�
save/Assign_1Assignglobal_stepsave/RestoreV2:1*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
�
save/Assign_2Assignis_continuous_controlsave/RestoreV2:2*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(
�
save/Assign_3Assignmemory_sizesave/RestoreV2:3*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(
�
save/Assign_4Assignnormalization_stepssave/RestoreV2:4*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
�
save/Assign_5Assignpolicy/log_std/biassave/RestoreV2:5*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
save/Assign_6Assignpolicy/log_std/kernelsave/RestoreV2:6*
use_locking(*
T0*(
_class
loc:@policy/log_std/kernel*
validate_shape(
�
save/Assign_7Assign!policy/main_graph_0/hidden_0/biassave/RestoreV2:7*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
validate_shape(
�
save/Assign_8Assign#policy/main_graph_0/hidden_0/kernelsave/RestoreV2:8*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
validate_shape(
�
save/Assign_9Assign!policy/main_graph_0/hidden_1/biassave/RestoreV2:9*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
validate_shape(
�
save/Assign_10Assign#policy/main_graph_0/hidden_1/kernelsave/RestoreV2:10*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
validate_shape(
�
save/Assign_11Assign!policy/main_graph_0/hidden_2/biassave/RestoreV2:11*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
validate_shape(
�
save/Assign_12Assign#policy/main_graph_0/hidden_2/kernelsave/RestoreV2:12*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
validate_shape(
�
save/Assign_13Assign!policy/main_graph_0/hidden_3/biassave/RestoreV2:13*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
validate_shape(
�
save/Assign_14Assign#policy/main_graph_0/hidden_3/kernelsave/RestoreV2:14*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
validate_shape(
�
save/Assign_15Assignpolicy/mu/biassave/RestoreV2:15*
use_locking(*
T0*!
_class
loc:@policy/mu/bias*
validate_shape(
�
save/Assign_16Assignpolicy/mu/kernelsave/RestoreV2:16*
use_locking(*
T0*#
_class
loc:@policy/mu/kernel*
validate_shape(
�
save/Assign_17Assignrunning_meansave/RestoreV2:17*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
�
save/Assign_18Assignrunning_variancesave/RestoreV2:18*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
�
save/Assign_19Assigntrainer_major_versionsave/RestoreV2:19*
use_locking(*
T0*(
_class
loc:@trainer_major_version*
validate_shape(
�
save/Assign_20Assigntrainer_minor_versionsave/RestoreV2:20*
use_locking(*
T0*(
_class
loc:@trainer_minor_version*
validate_shape(
�
save/Assign_21Assigntrainer_patch_versionsave/RestoreV2:21*
use_locking(*
T0*(
_class
loc:@trainer_patch_version*
validate_shape(
�
save/Assign_22Assignversion_numbersave/RestoreV2:22*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
�
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_10^save/Assign_11^save/Assign_12^save/Assign_13^save/Assign_14^save/Assign_15^save/Assign_16^save/Assign_17^save/Assign_18^save/Assign_19^save/Assign_2^save/Assign_20^save/Assign_21^save/Assign_22^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7^save/Assign_8^save/Assign_9
�
initNoOp^action_output_shape/Assign^global_step/Assign^is_continuous_control/Assign^memory_size/Assign^normalization_steps/Assign^policy/log_std/bias/Assign^policy/log_std/kernel/Assign)^policy/main_graph_0/hidden_0/bias/Assign+^policy/main_graph_0/hidden_0/kernel/Assign)^policy/main_graph_0/hidden_1/bias/Assign+^policy/main_graph_0/hidden_1/kernel/Assign)^policy/main_graph_0/hidden_2/bias/Assign+^policy/main_graph_0/hidden_2/kernel/Assign)^policy/main_graph_0/hidden_3/bias/Assign+^policy/main_graph_0/hidden_3/kernel/Assign^policy/mu/bias/Assign^policy/mu/kernel/Assign^running_mean/Assign^running_variance/Assign^trainer_major_version/Assign^trainer_minor_version/Assign^trainer_patch_version/Assign^version_number/Assign
[
!curiosity_next_vector_observationPlaceholder*
shape:���������N*
dtype0
�
Ocuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB"N   �   *
dtype0
�
Ncuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/meanConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB
 *    *
dtype0
�
Pcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/stddevConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
valueB
 *��>*
dtype0
�
Ycuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/shape*
seed�*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
seed2
�
Mcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mulMulYcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalPcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
Icuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normalAddMcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mulNcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
,curiosity_vector_obs_encoder/hidden_0/kernel
VariableV2*
shape:	N�*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
	container 
�
3curiosity_vector_obs_encoder/hidden_0/kernel/AssignAssign,curiosity_vector_obs_encoder/hidden_0/kernelIcuriosity_vector_obs_encoder/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
1curiosity_vector_obs_encoder/hidden_0/kernel/readIdentity,curiosity_vector_obs_encoder/hidden_0/kernel*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
<curiosity_vector_obs_encoder/hidden_0/bias/Initializer/zerosConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB�*    *
dtype0
�
*curiosity_vector_obs_encoder/hidden_0/bias
VariableV2*
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
�
1curiosity_vector_obs_encoder/hidden_0/bias/AssignAssign*curiosity_vector_obs_encoder/hidden_0/bias<curiosity_vector_obs_encoder/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
/curiosity_vector_obs_encoder/hidden_0/bias/readIdentity*curiosity_vector_obs_encoder/hidden_0/bias*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
,curiosity_vector_obs_encoder/hidden_0/MatMulMatMulvector_observation1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
-curiosity_vector_obs_encoder/hidden_0/BiasAddBiasAdd,curiosity_vector_obs_encoder/hidden_0/MatMul/curiosity_vector_obs_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
p
-curiosity_vector_obs_encoder/hidden_0/SigmoidSigmoid-curiosity_vector_obs_encoder/hidden_0/BiasAdd*
T0
�
)curiosity_vector_obs_encoder/hidden_0/MulMul-curiosity_vector_obs_encoder/hidden_0/BiasAdd-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0
�
Ocuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/shapeConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB"�   �   *
dtype0
�
Ncuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/meanConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB
 *    *
dtype0
�
Pcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/stddevConst*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
valueB
 *���=*
dtype0
�
Ycuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalOcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/shape*
seed�*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
seed2
�
Mcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mulMulYcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalPcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
Icuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normalAddMcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mulNcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
,curiosity_vector_obs_encoder/hidden_1/kernel
VariableV2*
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container 
�
3curiosity_vector_obs_encoder/hidden_1/kernel/AssignAssign,curiosity_vector_obs_encoder/hidden_1/kernelIcuriosity_vector_obs_encoder/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
1curiosity_vector_obs_encoder/hidden_1/kernel/readIdentity,curiosity_vector_obs_encoder/hidden_1/kernel*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
<curiosity_vector_obs_encoder/hidden_1/bias/Initializer/zerosConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
valueB�*    *
dtype0
�
*curiosity_vector_obs_encoder/hidden_1/bias
VariableV2*
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container 
�
1curiosity_vector_obs_encoder/hidden_1/bias/AssignAssign*curiosity_vector_obs_encoder/hidden_1/bias<curiosity_vector_obs_encoder/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
/curiosity_vector_obs_encoder/hidden_1/bias/readIdentity*curiosity_vector_obs_encoder/hidden_1/bias*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
,curiosity_vector_obs_encoder/hidden_1/MatMulMatMul)curiosity_vector_obs_encoder/hidden_0/Mul1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
-curiosity_vector_obs_encoder/hidden_1/BiasAddBiasAdd,curiosity_vector_obs_encoder/hidden_1/MatMul/curiosity_vector_obs_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
p
-curiosity_vector_obs_encoder/hidden_1/SigmoidSigmoid-curiosity_vector_obs_encoder/hidden_1/BiasAdd*
T0
�
)curiosity_vector_obs_encoder/hidden_1/MulMul-curiosity_vector_obs_encoder/hidden_1/BiasAdd-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0
�
.curiosity_vector_obs_encoder_1/hidden_0/MatMulMatMul!curiosity_next_vector_observation1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
/curiosity_vector_obs_encoder_1/hidden_0/BiasAddBiasAdd.curiosity_vector_obs_encoder_1/hidden_0/MatMul/curiosity_vector_obs_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
t
/curiosity_vector_obs_encoder_1/hidden_0/SigmoidSigmoid/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd*
T0
�
+curiosity_vector_obs_encoder_1/hidden_0/MulMul/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0
�
.curiosity_vector_obs_encoder_1/hidden_1/MatMulMatMul+curiosity_vector_obs_encoder_1/hidden_0/Mul1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
/curiosity_vector_obs_encoder_1/hidden_1/BiasAddBiasAdd.curiosity_vector_obs_encoder_1/hidden_1/MatMul/curiosity_vector_obs_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
t
/curiosity_vector_obs_encoder_1/hidden_1/SigmoidSigmoid/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd*
T0
�
+curiosity_vector_obs_encoder_1/hidden_1/MulMul/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0
;
concat/concat_dimConst*
value	B :*
dtype0
M
concat/concatIdentity)curiosity_vector_obs_encoder/hidden_1/Mul*
T0
=
concat_1/concat_dimConst*
value	B :*
dtype0
Q
concat_1/concatIdentity+curiosity_vector_obs_encoder_1/hidden_1/Mul*
T0
7
concat_2/axisConst*
value	B :*
dtype0
a
concat_2ConcatV2concat/concatconcat_1/concatconcat_2/axis*

Tidx0*
T0*
N
�
-dense/kernel/Initializer/random_uniform/shapeConst*
_class
loc:@dense/kernel*
valueB"      *
dtype0
y
+dense/kernel/Initializer/random_uniform/minConst*
_class
loc:@dense/kernel*
valueB
 *׳ݽ*
dtype0
y
+dense/kernel/Initializer/random_uniform/maxConst*
_class
loc:@dense/kernel*
valueB
 *׳�=*
dtype0
�
5dense/kernel/Initializer/random_uniform/RandomUniformRandomUniform-dense/kernel/Initializer/random_uniform/shape*
seed�*
T0*
_class
loc:@dense/kernel*
dtype0*
seed2	
�
+dense/kernel/Initializer/random_uniform/subSub+dense/kernel/Initializer/random_uniform/max+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel
�
+dense/kernel/Initializer/random_uniform/mulMul5dense/kernel/Initializer/random_uniform/RandomUniform+dense/kernel/Initializer/random_uniform/sub*
T0*
_class
loc:@dense/kernel
�
'dense/kernel/Initializer/random_uniformAdd+dense/kernel/Initializer/random_uniform/mul+dense/kernel/Initializer/random_uniform/min*
T0*
_class
loc:@dense/kernel
�
dense/kernel
VariableV2*
shape:
��*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container 
�
dense/kernel/AssignAssigndense/kernel'dense/kernel/Initializer/random_uniform*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
U
dense/kernel/readIdentitydense/kernel*
T0*
_class
loc:@dense/kernel
m
dense/bias/Initializer/zerosConst*
_class
loc:@dense/bias*
valueB�*    *
dtype0
z

dense/bias
VariableV2*
shape:�*
shared_name *
_class
loc:@dense/bias*
dtype0*
	container 
�
dense/bias/AssignAssign
dense/biasdense/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(
O
dense/bias/readIdentity
dense/bias*
T0*
_class
loc:@dense/bias
b
dense/MatMulMatMulconcat_2dense/kernel/read*
transpose_b( *
T0*
transpose_a( 
W
dense/BiasAddBiasAdddense/MatMuldense/bias/read*
T0*
data_formatNHWC
0
dense/SigmoidSigmoiddense/BiasAdd*
T0
7
	dense/MulMuldense/BiasAdddense/Sigmoid*
T0
�
/dense_1/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_1/kernel*
valueB"   
   *
dtype0
}
-dense_1/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_1/kernel*
valueB
 *���*
dtype0
}
-dense_1/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_1/kernel*
valueB
 *��>*
dtype0
�
7dense_1/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_1/kernel/Initializer/random_uniform/shape*
seed�*
T0*!
_class
loc:@dense_1/kernel*
dtype0*
seed2

�
-dense_1/kernel/Initializer/random_uniform/subSub-dense_1/kernel/Initializer/random_uniform/max-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel
�
-dense_1/kernel/Initializer/random_uniform/mulMul7dense_1/kernel/Initializer/random_uniform/RandomUniform-dense_1/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_1/kernel
�
)dense_1/kernel/Initializer/random_uniformAdd-dense_1/kernel/Initializer/random_uniform/mul-dense_1/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_1/kernel
�
dense_1/kernel
VariableV2*
shape:	�
*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
�
dense_1/kernel/AssignAssigndense_1/kernel)dense_1/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
[
dense_1/kernel/readIdentitydense_1/kernel*
T0*!
_class
loc:@dense_1/kernel
p
dense_1/bias/Initializer/zerosConst*
_class
loc:@dense_1/bias*
valueB
*    *
dtype0
}
dense_1/bias
VariableV2*
shape:
*
shared_name *
_class
loc:@dense_1/bias*
dtype0*
	container 
�
dense_1/bias/AssignAssigndense_1/biasdense_1/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
U
dense_1/bias/readIdentitydense_1/bias*
T0*
_class
loc:@dense_1/bias
g
dense_1/MatMulMatMul	dense/Muldense_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_1/BiasAddBiasAdddense_1/MatMuldense_1/bias/read*
T0*
data_formatNHWC
N
SquaredDifferenceSquaredDifferencedense_1/BiasAddStopGradient*
T0
A
Sum_2/reduction_indicesConst*
value	B :*
dtype0
^
Sum_2SumSquaredDifferenceSum_2/reduction_indices*

Tidx0*
	keep_dims( *
T0
R
DynamicPartitionDynamicPartitionSum_2Cast_2*
num_partitions*
T0
3
ConstConst*
valueB: *
dtype0
M
MeanMeanDynamicPartition:1Const*

Tidx0*
	keep_dims( *
T0
7
concat_3/axisConst*
value	B :*
dtype0
^
concat_3ConcatV2concat/concatStopGradientconcat_3/axis*

Tidx0*
T0*
N
�
/dense_2/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_2/kernel*
valueB"�      *
dtype0
}
-dense_2/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_2/kernel*
valueB
 *����*
dtype0
}
-dense_2/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_2/kernel*
valueB
 *���=*
dtype0
�
7dense_2/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_2/kernel/Initializer/random_uniform/shape*
seed�*
T0*!
_class
loc:@dense_2/kernel*
dtype0*
seed2
�
-dense_2/kernel/Initializer/random_uniform/subSub-dense_2/kernel/Initializer/random_uniform/max-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel
�
-dense_2/kernel/Initializer/random_uniform/mulMul7dense_2/kernel/Initializer/random_uniform/RandomUniform-dense_2/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_2/kernel
�
)dense_2/kernel/Initializer/random_uniformAdd-dense_2/kernel/Initializer/random_uniform/mul-dense_2/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_2/kernel
�
dense_2/kernel
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container 
�
dense_2/kernel/AssignAssigndense_2/kernel)dense_2/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
[
dense_2/kernel/readIdentitydense_2/kernel*
T0*!
_class
loc:@dense_2/kernel
q
dense_2/bias/Initializer/zerosConst*
_class
loc:@dense_2/bias*
valueB�*    *
dtype0
~
dense_2/bias
VariableV2*
shape:�*
shared_name *
_class
loc:@dense_2/bias*
dtype0*
	container 
�
dense_2/bias/AssignAssigndense_2/biasdense_2/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
U
dense_2/bias/readIdentitydense_2/bias*
T0*
_class
loc:@dense_2/bias
f
dense_2/MatMulMatMulconcat_3dense_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_2/BiasAddBiasAdddense_2/MatMuldense_2/bias/read*
T0*
data_formatNHWC
4
dense_2/SigmoidSigmoiddense_2/BiasAdd*
T0
=
dense_2/MulMuldense_2/BiasAdddense_2/Sigmoid*
T0
�
/dense_3/kernel/Initializer/random_uniform/shapeConst*!
_class
loc:@dense_3/kernel*
valueB"   �   *
dtype0
}
-dense_3/kernel/Initializer/random_uniform/minConst*!
_class
loc:@dense_3/kernel*
valueB
 *   �*
dtype0
}
-dense_3/kernel/Initializer/random_uniform/maxConst*!
_class
loc:@dense_3/kernel*
valueB
 *   >*
dtype0
�
7dense_3/kernel/Initializer/random_uniform/RandomUniformRandomUniform/dense_3/kernel/Initializer/random_uniform/shape*
seed�*
T0*!
_class
loc:@dense_3/kernel*
dtype0*
seed2
�
-dense_3/kernel/Initializer/random_uniform/subSub-dense_3/kernel/Initializer/random_uniform/max-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel
�
-dense_3/kernel/Initializer/random_uniform/mulMul7dense_3/kernel/Initializer/random_uniform/RandomUniform-dense_3/kernel/Initializer/random_uniform/sub*
T0*!
_class
loc:@dense_3/kernel
�
)dense_3/kernel/Initializer/random_uniformAdd-dense_3/kernel/Initializer/random_uniform/mul-dense_3/kernel/Initializer/random_uniform/min*
T0*!
_class
loc:@dense_3/kernel
�
dense_3/kernel
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_3/kernel*
dtype0*
	container 
�
dense_3/kernel/AssignAssigndense_3/kernel)dense_3/kernel/Initializer/random_uniform*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
[
dense_3/kernel/readIdentitydense_3/kernel*
T0*!
_class
loc:@dense_3/kernel
q
dense_3/bias/Initializer/zerosConst*
_class
loc:@dense_3/bias*
valueB�*    *
dtype0
~
dense_3/bias
VariableV2*
shape:�*
shared_name *
_class
loc:@dense_3/bias*
dtype0*
	container 
�
dense_3/bias/AssignAssigndense_3/biasdense_3/bias/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
U
dense_3/bias/readIdentitydense_3/bias*
T0*
_class
loc:@dense_3/bias
i
dense_3/MatMulMatMuldense_2/Muldense_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
]
dense_3/BiasAddBiasAdddense_3/MatMuldense_3/bias/read*
T0*
data_formatNHWC
S
SquaredDifference_1SquaredDifferencedense_3/BiasAddconcat_1/concat*
T0
A
Sum_3/reduction_indicesConst*
value	B :*
dtype0
`
Sum_3SumSquaredDifference_1Sum_3/reduction_indices*

Tidx0*
	keep_dims( *
T0
4
mul_1/xConst*
valueB
 *   ?*
dtype0
%
mul_1Mulmul_1/xSum_3*
T0
T
DynamicPartition_1DynamicPartitionmul_1Cast_2*
num_partitions*
T0
5
Const_1Const*
valueB: *
dtype0
S
Mean_1MeanDynamicPartition_1:1Const_1*

Tidx0*
	keep_dims( *
T0
4
mul_2/xConst*
valueB
 *��L>*
dtype0
&
mul_2Mulmul_2/xMean_1*
T0
4
mul_3/xConst*
valueB
 *��L?*
dtype0
$
mul_3Mulmul_3/xMean*
T0
%
add_5AddV2mul_2mul_3*
T0
4
mul_4/xConst*
valueB
 *   A*
dtype0
%
mul_4Mulmul_4/xadd_5*
T0
8
gradients/ShapeConst*
valueB *
dtype0
@
gradients/grad_ys_0Const*
valueB
 *  �?*
dtype0
W
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0
?
gradients/mul_4_grad/MulMulgradients/Filladd_5*
T0
C
gradients/mul_4_grad/Mul_1Mulgradients/Fillmul_4/x*
T0
e
%gradients/mul_4_grad/tuple/group_depsNoOp^gradients/mul_4_grad/Mul^gradients/mul_4_grad/Mul_1
�
-gradients/mul_4_grad/tuple/control_dependencyIdentitygradients/mul_4_grad/Mul&^gradients/mul_4_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/mul_4_grad/Mul
�
/gradients/mul_4_grad/tuple/control_dependency_1Identitygradients/mul_4_grad/Mul_1&^gradients/mul_4_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_4_grad/Mul_1
_
%gradients/add_5_grad/tuple/group_depsNoOp0^gradients/mul_4_grad/tuple/control_dependency_1
�
-gradients/add_5_grad/tuple/control_dependencyIdentity/gradients/mul_4_grad/tuple/control_dependency_1&^gradients/add_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_4_grad/Mul_1
�
/gradients/add_5_grad/tuple/control_dependency_1Identity/gradients/mul_4_grad/tuple/control_dependency_1&^gradients/add_5_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_4_grad/Mul_1
_
gradients/mul_2_grad/MulMul-gradients/add_5_grad/tuple/control_dependencyMean_1*
T0
b
gradients/mul_2_grad/Mul_1Mul-gradients/add_5_grad/tuple/control_dependencymul_2/x*
T0
e
%gradients/mul_2_grad/tuple/group_depsNoOp^gradients/mul_2_grad/Mul^gradients/mul_2_grad/Mul_1
�
-gradients/mul_2_grad/tuple/control_dependencyIdentitygradients/mul_2_grad/Mul&^gradients/mul_2_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/mul_2_grad/Mul
�
/gradients/mul_2_grad/tuple/control_dependency_1Identitygradients/mul_2_grad/Mul_1&^gradients/mul_2_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_2_grad/Mul_1
_
gradients/mul_3_grad/MulMul/gradients/add_5_grad/tuple/control_dependency_1Mean*
T0
d
gradients/mul_3_grad/Mul_1Mul/gradients/add_5_grad/tuple/control_dependency_1mul_3/x*
T0
e
%gradients/mul_3_grad/tuple/group_depsNoOp^gradients/mul_3_grad/Mul^gradients/mul_3_grad/Mul_1
�
-gradients/mul_3_grad/tuple/control_dependencyIdentitygradients/mul_3_grad/Mul&^gradients/mul_3_grad/tuple/group_deps*
T0*+
_class!
loc:@gradients/mul_3_grad/Mul
�
/gradients/mul_3_grad/tuple/control_dependency_1Identitygradients/mul_3_grad/Mul_1&^gradients/mul_3_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients/mul_3_grad/Mul_1
Q
#gradients/Mean_1_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients/Mean_1_grad/ReshapeReshape/gradients/mul_2_grad/tuple/control_dependency_1#gradients/Mean_1_grad/Reshape/shape*
T0*
Tshape0
S
gradients/Mean_1_grad/ShapeShapeDynamicPartition_1:1*
T0*
out_type0
y
gradients/Mean_1_grad/TileTilegradients/Mean_1_grad/Reshapegradients/Mean_1_grad/Shape*

Tmultiples0*
T0
U
gradients/Mean_1_grad/Shape_1ShapeDynamicPartition_1:1*
T0*
out_type0
F
gradients/Mean_1_grad/Shape_2Const*
valueB *
dtype0
I
gradients/Mean_1_grad/ConstConst*
valueB: *
dtype0
�
gradients/Mean_1_grad/ProdProdgradients/Mean_1_grad/Shape_1gradients/Mean_1_grad/Const*

Tidx0*
	keep_dims( *
T0
K
gradients/Mean_1_grad/Const_1Const*
valueB: *
dtype0
�
gradients/Mean_1_grad/Prod_1Prodgradients/Mean_1_grad/Shape_2gradients/Mean_1_grad/Const_1*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_1_grad/Maximum/yConst*
value	B :*
dtype0
p
gradients/Mean_1_grad/MaximumMaximumgradients/Mean_1_grad/Prod_1gradients/Mean_1_grad/Maximum/y*
T0
n
gradients/Mean_1_grad/floordivFloorDivgradients/Mean_1_grad/Prodgradients/Mean_1_grad/Maximum*
T0
j
gradients/Mean_1_grad/CastCastgradients/Mean_1_grad/floordiv*

SrcT0*
Truncate( *

DstT0
i
gradients/Mean_1_grad/truedivRealDivgradients/Mean_1_grad/Tilegradients/Mean_1_grad/Cast*
T0
O
!gradients/Mean_grad/Reshape/shapeConst*
valueB:*
dtype0
�
gradients/Mean_grad/ReshapeReshape/gradients/mul_3_grad/tuple/control_dependency_1!gradients/Mean_grad/Reshape/shape*
T0*
Tshape0
O
gradients/Mean_grad/ShapeShapeDynamicPartition:1*
T0*
out_type0
s
gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*

Tmultiples0*
T0
Q
gradients/Mean_grad/Shape_1ShapeDynamicPartition:1*
T0*
out_type0
D
gradients/Mean_grad/Shape_2Const*
valueB *
dtype0
G
gradients/Mean_grad/ConstConst*
valueB: *
dtype0
~
gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*

Tidx0*
	keep_dims( *
T0
I
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0
�
gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*

Tidx0*
	keep_dims( *
T0
G
gradients/Mean_grad/Maximum/yConst*
value	B :*
dtype0
j
gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
T0
h
gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
T0
f
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

SrcT0*
Truncate( *

DstT0
c
gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0
>
gradients/zeros_like	ZerosLikeDynamicPartition_1*
T0
Q
'gradients/DynamicPartition_1_grad/ShapeShapeCast_2*
T0*
out_type0
U
'gradients/DynamicPartition_1_grad/ConstConst*
valueB: *
dtype0
�
&gradients/DynamicPartition_1_grad/ProdProd'gradients/DynamicPartition_1_grad/Shape'gradients/DynamicPartition_1_grad/Const*

Tidx0*
	keep_dims( *
T0
W
-gradients/DynamicPartition_1_grad/range/startConst*
value	B : *
dtype0
W
-gradients/DynamicPartition_1_grad/range/deltaConst*
value	B :*
dtype0
�
'gradients/DynamicPartition_1_grad/rangeRange-gradients/DynamicPartition_1_grad/range/start&gradients/DynamicPartition_1_grad/Prod-gradients/DynamicPartition_1_grad/range/delta*

Tidx0
�
)gradients/DynamicPartition_1_grad/ReshapeReshape'gradients/DynamicPartition_1_grad/range'gradients/DynamicPartition_1_grad/Shape*
T0*
Tshape0
�
2gradients/DynamicPartition_1_grad/DynamicPartitionDynamicPartition)gradients/DynamicPartition_1_grad/ReshapeCast_2*
num_partitions*
T0
�
7gradients/DynamicPartition_1_grad/ParallelDynamicStitchParallelDynamicStitch2gradients/DynamicPartition_1_grad/DynamicPartition4gradients/DynamicPartition_1_grad/DynamicPartition:1gradients/zeros_likegradients/Mean_1_grad/truediv*
T0*
N
R
)gradients/DynamicPartition_1_grad/Shape_1Shapemul_1*
T0*
out_type0
�
+gradients/DynamicPartition_1_grad/Reshape_1Reshape7gradients/DynamicPartition_1_grad/ParallelDynamicStitch)gradients/DynamicPartition_1_grad/Shape_1*
T0*
Tshape0
>
gradients/zeros_like_1	ZerosLikeDynamicPartition*
T0
O
%gradients/DynamicPartition_grad/ShapeShapeCast_2*
T0*
out_type0
S
%gradients/DynamicPartition_grad/ConstConst*
valueB: *
dtype0
�
$gradients/DynamicPartition_grad/ProdProd%gradients/DynamicPartition_grad/Shape%gradients/DynamicPartition_grad/Const*

Tidx0*
	keep_dims( *
T0
U
+gradients/DynamicPartition_grad/range/startConst*
value	B : *
dtype0
U
+gradients/DynamicPartition_grad/range/deltaConst*
value	B :*
dtype0
�
%gradients/DynamicPartition_grad/rangeRange+gradients/DynamicPartition_grad/range/start$gradients/DynamicPartition_grad/Prod+gradients/DynamicPartition_grad/range/delta*

Tidx0
�
'gradients/DynamicPartition_grad/ReshapeReshape%gradients/DynamicPartition_grad/range%gradients/DynamicPartition_grad/Shape*
T0*
Tshape0
�
0gradients/DynamicPartition_grad/DynamicPartitionDynamicPartition'gradients/DynamicPartition_grad/ReshapeCast_2*
num_partitions*
T0
�
5gradients/DynamicPartition_grad/ParallelDynamicStitchParallelDynamicStitch0gradients/DynamicPartition_grad/DynamicPartition2gradients/DynamicPartition_grad/DynamicPartition:1gradients/zeros_like_1gradients/Mean_grad/truediv*
T0*
N
P
'gradients/DynamicPartition_grad/Shape_1ShapeSum_2*
T0*
out_type0
�
)gradients/DynamicPartition_grad/Reshape_1Reshape5gradients/DynamicPartition_grad/ParallelDynamicStitch'gradients/DynamicPartition_grad/Shape_1*
T0*
Tshape0
E
gradients/mul_1_grad/ShapeShapemul_1/x*
T0*
out_type0
E
gradients/mul_1_grad/Shape_1ShapeSum_3*
T0*
out_type0
�
*gradients/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_1_grad/Shapegradients/mul_1_grad/Shape_1*
T0
\
gradients/mul_1_grad/MulMul+gradients/DynamicPartition_1_grad/Reshape_1Sum_3*
T0
�
gradients/mul_1_grad/SumSumgradients/mul_1_grad/Mul*gradients/mul_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
t
gradients/mul_1_grad/ReshapeReshapegradients/mul_1_grad/Sumgradients/mul_1_grad/Shape*
T0*
Tshape0
`
gradients/mul_1_grad/Mul_1Mulmul_1/x+gradients/DynamicPartition_1_grad/Reshape_1*
T0
�
gradients/mul_1_grad/Sum_1Sumgradients/mul_1_grad/Mul_1,gradients/mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
z
gradients/mul_1_grad/Reshape_1Reshapegradients/mul_1_grad/Sum_1gradients/mul_1_grad/Shape_1*
T0*
Tshape0
m
%gradients/mul_1_grad/tuple/group_depsNoOp^gradients/mul_1_grad/Reshape^gradients/mul_1_grad/Reshape_1
�
-gradients/mul_1_grad/tuple/control_dependencyIdentitygradients/mul_1_grad/Reshape&^gradients/mul_1_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/mul_1_grad/Reshape
�
/gradients/mul_1_grad/tuple/control_dependency_1Identitygradients/mul_1_grad/Reshape_1&^gradients/mul_1_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/mul_1_grad/Reshape_1
O
gradients/Sum_2_grad/ShapeShapeSquaredDifference*
T0*
out_type0
r
gradients/Sum_2_grad/SizeConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_2_grad/addAddV2Sum_2/reduction_indicesgradients/Sum_2_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
�
gradients/Sum_2_grad/modFloorModgradients/Sum_2_grad/addgradients/Sum_2_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
t
gradients/Sum_2_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_2_grad/range/startConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_2_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_2_grad/rangeRange gradients/Sum_2_grad/range/startgradients/Sum_2_grad/Size gradients/Sum_2_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_2_grad/Shape
x
gradients/Sum_2_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_2_grad/FillFillgradients/Sum_2_grad/Shape_1gradients/Sum_2_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape*

index_type0
�
"gradients/Sum_2_grad/DynamicStitchDynamicStitchgradients/Sum_2_grad/rangegradients/Sum_2_grad/modgradients/Sum_2_grad/Shapegradients/Sum_2_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_2_grad/Shape*
N
�
gradients/Sum_2_grad/ReshapeReshape)gradients/DynamicPartition_grad/Reshape_1"gradients/Sum_2_grad/DynamicStitch*
T0*
Tshape0
~
 gradients/Sum_2_grad/BroadcastToBroadcastTogradients/Sum_2_grad/Reshapegradients/Sum_2_grad/Shape*

Tidx0*
T0
Q
gradients/Sum_3_grad/ShapeShapeSquaredDifference_1*
T0*
out_type0
r
gradients/Sum_3_grad/SizeConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_3_grad/addAddV2Sum_3/reduction_indicesgradients/Sum_3_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
�
gradients/Sum_3_grad/modFloorModgradients/Sum_3_grad/addgradients/Sum_3_grad/Size*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
t
gradients/Sum_3_grad/Shape_1Const*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
valueB *
dtype0
y
 gradients/Sum_3_grad/range/startConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B : *
dtype0
y
 gradients/Sum_3_grad/range/deltaConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_3_grad/rangeRange gradients/Sum_3_grad/range/startgradients/Sum_3_grad/Size gradients/Sum_3_grad/range/delta*

Tidx0*-
_class#
!loc:@gradients/Sum_3_grad/Shape
x
gradients/Sum_3_grad/Fill/valueConst*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
value	B :*
dtype0
�
gradients/Sum_3_grad/FillFillgradients/Sum_3_grad/Shape_1gradients/Sum_3_grad/Fill/value*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape*

index_type0
�
"gradients/Sum_3_grad/DynamicStitchDynamicStitchgradients/Sum_3_grad/rangegradients/Sum_3_grad/modgradients/Sum_3_grad/Shapegradients/Sum_3_grad/Fill*
T0*-
_class#
!loc:@gradients/Sum_3_grad/Shape*
N
�
gradients/Sum_3_grad/ReshapeReshape/gradients/mul_1_grad/tuple/control_dependency_1"gradients/Sum_3_grad/DynamicStitch*
T0*
Tshape0
~
 gradients/Sum_3_grad/BroadcastToBroadcastTogradients/Sum_3_grad/Reshapegradients/Sum_3_grad/Shape*

Tidx0*
T0
w
'gradients/SquaredDifference_grad/scalarConst!^gradients/Sum_2_grad/BroadcastTo*
valueB
 *   @*
dtype0

$gradients/SquaredDifference_grad/MulMul'gradients/SquaredDifference_grad/scalar gradients/Sum_2_grad/BroadcastTo*
T0
v
$gradients/SquaredDifference_grad/subSubdense_1/BiasAddStopGradient!^gradients/Sum_2_grad/BroadcastTo*
T0
�
&gradients/SquaredDifference_grad/mul_1Mul$gradients/SquaredDifference_grad/Mul$gradients/SquaredDifference_grad/sub*
T0
Y
&gradients/SquaredDifference_grad/ShapeShapedense_1/BiasAdd*
T0*
out_type0
X
(gradients/SquaredDifference_grad/Shape_1ShapeStopGradient*
T0*
out_type0
�
6gradients/SquaredDifference_grad/BroadcastGradientArgsBroadcastGradientArgs&gradients/SquaredDifference_grad/Shape(gradients/SquaredDifference_grad/Shape_1*
T0
�
$gradients/SquaredDifference_grad/SumSum&gradients/SquaredDifference_grad/mul_16gradients/SquaredDifference_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
(gradients/SquaredDifference_grad/ReshapeReshape$gradients/SquaredDifference_grad/Sum&gradients/SquaredDifference_grad/Shape*
T0*
Tshape0
�
&gradients/SquaredDifference_grad/Sum_1Sum&gradients/SquaredDifference_grad/mul_18gradients/SquaredDifference_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
*gradients/SquaredDifference_grad/Reshape_1Reshape&gradients/SquaredDifference_grad/Sum_1(gradients/SquaredDifference_grad/Shape_1*
T0*
Tshape0
`
$gradients/SquaredDifference_grad/NegNeg*gradients/SquaredDifference_grad/Reshape_1*
T0
�
1gradients/SquaredDifference_grad/tuple/group_depsNoOp%^gradients/SquaredDifference_grad/Neg)^gradients/SquaredDifference_grad/Reshape
�
9gradients/SquaredDifference_grad/tuple/control_dependencyIdentity(gradients/SquaredDifference_grad/Reshape2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/SquaredDifference_grad/Reshape
�
;gradients/SquaredDifference_grad/tuple/control_dependency_1Identity$gradients/SquaredDifference_grad/Neg2^gradients/SquaredDifference_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/SquaredDifference_grad/Neg
y
)gradients/SquaredDifference_1_grad/scalarConst!^gradients/Sum_3_grad/BroadcastTo*
valueB
 *   @*
dtype0
�
&gradients/SquaredDifference_1_grad/MulMul)gradients/SquaredDifference_1_grad/scalar gradients/Sum_3_grad/BroadcastTo*
T0
{
&gradients/SquaredDifference_1_grad/subSubdense_3/BiasAddconcat_1/concat!^gradients/Sum_3_grad/BroadcastTo*
T0
�
(gradients/SquaredDifference_1_grad/mul_1Mul&gradients/SquaredDifference_1_grad/Mul&gradients/SquaredDifference_1_grad/sub*
T0
[
(gradients/SquaredDifference_1_grad/ShapeShapedense_3/BiasAdd*
T0*
out_type0
]
*gradients/SquaredDifference_1_grad/Shape_1Shapeconcat_1/concat*
T0*
out_type0
�
8gradients/SquaredDifference_1_grad/BroadcastGradientArgsBroadcastGradientArgs(gradients/SquaredDifference_1_grad/Shape*gradients/SquaredDifference_1_grad/Shape_1*
T0
�
&gradients/SquaredDifference_1_grad/SumSum(gradients/SquaredDifference_1_grad/mul_18gradients/SquaredDifference_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
*gradients/SquaredDifference_1_grad/ReshapeReshape&gradients/SquaredDifference_1_grad/Sum(gradients/SquaredDifference_1_grad/Shape*
T0*
Tshape0
�
(gradients/SquaredDifference_1_grad/Sum_1Sum(gradients/SquaredDifference_1_grad/mul_1:gradients/SquaredDifference_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
,gradients/SquaredDifference_1_grad/Reshape_1Reshape(gradients/SquaredDifference_1_grad/Sum_1*gradients/SquaredDifference_1_grad/Shape_1*
T0*
Tshape0
d
&gradients/SquaredDifference_1_grad/NegNeg,gradients/SquaredDifference_1_grad/Reshape_1*
T0
�
3gradients/SquaredDifference_1_grad/tuple/group_depsNoOp'^gradients/SquaredDifference_1_grad/Neg+^gradients/SquaredDifference_1_grad/Reshape
�
;gradients/SquaredDifference_1_grad/tuple/control_dependencyIdentity*gradients/SquaredDifference_1_grad/Reshape4^gradients/SquaredDifference_1_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_1_grad/Reshape
�
=gradients/SquaredDifference_1_grad/tuple/control_dependency_1Identity&gradients/SquaredDifference_1_grad/Neg4^gradients/SquaredDifference_1_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/SquaredDifference_1_grad/Neg
�
*gradients/dense_1/BiasAdd_grad/BiasAddGradBiasAddGrad9gradients/SquaredDifference_grad/tuple/control_dependency*
T0*
data_formatNHWC
�
/gradients/dense_1/BiasAdd_grad/tuple/group_depsNoOp:^gradients/SquaredDifference_grad/tuple/control_dependency+^gradients/dense_1/BiasAdd_grad/BiasAddGrad
�
7gradients/dense_1/BiasAdd_grad/tuple/control_dependencyIdentity9gradients/SquaredDifference_grad/tuple/control_dependency0^gradients/dense_1/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/SquaredDifference_grad/Reshape
�
9gradients/dense_1/BiasAdd_grad/tuple/control_dependency_1Identity*gradients/dense_1/BiasAdd_grad/BiasAddGrad0^gradients/dense_1/BiasAdd_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/dense_1/BiasAdd_grad/BiasAddGrad
�
*gradients/dense_3/BiasAdd_grad/BiasAddGradBiasAddGrad;gradients/SquaredDifference_1_grad/tuple/control_dependency*
T0*
data_formatNHWC
�
/gradients/dense_3/BiasAdd_grad/tuple/group_depsNoOp<^gradients/SquaredDifference_1_grad/tuple/control_dependency+^gradients/dense_3/BiasAdd_grad/BiasAddGrad
�
7gradients/dense_3/BiasAdd_grad/tuple/control_dependencyIdentity;gradients/SquaredDifference_1_grad/tuple/control_dependency0^gradients/dense_3/BiasAdd_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/SquaredDifference_1_grad/Reshape
�
9gradients/dense_3/BiasAdd_grad/tuple/control_dependency_1Identity*gradients/dense_3/BiasAdd_grad/BiasAddGrad0^gradients/dense_3/BiasAdd_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/dense_3/BiasAdd_grad/BiasAddGrad
�
$gradients/dense_1/MatMul_grad/MatMulMatMul7gradients/dense_1/BiasAdd_grad/tuple/control_dependencydense_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
&gradients/dense_1/MatMul_grad/MatMul_1MatMul	dense/Mul7gradients/dense_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
.gradients/dense_1/MatMul_grad/tuple/group_depsNoOp%^gradients/dense_1/MatMul_grad/MatMul'^gradients/dense_1/MatMul_grad/MatMul_1
�
6gradients/dense_1/MatMul_grad/tuple/control_dependencyIdentity$gradients/dense_1/MatMul_grad/MatMul/^gradients/dense_1/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense_1/MatMul_grad/MatMul
�
8gradients/dense_1/MatMul_grad/tuple/control_dependency_1Identity&gradients/dense_1/MatMul_grad/MatMul_1/^gradients/dense_1/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/dense_1/MatMul_grad/MatMul_1
�
$gradients/dense_3/MatMul_grad/MatMulMatMul7gradients/dense_3/BiasAdd_grad/tuple/control_dependencydense_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
&gradients/dense_3/MatMul_grad/MatMul_1MatMuldense_2/Mul7gradients/dense_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
.gradients/dense_3/MatMul_grad/tuple/group_depsNoOp%^gradients/dense_3/MatMul_grad/MatMul'^gradients/dense_3/MatMul_grad/MatMul_1
�
6gradients/dense_3/MatMul_grad/tuple/control_dependencyIdentity$gradients/dense_3/MatMul_grad/MatMul/^gradients/dense_3/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense_3/MatMul_grad/MatMul
�
8gradients/dense_3/MatMul_grad/tuple/control_dependency_1Identity&gradients/dense_3/MatMul_grad/MatMul_1/^gradients/dense_3/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/dense_3/MatMul_grad/MatMul_1
O
gradients/dense/Mul_grad/ShapeShapedense/BiasAdd*
T0*
out_type0
Q
 gradients/dense/Mul_grad/Shape_1Shapedense/Sigmoid*
T0*
out_type0
�
.gradients/dense/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/dense/Mul_grad/Shape gradients/dense/Mul_grad/Shape_1*
T0
s
gradients/dense/Mul_grad/MulMul6gradients/dense_1/MatMul_grad/tuple/control_dependencydense/Sigmoid*
T0
�
gradients/dense/Mul_grad/SumSumgradients/dense/Mul_grad/Mul.gradients/dense/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
 gradients/dense/Mul_grad/ReshapeReshapegradients/dense/Mul_grad/Sumgradients/dense/Mul_grad/Shape*
T0*
Tshape0
u
gradients/dense/Mul_grad/Mul_1Muldense/BiasAdd6gradients/dense_1/MatMul_grad/tuple/control_dependency*
T0
�
gradients/dense/Mul_grad/Sum_1Sumgradients/dense/Mul_grad/Mul_10gradients/dense/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
"gradients/dense/Mul_grad/Reshape_1Reshapegradients/dense/Mul_grad/Sum_1 gradients/dense/Mul_grad/Shape_1*
T0*
Tshape0
y
)gradients/dense/Mul_grad/tuple/group_depsNoOp!^gradients/dense/Mul_grad/Reshape#^gradients/dense/Mul_grad/Reshape_1
�
1gradients/dense/Mul_grad/tuple/control_dependencyIdentity gradients/dense/Mul_grad/Reshape*^gradients/dense/Mul_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/dense/Mul_grad/Reshape
�
3gradients/dense/Mul_grad/tuple/control_dependency_1Identity"gradients/dense/Mul_grad/Reshape_1*^gradients/dense/Mul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense/Mul_grad/Reshape_1
S
 gradients/dense_2/Mul_grad/ShapeShapedense_2/BiasAdd*
T0*
out_type0
U
"gradients/dense_2/Mul_grad/Shape_1Shapedense_2/Sigmoid*
T0*
out_type0
�
0gradients/dense_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs gradients/dense_2/Mul_grad/Shape"gradients/dense_2/Mul_grad/Shape_1*
T0
w
gradients/dense_2/Mul_grad/MulMul6gradients/dense_3/MatMul_grad/tuple/control_dependencydense_2/Sigmoid*
T0
�
gradients/dense_2/Mul_grad/SumSumgradients/dense_2/Mul_grad/Mul0gradients/dense_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
"gradients/dense_2/Mul_grad/ReshapeReshapegradients/dense_2/Mul_grad/Sum gradients/dense_2/Mul_grad/Shape*
T0*
Tshape0
y
 gradients/dense_2/Mul_grad/Mul_1Muldense_2/BiasAdd6gradients/dense_3/MatMul_grad/tuple/control_dependency*
T0
�
 gradients/dense_2/Mul_grad/Sum_1Sum gradients/dense_2/Mul_grad/Mul_12gradients/dense_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
$gradients/dense_2/Mul_grad/Reshape_1Reshape gradients/dense_2/Mul_grad/Sum_1"gradients/dense_2/Mul_grad/Shape_1*
T0*
Tshape0

+gradients/dense_2/Mul_grad/tuple/group_depsNoOp#^gradients/dense_2/Mul_grad/Reshape%^gradients/dense_2/Mul_grad/Reshape_1
�
3gradients/dense_2/Mul_grad/tuple/control_dependencyIdentity"gradients/dense_2/Mul_grad/Reshape,^gradients/dense_2/Mul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense_2/Mul_grad/Reshape
�
5gradients/dense_2/Mul_grad/tuple/control_dependency_1Identity$gradients/dense_2/Mul_grad/Reshape_1,^gradients/dense_2/Mul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense_2/Mul_grad/Reshape_1
�
(gradients/dense/Sigmoid_grad/SigmoidGradSigmoidGraddense/Sigmoid3gradients/dense/Mul_grad/tuple/control_dependency_1*
T0
�
*gradients/dense_2/Sigmoid_grad/SigmoidGradSigmoidGraddense_2/Sigmoid5gradients/dense_2/Mul_grad/tuple/control_dependency_1*
T0
�
gradients/AddNAddN1gradients/dense/Mul_grad/tuple/control_dependency(gradients/dense/Sigmoid_grad/SigmoidGrad*
T0*3
_class)
'%loc:@gradients/dense/Mul_grad/Reshape*
N
g
(gradients/dense/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN*
T0*
data_formatNHWC
q
-gradients/dense/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN)^gradients/dense/BiasAdd_grad/BiasAddGrad
�
5gradients/dense/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN.^gradients/dense/BiasAdd_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients/dense/Mul_grad/Reshape
�
7gradients/dense/BiasAdd_grad/tuple/control_dependency_1Identity(gradients/dense/BiasAdd_grad/BiasAddGrad.^gradients/dense/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients/dense/BiasAdd_grad/BiasAddGrad
�
gradients/AddN_1AddN3gradients/dense_2/Mul_grad/tuple/control_dependency*gradients/dense_2/Sigmoid_grad/SigmoidGrad*
T0*5
_class+
)'loc:@gradients/dense_2/Mul_grad/Reshape*
N
k
*gradients/dense_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_1*
T0*
data_formatNHWC
w
/gradients/dense_2/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_1+^gradients/dense_2/BiasAdd_grad/BiasAddGrad
�
7gradients/dense_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_10^gradients/dense_2/BiasAdd_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense_2/Mul_grad/Reshape
�
9gradients/dense_2/BiasAdd_grad/tuple/control_dependency_1Identity*gradients/dense_2/BiasAdd_grad/BiasAddGrad0^gradients/dense_2/BiasAdd_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients/dense_2/BiasAdd_grad/BiasAddGrad
�
"gradients/dense/MatMul_grad/MatMulMatMul5gradients/dense/BiasAdd_grad/tuple/control_dependencydense/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
$gradients/dense/MatMul_grad/MatMul_1MatMulconcat_25gradients/dense/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
,gradients/dense/MatMul_grad/tuple/group_depsNoOp#^gradients/dense/MatMul_grad/MatMul%^gradients/dense/MatMul_grad/MatMul_1
�
4gradients/dense/MatMul_grad/tuple/control_dependencyIdentity"gradients/dense/MatMul_grad/MatMul-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*5
_class+
)'loc:@gradients/dense/MatMul_grad/MatMul
�
6gradients/dense/MatMul_grad/tuple/control_dependency_1Identity$gradients/dense/MatMul_grad/MatMul_1-^gradients/dense/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense/MatMul_grad/MatMul_1
�
$gradients/dense_2/MatMul_grad/MatMulMatMul7gradients/dense_2/BiasAdd_grad/tuple/control_dependencydense_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
&gradients/dense_2/MatMul_grad/MatMul_1MatMulconcat_37gradients/dense_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
.gradients/dense_2/MatMul_grad/tuple/group_depsNoOp%^gradients/dense_2/MatMul_grad/MatMul'^gradients/dense_2/MatMul_grad/MatMul_1
�
6gradients/dense_2/MatMul_grad/tuple/control_dependencyIdentity$gradients/dense_2/MatMul_grad/MatMul/^gradients/dense_2/MatMul_grad/tuple/group_deps*
T0*7
_class-
+)loc:@gradients/dense_2/MatMul_grad/MatMul
�
8gradients/dense_2/MatMul_grad/tuple/control_dependency_1Identity&gradients/dense_2/MatMul_grad/MatMul_1/^gradients/dense_2/MatMul_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients/dense_2/MatMul_grad/MatMul_1
F
gradients/concat_2_grad/RankConst*
value	B :*
dtype0
]
gradients/concat_2_grad/modFloorModconcat_2/axisgradients/concat_2_grad/Rank*
T0
N
gradients/concat_2_grad/ShapeShapeconcat/concat*
T0*
out_type0
j
gradients/concat_2_grad/ShapeNShapeNconcat/concatconcat_1/concat*
T0*
out_type0*
N
�
$gradients/concat_2_grad/ConcatOffsetConcatOffsetgradients/concat_2_grad/modgradients/concat_2_grad/ShapeN gradients/concat_2_grad/ShapeN:1*
N
�
gradients/concat_2_grad/SliceSlice4gradients/dense/MatMul_grad/tuple/control_dependency$gradients/concat_2_grad/ConcatOffsetgradients/concat_2_grad/ShapeN*
T0*
Index0
�
gradients/concat_2_grad/Slice_1Slice4gradients/dense/MatMul_grad/tuple/control_dependency&gradients/concat_2_grad/ConcatOffset:1 gradients/concat_2_grad/ShapeN:1*
T0*
Index0
r
(gradients/concat_2_grad/tuple/group_depsNoOp^gradients/concat_2_grad/Slice ^gradients/concat_2_grad/Slice_1
�
0gradients/concat_2_grad/tuple/control_dependencyIdentitygradients/concat_2_grad/Slice)^gradients/concat_2_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/concat_2_grad/Slice
�
2gradients/concat_2_grad/tuple/control_dependency_1Identitygradients/concat_2_grad/Slice_1)^gradients/concat_2_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/concat_2_grad/Slice_1
F
gradients/concat_3_grad/RankConst*
value	B :*
dtype0
]
gradients/concat_3_grad/modFloorModconcat_3/axisgradients/concat_3_grad/Rank*
T0
N
gradients/concat_3_grad/ShapeShapeconcat/concat*
T0*
out_type0
g
gradients/concat_3_grad/ShapeNShapeNconcat/concatStopGradient*
T0*
out_type0*
N
�
$gradients/concat_3_grad/ConcatOffsetConcatOffsetgradients/concat_3_grad/modgradients/concat_3_grad/ShapeN gradients/concat_3_grad/ShapeN:1*
N
�
gradients/concat_3_grad/SliceSlice6gradients/dense_2/MatMul_grad/tuple/control_dependency$gradients/concat_3_grad/ConcatOffsetgradients/concat_3_grad/ShapeN*
T0*
Index0
�
gradients/concat_3_grad/Slice_1Slice6gradients/dense_2/MatMul_grad/tuple/control_dependency&gradients/concat_3_grad/ConcatOffset:1 gradients/concat_3_grad/ShapeN:1*
T0*
Index0
r
(gradients/concat_3_grad/tuple/group_depsNoOp^gradients/concat_3_grad/Slice ^gradients/concat_3_grad/Slice_1
�
0gradients/concat_3_grad/tuple/control_dependencyIdentitygradients/concat_3_grad/Slice)^gradients/concat_3_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients/concat_3_grad/Slice
�
2gradients/concat_3_grad/tuple/control_dependency_1Identitygradients/concat_3_grad/Slice_1)^gradients/concat_3_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients/concat_3_grad/Slice_1
�
gradients/AddN_2AddN=gradients/SquaredDifference_1_grad/tuple/control_dependency_12gradients/concat_2_grad/tuple/control_dependency_1*
T0*9
_class/
-+loc:@gradients/SquaredDifference_1_grad/Neg*
N
�
gradients/AddN_3AddN0gradients/concat_2_grad/tuple/control_dependency0gradients/concat_3_grad/tuple/control_dependency*
T0*0
_class&
$"loc:@gradients/concat_2_grad/Slice*
N
�
gradients/AddN_4AddN;gradients/SquaredDifference_grad/tuple/control_dependency_12gradients/concat_3_grad/tuple/control_dependency_1*
T0*7
_class-
+)loc:@gradients/SquaredDifference_grad/Neg*
N
�
@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ShapeShape/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd*
T0*
out_type0
�
Bgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1Shape/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0*
out_type0
�
Pgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ShapeBgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1*
T0
�
>gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/MulMulgradients/AddN_2/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid*
T0
�
>gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/SumSum>gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/MulPgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Bgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeReshape>gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Sum@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Mul_1Mul/curiosity_vector_obs_encoder_1/hidden_1/BiasAddgradients/AddN_2*
T0
�
@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Sum_1Sum@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Mul_1Rgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Dgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1Reshape@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Sum_1Bgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Kgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_depsNoOpC^gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeE^gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1
�
Sgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependencyIdentityBgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/ReshapeL^gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape
�
Ugradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependency_1IdentityDgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1L^gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape_1
�
>gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ShapeShape-curiosity_vector_obs_encoder/hidden_1/BiasAdd*
T0*
out_type0
�
@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1Shape-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0*
out_type0
�
Ngradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs>gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1*
T0
�
<gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/MulMulgradients/AddN_3-curiosity_vector_obs_encoder/hidden_1/Sigmoid*
T0
�
<gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/SumSum<gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/MulNgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeReshape<gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum>gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
>gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Mul_1Mul-curiosity_vector_obs_encoder/hidden_1/BiasAddgradients/AddN_3*
T0
�
>gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum_1Sum>gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Mul_1Pgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Bgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1Reshape>gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Sum_1@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Igradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_depsNoOpA^gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeC^gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1
�
Qgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependencyIdentity@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/ReshapeJ^gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape
�
Sgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependency_1IdentityBgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1J^gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape_1
�
Jgradients/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad/curiosity_vector_obs_encoder_1/hidden_1/SigmoidUgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
Hgradients/curiosity_vector_obs_encoder/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad-curiosity_vector_obs_encoder/hidden_1/SigmoidSgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
gradients/AddN_5AddNSgradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/tuple/control_dependencyJgradients/curiosity_vector_obs_encoder_1/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape*
N
�
Jgradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_5*
T0*
data_formatNHWC
�
Ogradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_5K^gradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGrad
�
Wgradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_5P^gradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/Mul_grad/Reshape
�
Ygradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityJgradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGradP^gradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*]
_classS
QOloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGrad
�
gradients/AddN_6AddNQgradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/tuple/control_dependencyHgradients/curiosity_vector_obs_encoder/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*S
_classI
GEloc:@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape*
N
�
Hgradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_6*
T0*
data_formatNHWC
�
Mgradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_6I^gradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
Ugradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_6N^gradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients/curiosity_vector_obs_encoder/hidden_1/Mul_grad/Reshape
�
Wgradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityHgradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGradN^gradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
Dgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulMatMulWgradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Fgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1MatMul+curiosity_vector_obs_encoder_1/hidden_0/MulWgradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Ngradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_depsNoOpE^gradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulG^gradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1
�
Vgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependencyIdentityDgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMulO^gradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul
�
Xgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityFgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1O^gradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1
�
Bgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulMatMulUgradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Dgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1MatMul)curiosity_vector_obs_encoder/hidden_0/MulUgradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Lgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_depsNoOpC^gradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulE^gradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1
�
Tgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependencyIdentityBgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMulM^gradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul
�
Vgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityDgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1M^gradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/MatMul_1
�
gradients/AddN_7AddNYgradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/tuple/control_dependency_1Wgradients/curiosity_vector_obs_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
T0*]
_classS
QOloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/BiasAdd_grad/BiasAddGrad*
N
�
@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ShapeShape/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd*
T0*
out_type0
�
Bgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1Shape/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0*
out_type0
�
Pgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ShapeBgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1*
T0
�
>gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/MulMulVgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid*
T0
�
>gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/SumSum>gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/MulPgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Bgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeReshape>gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Sum@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Mul_1Mul/curiosity_vector_obs_encoder_1/hidden_0/BiasAddVgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Sum_1Sum@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Mul_1Rgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Dgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1Reshape@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Sum_1Bgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Kgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_depsNoOpC^gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeE^gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1
�
Sgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependencyIdentityBgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/ReshapeL^gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape
�
Ugradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependency_1IdentityDgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1L^gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape_1
�
>gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ShapeShape-curiosity_vector_obs_encoder/hidden_0/BiasAdd*
T0*
out_type0
�
@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1Shape-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0*
out_type0
�
Ngradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs>gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1*
T0
�
<gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/MulMulTgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency-curiosity_vector_obs_encoder/hidden_0/Sigmoid*
T0
�
<gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/SumSum<gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/MulNgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeReshape<gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum>gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
>gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Mul_1Mul-curiosity_vector_obs_encoder/hidden_0/BiasAddTgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
>gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum_1Sum>gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Mul_1Pgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Bgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1Reshape>gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Sum_1@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Igradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_depsNoOpA^gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeC^gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1
�
Qgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependencyIdentity@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/ReshapeJ^gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape
�
Sgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependency_1IdentityBgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1J^gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape_1
�
gradients/AddN_8AddNXgradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/tuple/control_dependency_1Vgradients/curiosity_vector_obs_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1*
T0*Y
_classO
MKloc:@gradients/curiosity_vector_obs_encoder_1/hidden_1/MatMul_grad/MatMul_1*
N
�
Jgradients/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad/curiosity_vector_obs_encoder_1/hidden_0/SigmoidUgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
Hgradients/curiosity_vector_obs_encoder/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad-curiosity_vector_obs_encoder/hidden_0/SigmoidSgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
gradients/AddN_9AddNSgradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/tuple/control_dependencyJgradients/curiosity_vector_obs_encoder_1/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape*
N
�
Jgradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_9*
T0*
data_formatNHWC
�
Ogradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_9K^gradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGrad
�
Wgradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_9P^gradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/Mul_grad/Reshape
�
Ygradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityJgradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGradP^gradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*]
_classS
QOloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGrad
�
gradients/AddN_10AddNQgradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/tuple/control_dependencyHgradients/curiosity_vector_obs_encoder/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*S
_classI
GEloc:@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape*
N
�
Hgradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients/AddN_10*
T0*
data_formatNHWC
�
Mgradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients/AddN_10I^gradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
Ugradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients/AddN_10N^gradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients/curiosity_vector_obs_encoder/hidden_0/Mul_grad/Reshape
�
Wgradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityHgradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGradN^gradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
Dgradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulMatMulWgradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Fgradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1MatMul!curiosity_next_vector_observationWgradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Ngradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_depsNoOpE^gradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulG^gradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1
�
Vgradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependencyIdentityDgradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMulO^gradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul
�
Xgradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityFgradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1O^gradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1
�
Bgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulMatMulUgradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency1curiosity_vector_obs_encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Dgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1MatMulvector_observationUgradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Lgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_depsNoOpC^gradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulE^gradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1
�
Tgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependencyIdentityBgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMulM^gradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul
�
Vgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityDgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1M^gradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/MatMul_1
�
gradients/AddN_11AddNYgradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/tuple/control_dependency_1Wgradients/curiosity_vector_obs_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
T0*]
_classS
QOloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/BiasAdd_grad/BiasAddGrad*
N
�
gradients/AddN_12AddNXgradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/tuple/control_dependency_1Vgradients/curiosity_vector_obs_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1*
T0*Y
_classO
MKloc:@gradients/curiosity_vector_obs_encoder_1/hidden_0/MatMul_grad/MatMul_1*
N
�
beta1_power/initial_valueConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB
 *fff?*
dtype0
�
beta1_power
VariableV2*
shape: *
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
�
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
q
beta1_power/readIdentitybeta1_power*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
beta2_power/initial_valueConst*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
valueB
 *w�?*
dtype0
�
beta2_power
VariableV2*
shape: *
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
�
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
q
beta2_power/readIdentitybeta2_power*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Scuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"N   �   *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
�
Icuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
�
Ccuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zerosFillScuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/shape_as_tensorIcuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
1curiosity_vector_obs_encoder/hidden_0/kernel/Adam
VariableV2*
shape:	N�*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
	container 
�
8curiosity_vector_obs_encoder/hidden_0/kernel/Adam/AssignAssign1curiosity_vector_obs_encoder/hidden_0/kernel/AdamCcuriosity_vector_obs_encoder/hidden_0/kernel/Adam/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
6curiosity_vector_obs_encoder/hidden_0/kernel/Adam/readIdentity1curiosity_vector_obs_encoder/hidden_0/kernel/Adam*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
Ucuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"N   �   *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
�
Kcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0
�
Ecuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zerosFillUcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/shape_as_tensorKcuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1
VariableV2*
shape:	N�*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
dtype0*
	container 
�
:curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/AssignAssign3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1Ecuriosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
8curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/readIdentity3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel
�
Acuriosity_vector_obs_encoder/hidden_0/bias/Adam/Initializer/zerosConst*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0
�
/curiosity_vector_obs_encoder/hidden_0/bias/Adam
VariableV2*
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
�
6curiosity_vector_obs_encoder/hidden_0/bias/Adam/AssignAssign/curiosity_vector_obs_encoder/hidden_0/bias/AdamAcuriosity_vector_obs_encoder/hidden_0/bias/Adam/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
4curiosity_vector_obs_encoder/hidden_0/bias/Adam/readIdentity/curiosity_vector_obs_encoder/hidden_0/bias/Adam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Ccuriosity_vector_obs_encoder/hidden_0/bias/Adam_1/Initializer/zerosConst*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0
�
1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1
VariableV2*
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
dtype0*
	container 
�
8curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/AssignAssign1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1Ccuriosity_vector_obs_encoder/hidden_0/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
6curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/readIdentity1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Scuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"�   �   *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Icuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Ccuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zerosFillScuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/shape_as_tensorIcuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
1curiosity_vector_obs_encoder/hidden_1/kernel/Adam
VariableV2*
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container 
�
8curiosity_vector_obs_encoder/hidden_1/kernel/Adam/AssignAssign1curiosity_vector_obs_encoder/hidden_1/kernel/AdamCcuriosity_vector_obs_encoder/hidden_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
6curiosity_vector_obs_encoder/hidden_1/kernel/Adam/readIdentity1curiosity_vector_obs_encoder/hidden_1/kernel/Adam*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
Ucuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"�   �   *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Kcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0
�
Ecuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zerosFillUcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorKcuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1
VariableV2*
shape:
��*
shared_name *?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
dtype0*
	container 
�
:curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/AssignAssign3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1Ecuriosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
8curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/readIdentity3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel
�
Acuriosity_vector_obs_encoder/hidden_1/bias/Adam/Initializer/zerosConst*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0
�
/curiosity_vector_obs_encoder/hidden_1/bias/Adam
VariableV2*
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container 
�
6curiosity_vector_obs_encoder/hidden_1/bias/Adam/AssignAssign/curiosity_vector_obs_encoder/hidden_1/bias/AdamAcuriosity_vector_obs_encoder/hidden_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
4curiosity_vector_obs_encoder/hidden_1/bias/Adam/readIdentity/curiosity_vector_obs_encoder/hidden_1/bias/Adam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
Ccuriosity_vector_obs_encoder/hidden_1/bias/Adam_1/Initializer/zerosConst*
valueB�*    *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0
�
1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1
VariableV2*
shape:�*
shared_name *=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
dtype0*
	container 
�
8curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/AssignAssign1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1Ccuriosity_vector_obs_encoder/hidden_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
6curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/readIdentity1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias
�
3dense/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"      *
_class
loc:@dense/kernel*
dtype0
w
)dense/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *
_class
loc:@dense/kernel*
dtype0
�
#dense/kernel/Adam/Initializer/zerosFill3dense/kernel/Adam/Initializer/zeros/shape_as_tensor)dense/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*
_class
loc:@dense/kernel
�
dense/kernel/Adam
VariableV2*
shape:
��*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container 
�
dense/kernel/Adam/AssignAssigndense/kernel/Adam#dense/kernel/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
_
dense/kernel/Adam/readIdentitydense/kernel/Adam*
T0*
_class
loc:@dense/kernel
�
5dense/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *
_class
loc:@dense/kernel*
dtype0
y
+dense/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *
_class
loc:@dense/kernel*
dtype0
�
%dense/kernel/Adam_1/Initializer/zerosFill5dense/kernel/Adam_1/Initializer/zeros/shape_as_tensor+dense/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*
_class
loc:@dense/kernel
�
dense/kernel/Adam_1
VariableV2*
shape:
��*
shared_name *
_class
loc:@dense/kernel*
dtype0*
	container 
�
dense/kernel/Adam_1/AssignAssigndense/kernel/Adam_1%dense/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
c
dense/kernel/Adam_1/readIdentitydense/kernel/Adam_1*
T0*
_class
loc:@dense/kernel
r
!dense/bias/Adam/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense/bias*
dtype0

dense/bias/Adam
VariableV2*
shape:�*
shared_name *
_class
loc:@dense/bias*
dtype0*
	container 
�
dense/bias/Adam/AssignAssigndense/bias/Adam!dense/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(
Y
dense/bias/Adam/readIdentitydense/bias/Adam*
T0*
_class
loc:@dense/bias
t
#dense/bias/Adam_1/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense/bias*
dtype0
�
dense/bias/Adam_1
VariableV2*
shape:�*
shared_name *
_class
loc:@dense/bias*
dtype0*
	container 
�
dense/bias/Adam_1/AssignAssigndense/bias/Adam_1#dense/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(
]
dense/bias/Adam_1/readIdentitydense/bias/Adam_1*
T0*
_class
loc:@dense/bias
�
5dense_1/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"   
   *!
_class
loc:@dense_1/kernel*
dtype0
{
+dense_1/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_1/kernel*
dtype0
�
%dense_1/kernel/Adam/Initializer/zerosFill5dense_1/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_1/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_1/kernel
�
dense_1/kernel/Adam
VariableV2*
shape:	�
*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
�
dense_1/kernel/Adam/AssignAssigndense_1/kernel/Adam%dense_1/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
e
dense_1/kernel/Adam/readIdentitydense_1/kernel/Adam*
T0*!
_class
loc:@dense_1/kernel
�
7dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"   
   *!
_class
loc:@dense_1/kernel*
dtype0
}
-dense_1/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_1/kernel*
dtype0
�
'dense_1/kernel/Adam_1/Initializer/zerosFill7dense_1/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_1/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_1/kernel
�
dense_1/kernel/Adam_1
VariableV2*
shape:	�
*
shared_name *!
_class
loc:@dense_1/kernel*
dtype0*
	container 
�
dense_1/kernel/Adam_1/AssignAssigndense_1/kernel/Adam_1'dense_1/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
i
dense_1/kernel/Adam_1/readIdentitydense_1/kernel/Adam_1*
T0*!
_class
loc:@dense_1/kernel
u
#dense_1/bias/Adam/Initializer/zerosConst*
valueB
*    *
_class
loc:@dense_1/bias*
dtype0
�
dense_1/bias/Adam
VariableV2*
shape:
*
shared_name *
_class
loc:@dense_1/bias*
dtype0*
	container 
�
dense_1/bias/Adam/AssignAssigndense_1/bias/Adam#dense_1/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
_
dense_1/bias/Adam/readIdentitydense_1/bias/Adam*
T0*
_class
loc:@dense_1/bias
w
%dense_1/bias/Adam_1/Initializer/zerosConst*
valueB
*    *
_class
loc:@dense_1/bias*
dtype0
�
dense_1/bias/Adam_1
VariableV2*
shape:
*
shared_name *
_class
loc:@dense_1/bias*
dtype0*
	container 
�
dense_1/bias/Adam_1/AssignAssigndense_1/bias/Adam_1%dense_1/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
c
dense_1/bias/Adam_1/readIdentitydense_1/bias/Adam_1*
T0*
_class
loc:@dense_1/bias
�
5dense_2/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"�      *!
_class
loc:@dense_2/kernel*
dtype0
{
+dense_2/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_2/kernel*
dtype0
�
%dense_2/kernel/Adam/Initializer/zerosFill5dense_2/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_2/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_2/kernel
�
dense_2/kernel/Adam
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container 
�
dense_2/kernel/Adam/AssignAssigndense_2/kernel/Adam%dense_2/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
e
dense_2/kernel/Adam/readIdentitydense_2/kernel/Adam*
T0*!
_class
loc:@dense_2/kernel
�
7dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"�      *!
_class
loc:@dense_2/kernel*
dtype0
}
-dense_2/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_2/kernel*
dtype0
�
'dense_2/kernel/Adam_1/Initializer/zerosFill7dense_2/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_2/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_2/kernel
�
dense_2/kernel/Adam_1
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_2/kernel*
dtype0*
	container 
�
dense_2/kernel/Adam_1/AssignAssigndense_2/kernel/Adam_1'dense_2/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
i
dense_2/kernel/Adam_1/readIdentitydense_2/kernel/Adam_1*
T0*!
_class
loc:@dense_2/kernel
v
#dense_2/bias/Adam/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_2/bias*
dtype0
�
dense_2/bias/Adam
VariableV2*
shape:�*
shared_name *
_class
loc:@dense_2/bias*
dtype0*
	container 
�
dense_2/bias/Adam/AssignAssigndense_2/bias/Adam#dense_2/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
_
dense_2/bias/Adam/readIdentitydense_2/bias/Adam*
T0*
_class
loc:@dense_2/bias
x
%dense_2/bias/Adam_1/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_2/bias*
dtype0
�
dense_2/bias/Adam_1
VariableV2*
shape:�*
shared_name *
_class
loc:@dense_2/bias*
dtype0*
	container 
�
dense_2/bias/Adam_1/AssignAssigndense_2/bias/Adam_1%dense_2/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
c
dense_2/bias/Adam_1/readIdentitydense_2/bias/Adam_1*
T0*
_class
loc:@dense_2/bias
�
5dense_3/kernel/Adam/Initializer/zeros/shape_as_tensorConst*
valueB"   �   *!
_class
loc:@dense_3/kernel*
dtype0
{
+dense_3/kernel/Adam/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_3/kernel*
dtype0
�
%dense_3/kernel/Adam/Initializer/zerosFill5dense_3/kernel/Adam/Initializer/zeros/shape_as_tensor+dense_3/kernel/Adam/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_3/kernel
�
dense_3/kernel/Adam
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_3/kernel*
dtype0*
	container 
�
dense_3/kernel/Adam/AssignAssigndense_3/kernel/Adam%dense_3/kernel/Adam/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
e
dense_3/kernel/Adam/readIdentitydense_3/kernel/Adam*
T0*!
_class
loc:@dense_3/kernel
�
7dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensorConst*
valueB"   �   *!
_class
loc:@dense_3/kernel*
dtype0
}
-dense_3/kernel/Adam_1/Initializer/zeros/ConstConst*
valueB
 *    *!
_class
loc:@dense_3/kernel*
dtype0
�
'dense_3/kernel/Adam_1/Initializer/zerosFill7dense_3/kernel/Adam_1/Initializer/zeros/shape_as_tensor-dense_3/kernel/Adam_1/Initializer/zeros/Const*
T0*

index_type0*!
_class
loc:@dense_3/kernel
�
dense_3/kernel/Adam_1
VariableV2*
shape:
��*
shared_name *!
_class
loc:@dense_3/kernel*
dtype0*
	container 
�
dense_3/kernel/Adam_1/AssignAssigndense_3/kernel/Adam_1'dense_3/kernel/Adam_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
i
dense_3/kernel/Adam_1/readIdentitydense_3/kernel/Adam_1*
T0*!
_class
loc:@dense_3/kernel
v
#dense_3/bias/Adam/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_3/bias*
dtype0
�
dense_3/bias/Adam
VariableV2*
shape:�*
shared_name *
_class
loc:@dense_3/bias*
dtype0*
	container 
�
dense_3/bias/Adam/AssignAssigndense_3/bias/Adam#dense_3/bias/Adam/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
_
dense_3/bias/Adam/readIdentitydense_3/bias/Adam*
T0*
_class
loc:@dense_3/bias
x
%dense_3/bias/Adam_1/Initializer/zerosConst*
valueB�*    *
_class
loc:@dense_3/bias*
dtype0
�
dense_3/bias/Adam_1
VariableV2*
shape:�*
shared_name *
_class
loc:@dense_3/bias*
dtype0*
	container 
�
dense_3/bias/Adam_1/AssignAssigndense_3/bias/Adam_1%dense_3/bias/Adam_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
c
dense_3/bias/Adam_1/readIdentitydense_3/bias/Adam_1*
T0*
_class
loc:@dense_3/bias
?
Adam/learning_rateConst*
valueB
 *RI�9*
dtype0
7

Adam/beta1Const*
valueB
 *fff?*
dtype0
7

Adam/beta2Const*
valueB
 *w�?*
dtype0
9
Adam/epsilonConst*
valueB
 *w�+2*
dtype0
�
BAdam/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdam	ApplyAdam,curiosity_vector_obs_encoder/hidden_0/kernel1curiosity_vector_obs_encoder/hidden_0/kernel/Adam3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilongradients/AddN_12*
use_locking( *
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
use_nesterov( 
�
@Adam/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdam	ApplyAdam*curiosity_vector_obs_encoder/hidden_0/bias/curiosity_vector_obs_encoder/hidden_0/bias/Adam1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilongradients/AddN_11*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
use_nesterov( 
�
BAdam/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam	ApplyAdam,curiosity_vector_obs_encoder/hidden_1/kernel1curiosity_vector_obs_encoder/hidden_1/kernel/Adam3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilongradients/AddN_8*
use_locking( *
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
use_nesterov( 
�
@Adam/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdam	ApplyAdam*curiosity_vector_obs_encoder/hidden_1/bias/curiosity_vector_obs_encoder/hidden_1/bias/Adam1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilongradients/AddN_7*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
use_nesterov( 
�
"Adam/update_dense/kernel/ApplyAdam	ApplyAdamdense/kerneldense/kernel/Adamdense/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon6gradients/dense/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense/kernel*
use_nesterov( 
�
 Adam/update_dense/bias/ApplyAdam	ApplyAdam
dense/biasdense/bias/Adamdense/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon7gradients/dense/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense/bias*
use_nesterov( 
�
$Adam/update_dense_1/kernel/ApplyAdam	ApplyAdamdense_1/kerneldense_1/kernel/Adamdense_1/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon8gradients/dense_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_1/kernel*
use_nesterov( 
�
"Adam/update_dense_1/bias/ApplyAdam	ApplyAdamdense_1/biasdense_1/bias/Adamdense_1/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon9gradients/dense_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_1/bias*
use_nesterov( 
�
$Adam/update_dense_2/kernel/ApplyAdam	ApplyAdamdense_2/kerneldense_2/kernel/Adamdense_2/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon8gradients/dense_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_2/kernel*
use_nesterov( 
�
"Adam/update_dense_2/bias/ApplyAdam	ApplyAdamdense_2/biasdense_2/bias/Adamdense_2/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon9gradients/dense_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_2/bias*
use_nesterov( 
�
$Adam/update_dense_3/kernel/ApplyAdam	ApplyAdamdense_3/kerneldense_3/kernel/Adamdense_3/kernel/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon8gradients/dense_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@dense_3/kernel*
use_nesterov( 
�
"Adam/update_dense_3/bias/ApplyAdam	ApplyAdamdense_3/biasdense_3/bias/Adamdense_3/bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon9gradients/dense_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*
_class
loc:@dense_3/bias*
use_nesterov( 
�
Adam/mulMulbeta1_power/read
Adam/beta1A^Adam/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamC^Adam/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamA^Adam/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamC^Adam/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam#^Adam/update_dense_1/bias/ApplyAdam%^Adam/update_dense_1/kernel/ApplyAdam#^Adam/update_dense_2/bias/ApplyAdam%^Adam/update_dense_2/kernel/ApplyAdam#^Adam/update_dense_3/bias/ApplyAdam%^Adam/update_dense_3/kernel/ApplyAdam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Adam/AssignAssignbeta1_powerAdam/mul*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�

Adam/mul_1Mulbeta2_power/read
Adam/beta2A^Adam/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamC^Adam/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamA^Adam/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamC^Adam/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam#^Adam/update_dense_1/bias/ApplyAdam%^Adam/update_dense_1/kernel/ApplyAdam#^Adam/update_dense_2/bias/ApplyAdam%^Adam/update_dense_2/kernel/ApplyAdam#^Adam/update_dense_3/bias/ApplyAdam%^Adam/update_dense_3/kernel/ApplyAdam*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias
�
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
use_locking( *
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
AdamNoOp^Adam/Assign^Adam/Assign_1A^Adam/update_curiosity_vector_obs_encoder/hidden_0/bias/ApplyAdamC^Adam/update_curiosity_vector_obs_encoder/hidden_0/kernel/ApplyAdamA^Adam/update_curiosity_vector_obs_encoder/hidden_1/bias/ApplyAdamC^Adam/update_curiosity_vector_obs_encoder/hidden_1/kernel/ApplyAdam!^Adam/update_dense/bias/ApplyAdam#^Adam/update_dense/kernel/ApplyAdam#^Adam/update_dense_1/bias/ApplyAdam%^Adam/update_dense_1/kernel/ApplyAdam#^Adam/update_dense_2/bias/ApplyAdam%^Adam/update_dense_2/kernel/ApplyAdam#^Adam/update_dense_3/bias/ApplyAdam%^Adam/update_dense_3/kernel/ApplyAdam
C
Variable/initial_valueConst*
valueB
 *  �?*
dtype0
T
Variable
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
Variable/AssignAssignVariableVariable/initial_value*
use_locking(*
T0*
_class
loc:@Variable*
validate_shape(
I
Variable/readIdentityVariable*
T0*
_class
loc:@Variable
E
Variable_1/initial_valueConst*
valueB
 *  �?*
dtype0
V

Variable_1
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
Variable_1/AssignAssign
Variable_1Variable_1/initial_value*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(
O
Variable_1/readIdentity
Variable_1*
T0*
_class
loc:@Variable_1
;
Assign_4/valueConst*
valueB
 *    *
dtype0
{
Assign_4AssignVariableAssign_4/value*
use_locking( *
T0*
_class
loc:@Variable*
validate_shape(
;
Assign_5/valueConst*
valueB
 *    *
dtype0

Assign_5Assign
Variable_1Assign_5/value*
use_locking( *
T0*
_class
loc:@Variable_1*
validate_shape(
>
sac_sequence_lengthPlaceholder*
shape:*
dtype0
�
Gcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/shapeConst*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
valueB"N      *
dtype0
�
Fcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/meanConst*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
valueB
 *    *
dtype0
�
Hcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/stddevConst*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
valueB
 *��>*
dtype0
�
Qcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalGcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/shape*
seed�*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0*
seed2
�
Ecritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/mulMulQcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalHcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel
�
Acritic/value/encoder/hidden_0/kernel/Initializer/truncated_normalAddEcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/mulFcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel
�
$critic/value/encoder/hidden_0/kernel
VariableV2*
shape:	N�*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0*
	container 
�
+critic/value/encoder/hidden_0/kernel/AssignAssign$critic/value/encoder/hidden_0/kernelAcritic/value/encoder/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
validate_shape(
�
)critic/value/encoder/hidden_0/kernel/readIdentity$critic/value/encoder/hidden_0/kernel*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel
�
4critic/value/encoder/hidden_0/bias/Initializer/zerosConst*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
valueB�*    *
dtype0
�
"critic/value/encoder/hidden_0/bias
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
dtype0*
	container 
�
)critic/value/encoder/hidden_0/bias/AssignAssign"critic/value/encoder/hidden_0/bias4critic/value/encoder/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
validate_shape(
�
'critic/value/encoder/hidden_0/bias/readIdentity"critic/value/encoder/hidden_0/bias*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias
�
$critic/value/encoder/hidden_0/MatMulMatMulnormalized_state)critic/value/encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
%critic/value/encoder/hidden_0/BiasAddBiasAdd$critic/value/encoder/hidden_0/MatMul'critic/value/encoder/hidden_0/bias/read*
T0*
data_formatNHWC
`
%critic/value/encoder/hidden_0/SigmoidSigmoid%critic/value/encoder/hidden_0/BiasAdd*
T0

!critic/value/encoder/hidden_0/MulMul%critic/value/encoder/hidden_0/BiasAdd%critic/value/encoder/hidden_0/Sigmoid*
T0
�
Gcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/shapeConst*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
valueB"      *
dtype0
�
Fcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/meanConst*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
valueB
 *    *
dtype0
�
Hcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/stddevConst*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
valueB
 *6��=*
dtype0
�
Qcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalGcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/shape*
seed�*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0*
seed2
�
Ecritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/mulMulQcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalHcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel
�
Acritic/value/encoder/hidden_1/kernel/Initializer/truncated_normalAddEcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/mulFcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel
�
$critic/value/encoder/hidden_1/kernel
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0*
	container 
�
+critic/value/encoder/hidden_1/kernel/AssignAssign$critic/value/encoder/hidden_1/kernelAcritic/value/encoder/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
validate_shape(
�
)critic/value/encoder/hidden_1/kernel/readIdentity$critic/value/encoder/hidden_1/kernel*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel
�
4critic/value/encoder/hidden_1/bias/Initializer/zerosConst*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
valueB�*    *
dtype0
�
"critic/value/encoder/hidden_1/bias
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
dtype0*
	container 
�
)critic/value/encoder/hidden_1/bias/AssignAssign"critic/value/encoder/hidden_1/bias4critic/value/encoder/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
validate_shape(
�
'critic/value/encoder/hidden_1/bias/readIdentity"critic/value/encoder/hidden_1/bias*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias
�
$critic/value/encoder/hidden_1/MatMulMatMul!critic/value/encoder/hidden_0/Mul)critic/value/encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
%critic/value/encoder/hidden_1/BiasAddBiasAdd$critic/value/encoder/hidden_1/MatMul'critic/value/encoder/hidden_1/bias/read*
T0*
data_formatNHWC
`
%critic/value/encoder/hidden_1/SigmoidSigmoid%critic/value/encoder/hidden_1/BiasAdd*
T0

!critic/value/encoder/hidden_1/MulMul%critic/value/encoder/hidden_1/BiasAdd%critic/value/encoder/hidden_1/Sigmoid*
T0
�
Gcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/shapeConst*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
valueB"      *
dtype0
�
Fcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/meanConst*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
valueB
 *    *
dtype0
�
Hcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/stddevConst*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
valueB
 *6��=*
dtype0
�
Qcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalGcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/shape*
seed�*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0*
seed2
�
Ecritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/mulMulQcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalHcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/stddev*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel
�
Acritic/value/encoder/hidden_2/kernel/Initializer/truncated_normalAddEcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/mulFcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/mean*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel
�
$critic/value/encoder/hidden_2/kernel
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0*
	container 
�
+critic/value/encoder/hidden_2/kernel/AssignAssign$critic/value/encoder/hidden_2/kernelAcritic/value/encoder/hidden_2/kernel/Initializer/truncated_normal*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
validate_shape(
�
)critic/value/encoder/hidden_2/kernel/readIdentity$critic/value/encoder/hidden_2/kernel*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel
�
4critic/value/encoder/hidden_2/bias/Initializer/zerosConst*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
valueB�*    *
dtype0
�
"critic/value/encoder/hidden_2/bias
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
dtype0*
	container 
�
)critic/value/encoder/hidden_2/bias/AssignAssign"critic/value/encoder/hidden_2/bias4critic/value/encoder/hidden_2/bias/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
validate_shape(
�
'critic/value/encoder/hidden_2/bias/readIdentity"critic/value/encoder/hidden_2/bias*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias
�
$critic/value/encoder/hidden_2/MatMulMatMul!critic/value/encoder/hidden_1/Mul)critic/value/encoder/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
%critic/value/encoder/hidden_2/BiasAddBiasAdd$critic/value/encoder/hidden_2/MatMul'critic/value/encoder/hidden_2/bias/read*
T0*
data_formatNHWC
`
%critic/value/encoder/hidden_2/SigmoidSigmoid%critic/value/encoder/hidden_2/BiasAdd*
T0

!critic/value/encoder/hidden_2/MulMul%critic/value/encoder/hidden_2/BiasAdd%critic/value/encoder/hidden_2/Sigmoid*
T0
�
Gcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/shapeConst*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
valueB"      *
dtype0
�
Fcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/meanConst*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
valueB
 *    *
dtype0
�
Hcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/stddevConst*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
valueB
 *6��=*
dtype0
�
Qcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalGcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/shape*
seed�*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0*
seed2
�
Ecritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/mulMulQcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalHcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/stddev*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel
�
Acritic/value/encoder/hidden_3/kernel/Initializer/truncated_normalAddEcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/mulFcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/mean*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel
�
$critic/value/encoder/hidden_3/kernel
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0*
	container 
�
+critic/value/encoder/hidden_3/kernel/AssignAssign$critic/value/encoder/hidden_3/kernelAcritic/value/encoder/hidden_3/kernel/Initializer/truncated_normal*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
validate_shape(
�
)critic/value/encoder/hidden_3/kernel/readIdentity$critic/value/encoder/hidden_3/kernel*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel
�
4critic/value/encoder/hidden_3/bias/Initializer/zerosConst*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
valueB�*    *
dtype0
�
"critic/value/encoder/hidden_3/bias
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
dtype0*
	container 
�
)critic/value/encoder/hidden_3/bias/AssignAssign"critic/value/encoder/hidden_3/bias4critic/value/encoder/hidden_3/bias/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
validate_shape(
�
'critic/value/encoder/hidden_3/bias/readIdentity"critic/value/encoder/hidden_3/bias*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias
�
$critic/value/encoder/hidden_3/MatMulMatMul!critic/value/encoder/hidden_2/Mul)critic/value/encoder/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
%critic/value/encoder/hidden_3/BiasAddBiasAdd$critic/value/encoder/hidden_3/MatMul'critic/value/encoder/hidden_3/bias/read*
T0*
data_formatNHWC
`
%critic/value/encoder/hidden_3/SigmoidSigmoid%critic/value/encoder/hidden_3/BiasAdd*
T0

!critic/value/encoder/hidden_3/MulMul%critic/value/encoder/hidden_3/BiasAdd%critic/value/encoder/hidden_3/Sigmoid*
T0
�
Dcritic/value/extrinsic_value/kernel/Initializer/random_uniform/shapeConst*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
valueB"      *
dtype0
�
Bcritic/value/extrinsic_value/kernel/Initializer/random_uniform/minConst*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
valueB
 *Iv�*
dtype0
�
Bcritic/value/extrinsic_value/kernel/Initializer/random_uniform/maxConst*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
valueB
 *Iv>*
dtype0
�
Lcritic/value/extrinsic_value/kernel/Initializer/random_uniform/RandomUniformRandomUniformDcritic/value/extrinsic_value/kernel/Initializer/random_uniform/shape*
seed�*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
dtype0*
seed2
�
Bcritic/value/extrinsic_value/kernel/Initializer/random_uniform/subSubBcritic/value/extrinsic_value/kernel/Initializer/random_uniform/maxBcritic/value/extrinsic_value/kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel
�
Bcritic/value/extrinsic_value/kernel/Initializer/random_uniform/mulMulLcritic/value/extrinsic_value/kernel/Initializer/random_uniform/RandomUniformBcritic/value/extrinsic_value/kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel
�
>critic/value/extrinsic_value/kernel/Initializer/random_uniformAddBcritic/value/extrinsic_value/kernel/Initializer/random_uniform/mulBcritic/value/extrinsic_value/kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel
�
#critic/value/extrinsic_value/kernel
VariableV2*
shape:	�*
shared_name *6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
dtype0*
	container 
�
*critic/value/extrinsic_value/kernel/AssignAssign#critic/value/extrinsic_value/kernel>critic/value/extrinsic_value/kernel/Initializer/random_uniform*
use_locking(*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
validate_shape(
�
(critic/value/extrinsic_value/kernel/readIdentity#critic/value/extrinsic_value/kernel*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel
�
3critic/value/extrinsic_value/bias/Initializer/zerosConst*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
valueB*    *
dtype0
�
!critic/value/extrinsic_value/bias
VariableV2*
shape:*
shared_name *4
_class*
(&loc:@critic/value/extrinsic_value/bias*
dtype0*
	container 
�
(critic/value/extrinsic_value/bias/AssignAssign!critic/value/extrinsic_value/bias3critic/value/extrinsic_value/bias/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
validate_shape(
�
&critic/value/extrinsic_value/bias/readIdentity!critic/value/extrinsic_value/bias*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias
�
#critic/value/extrinsic_value/MatMulMatMul!critic/value/encoder/hidden_3/Mul(critic/value/extrinsic_value/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
$critic/value/extrinsic_value/BiasAddBiasAdd#critic/value/extrinsic_value/MatMul&critic/value/extrinsic_value/bias/read*
T0*
data_formatNHWC
�
Dcritic/value/curiosity_value/kernel/Initializer/random_uniform/shapeConst*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
valueB"      *
dtype0
�
Bcritic/value/curiosity_value/kernel/Initializer/random_uniform/minConst*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
valueB
 *Iv�*
dtype0
�
Bcritic/value/curiosity_value/kernel/Initializer/random_uniform/maxConst*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
valueB
 *Iv>*
dtype0
�
Lcritic/value/curiosity_value/kernel/Initializer/random_uniform/RandomUniformRandomUniformDcritic/value/curiosity_value/kernel/Initializer/random_uniform/shape*
seed�*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
dtype0*
seed2
�
Bcritic/value/curiosity_value/kernel/Initializer/random_uniform/subSubBcritic/value/curiosity_value/kernel/Initializer/random_uniform/maxBcritic/value/curiosity_value/kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel
�
Bcritic/value/curiosity_value/kernel/Initializer/random_uniform/mulMulLcritic/value/curiosity_value/kernel/Initializer/random_uniform/RandomUniformBcritic/value/curiosity_value/kernel/Initializer/random_uniform/sub*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel
�
>critic/value/curiosity_value/kernel/Initializer/random_uniformAddBcritic/value/curiosity_value/kernel/Initializer/random_uniform/mulBcritic/value/curiosity_value/kernel/Initializer/random_uniform/min*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel
�
#critic/value/curiosity_value/kernel
VariableV2*
shape:	�*
shared_name *6
_class,
*(loc:@critic/value/curiosity_value/kernel*
dtype0*
	container 
�
*critic/value/curiosity_value/kernel/AssignAssign#critic/value/curiosity_value/kernel>critic/value/curiosity_value/kernel/Initializer/random_uniform*
use_locking(*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
validate_shape(
�
(critic/value/curiosity_value/kernel/readIdentity#critic/value/curiosity_value/kernel*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel
�
3critic/value/curiosity_value/bias/Initializer/zerosConst*4
_class*
(&loc:@critic/value/curiosity_value/bias*
valueB*    *
dtype0
�
!critic/value/curiosity_value/bias
VariableV2*
shape:*
shared_name *4
_class*
(&loc:@critic/value/curiosity_value/bias*
dtype0*
	container 
�
(critic/value/curiosity_value/bias/AssignAssign!critic/value/curiosity_value/bias3critic/value/curiosity_value/bias/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias*
validate_shape(
�
&critic/value/curiosity_value/bias/readIdentity!critic/value/curiosity_value/bias*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias
�
#critic/value/curiosity_value/MatMulMatMul!critic/value/encoder/hidden_3/Mul(critic/value/curiosity_value/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
$critic/value/curiosity_value/BiasAddBiasAdd#critic/value/curiosity_value/MatMul&critic/value/curiosity_value/bias/read*
T0*
data_formatNHWC
�
critic/value/Mean/inputPack$critic/value/extrinsic_value/BiasAdd$critic/value/curiosity_value/BiasAdd*
T0*

axis *
N
M
#critic/value/Mean/reduction_indicesConst*
value	B : *
dtype0
}
critic/value/MeanMeancritic/value/Mean/input#critic/value/Mean/reduction_indices*

Tidx0*
	keep_dims( *
T0
L
external_action_inPlaceholder*
shape:���������
*
dtype0
@
concat_4/axisConst*
valueB :
���������*
dtype0
g
concat_4ConcatV2normalized_stateexternal_action_inconcat_4/axis*

Tidx0*
T0*
N
@
concat_5/axisConst*
valueB :
���������*
dtype0
[
concat_5ConcatV2normalized_stateactionconcat_5/axis*

Tidx0*
T0*
N
�
Rcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
valueB"X      *
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
valueB
 *�1�=*
dtype0
�
\critic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0*
seed2
�
Pcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/mulMul\critic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel
�
Lcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normalAddPcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/mulQcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel
�
/critic/q/q1_encoding/q1_encoder/hidden_0/kernel
VariableV2*
shape:	X�*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0*
	container 
�
6critic/q/q1_encoding/q1_encoder/hidden_0/kernel/AssignAssign/critic/q/q1_encoding/q1_encoder/hidden_0/kernelLcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
validate_shape(
�
4critic/q/q1_encoding/q1_encoder/hidden_0/kernel/readIdentity/critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_0/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
valueB�*    *
dtype0
�
-critic/q/q1_encoding/q1_encoder/hidden_0/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
dtype0*
	container 
�
4critic/q/q1_encoding/q1_encoder/hidden_0/bias/AssignAssign-critic/q/q1_encoding/q1_encoder/hidden_0/bias?critic/q/q1_encoding/q1_encoder/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
validate_shape(
�
2critic/q/q1_encoding/q1_encoder/hidden_0/bias/readIdentity-critic/q/q1_encoding/q1_encoder/hidden_0/bias*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias
�
/critic/q/q1_encoding/q1_encoder/hidden_0/MatMulMatMulconcat_44critic/q/q1_encoding/q1_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q1_encoding/q1_encoder/hidden_0/BiasAddBiasAdd/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul2critic/q/q1_encoding/q1_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
v
0critic/q/q1_encoding/q1_encoder/hidden_0/SigmoidSigmoid0critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd*
T0
�
,critic/q/q1_encoding/q1_encoder/hidden_0/MulMul0critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd0critic/q/q1_encoding/q1_encoder/hidden_0/Sigmoid*
T0
�
Rcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
valueB"      *
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
valueB
 *6��=*
dtype0
�
\critic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0*
seed2
�
Pcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/mulMul\critic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel
�
Lcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normalAddPcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/mulQcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel
�
/critic/q/q1_encoding/q1_encoder/hidden_1/kernel
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0*
	container 
�
6critic/q/q1_encoding/q1_encoder/hidden_1/kernel/AssignAssign/critic/q/q1_encoding/q1_encoder/hidden_1/kernelLcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
validate_shape(
�
4critic/q/q1_encoding/q1_encoder/hidden_1/kernel/readIdentity/critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_1/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
valueB�*    *
dtype0
�
-critic/q/q1_encoding/q1_encoder/hidden_1/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
dtype0*
	container 
�
4critic/q/q1_encoding/q1_encoder/hidden_1/bias/AssignAssign-critic/q/q1_encoding/q1_encoder/hidden_1/bias?critic/q/q1_encoding/q1_encoder/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
validate_shape(
�
2critic/q/q1_encoding/q1_encoder/hidden_1/bias/readIdentity-critic/q/q1_encoding/q1_encoder/hidden_1/bias*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias
�
/critic/q/q1_encoding/q1_encoder/hidden_1/MatMulMatMul,critic/q/q1_encoding/q1_encoder/hidden_0/Mul4critic/q/q1_encoding/q1_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q1_encoding/q1_encoder/hidden_1/BiasAddBiasAdd/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul2critic/q/q1_encoding/q1_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
v
0critic/q/q1_encoding/q1_encoder/hidden_1/SigmoidSigmoid0critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd*
T0
�
,critic/q/q1_encoding/q1_encoder/hidden_1/MulMul0critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd0critic/q/q1_encoding/q1_encoder/hidden_1/Sigmoid*
T0
�
Rcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
valueB"      *
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
valueB
 *6��=*
dtype0
�
\critic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0*
seed2
�
Pcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/mulMul\critic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel
�
Lcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normalAddPcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/mulQcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel
�
/critic/q/q1_encoding/q1_encoder/hidden_2/kernel
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0*
	container 
�
6critic/q/q1_encoding/q1_encoder/hidden_2/kernel/AssignAssign/critic/q/q1_encoding/q1_encoder/hidden_2/kernelLcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
validate_shape(
�
4critic/q/q1_encoding/q1_encoder/hidden_2/kernel/readIdentity/critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_2/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
valueB�*    *
dtype0
�
-critic/q/q1_encoding/q1_encoder/hidden_2/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
dtype0*
	container 
�
4critic/q/q1_encoding/q1_encoder/hidden_2/bias/AssignAssign-critic/q/q1_encoding/q1_encoder/hidden_2/bias?critic/q/q1_encoding/q1_encoder/hidden_2/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
validate_shape(
�
2critic/q/q1_encoding/q1_encoder/hidden_2/bias/readIdentity-critic/q/q1_encoding/q1_encoder/hidden_2/bias*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias
�
/critic/q/q1_encoding/q1_encoder/hidden_2/MatMulMatMul,critic/q/q1_encoding/q1_encoder/hidden_1/Mul4critic/q/q1_encoding/q1_encoder/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q1_encoding/q1_encoder/hidden_2/BiasAddBiasAdd/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul2critic/q/q1_encoding/q1_encoder/hidden_2/bias/read*
T0*
data_formatNHWC
v
0critic/q/q1_encoding/q1_encoder/hidden_2/SigmoidSigmoid0critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd*
T0
�
,critic/q/q1_encoding/q1_encoder/hidden_2/MulMul0critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd0critic/q/q1_encoding/q1_encoder/hidden_2/Sigmoid*
T0
�
Rcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
valueB"      *
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
valueB
 *6��=*
dtype0
�
\critic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0*
seed2
�
Pcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/mulMul\critic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel
�
Lcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normalAddPcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/mulQcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel
�
/critic/q/q1_encoding/q1_encoder/hidden_3/kernel
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0*
	container 
�
6critic/q/q1_encoding/q1_encoder/hidden_3/kernel/AssignAssign/critic/q/q1_encoding/q1_encoder/hidden_3/kernelLcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
validate_shape(
�
4critic/q/q1_encoding/q1_encoder/hidden_3/kernel/readIdentity/critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_3/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
valueB�*    *
dtype0
�
-critic/q/q1_encoding/q1_encoder/hidden_3/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
dtype0*
	container 
�
4critic/q/q1_encoding/q1_encoder/hidden_3/bias/AssignAssign-critic/q/q1_encoding/q1_encoder/hidden_3/bias?critic/q/q1_encoding/q1_encoder/hidden_3/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
validate_shape(
�
2critic/q/q1_encoding/q1_encoder/hidden_3/bias/readIdentity-critic/q/q1_encoding/q1_encoder/hidden_3/bias*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias
�
/critic/q/q1_encoding/q1_encoder/hidden_3/MatMulMatMul,critic/q/q1_encoding/q1_encoder/hidden_2/Mul4critic/q/q1_encoding/q1_encoder/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q1_encoding/q1_encoder/hidden_3/BiasAddBiasAdd/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul2critic/q/q1_encoding/q1_encoder/hidden_3/bias/read*
T0*
data_formatNHWC
v
0critic/q/q1_encoding/q1_encoder/hidden_3/SigmoidSigmoid0critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd*
T0
�
,critic/q/q1_encoding/q1_encoder/hidden_3/MulMul0critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd0critic/q/q1_encoding/q1_encoder/hidden_3/Sigmoid*
T0
�
Icritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/shapeConst*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
valueB"      *
dtype0
�
Gcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/minConst*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
valueB
 *Iv�*
dtype0
�
Gcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/maxConst*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
valueB
 *Iv>*
dtype0
�
Qcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/RandomUniformRandomUniformIcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/shape*
seed�*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
dtype0*
seed2
�
Gcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/subSubGcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/maxGcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel
�
Gcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/mulMulQcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/RandomUniformGcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/sub*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel
�
Ccritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniformAddGcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/mulGcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel
�
(critic/q/q1_encoding/extrinsic_q1/kernel
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
dtype0*
	container 
�
/critic/q/q1_encoding/extrinsic_q1/kernel/AssignAssign(critic/q/q1_encoding/extrinsic_q1/kernelCcritic/q/q1_encoding/extrinsic_q1/kernel/Initializer/random_uniform*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
validate_shape(
�
-critic/q/q1_encoding/extrinsic_q1/kernel/readIdentity(critic/q/q1_encoding/extrinsic_q1/kernel*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel
�
8critic/q/q1_encoding/extrinsic_q1/bias/Initializer/zerosConst*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
valueB*    *
dtype0
�
&critic/q/q1_encoding/extrinsic_q1/bias
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
dtype0*
	container 
�
-critic/q/q1_encoding/extrinsic_q1/bias/AssignAssign&critic/q/q1_encoding/extrinsic_q1/bias8critic/q/q1_encoding/extrinsic_q1/bias/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
validate_shape(
�
+critic/q/q1_encoding/extrinsic_q1/bias/readIdentity&critic/q/q1_encoding/extrinsic_q1/bias*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias
�
(critic/q/q1_encoding/extrinsic_q1/MatMulMatMul,critic/q/q1_encoding/q1_encoder/hidden_3/Mul-critic/q/q1_encoding/extrinsic_q1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
)critic/q/q1_encoding/extrinsic_q1/BiasAddBiasAdd(critic/q/q1_encoding/extrinsic_q1/MatMul+critic/q/q1_encoding/extrinsic_q1/bias/read*
T0*
data_formatNHWC
�
Icritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/shapeConst*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
valueB"      *
dtype0
�
Gcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/minConst*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
valueB
 *Iv�*
dtype0
�
Gcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/maxConst*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
valueB
 *Iv>*
dtype0
�
Qcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/RandomUniformRandomUniformIcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/shape*
seed�*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
dtype0*
seed2
�
Gcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/subSubGcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/maxGcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel
�
Gcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/mulMulQcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/RandomUniformGcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/sub*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel
�
Ccritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniformAddGcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/mulGcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel
�
(critic/q/q1_encoding/curiosity_q1/kernel
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
dtype0*
	container 
�
/critic/q/q1_encoding/curiosity_q1/kernel/AssignAssign(critic/q/q1_encoding/curiosity_q1/kernelCcritic/q/q1_encoding/curiosity_q1/kernel/Initializer/random_uniform*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
validate_shape(
�
-critic/q/q1_encoding/curiosity_q1/kernel/readIdentity(critic/q/q1_encoding/curiosity_q1/kernel*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel
�
8critic/q/q1_encoding/curiosity_q1/bias/Initializer/zerosConst*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
valueB*    *
dtype0
�
&critic/q/q1_encoding/curiosity_q1/bias
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
dtype0*
	container 
�
-critic/q/q1_encoding/curiosity_q1/bias/AssignAssign&critic/q/q1_encoding/curiosity_q1/bias8critic/q/q1_encoding/curiosity_q1/bias/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
+critic/q/q1_encoding/curiosity_q1/bias/readIdentity&critic/q/q1_encoding/curiosity_q1/bias*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias
�
(critic/q/q1_encoding/curiosity_q1/MatMulMatMul,critic/q/q1_encoding/q1_encoder/hidden_3/Mul-critic/q/q1_encoding/curiosity_q1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
)critic/q/q1_encoding/curiosity_q1/BiasAddBiasAdd(critic/q/q1_encoding/curiosity_q1/MatMul+critic/q/q1_encoding/curiosity_q1/bias/read*
T0*
data_formatNHWC
�
critic/q/q1_encoding/Mean/inputPack)critic/q/q1_encoding/extrinsic_q1/BiasAdd)critic/q/q1_encoding/curiosity_q1/BiasAdd*
T0*

axis *
N
U
+critic/q/q1_encoding/Mean/reduction_indicesConst*
value	B : *
dtype0
�
critic/q/q1_encoding/MeanMeancritic/q/q1_encoding/Mean/input+critic/q/q1_encoding/Mean/reduction_indices*

Tidx0*
	keep_dims( *
T0
�
Rcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
valueB"X      *
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
valueB
 *�1�=*
dtype0
�
\critic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0*
seed2
�
Pcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/mulMul\critic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel
�
Lcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normalAddPcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/mulQcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel
�
/critic/q/q2_encoding/q2_encoder/hidden_0/kernel
VariableV2*
shape:	X�*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0*
	container 
�
6critic/q/q2_encoding/q2_encoder/hidden_0/kernel/AssignAssign/critic/q/q2_encoding/q2_encoder/hidden_0/kernelLcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
validate_shape(
�
4critic/q/q2_encoding/q2_encoder/hidden_0/kernel/readIdentity/critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_0/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
valueB�*    *
dtype0
�
-critic/q/q2_encoding/q2_encoder/hidden_0/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
dtype0*
	container 
�
4critic/q/q2_encoding/q2_encoder/hidden_0/bias/AssignAssign-critic/q/q2_encoding/q2_encoder/hidden_0/bias?critic/q/q2_encoding/q2_encoder/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
validate_shape(
�
2critic/q/q2_encoding/q2_encoder/hidden_0/bias/readIdentity-critic/q/q2_encoding/q2_encoder/hidden_0/bias*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias
�
/critic/q/q2_encoding/q2_encoder/hidden_0/MatMulMatMulconcat_44critic/q/q2_encoding/q2_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q2_encoding/q2_encoder/hidden_0/BiasAddBiasAdd/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul2critic/q/q2_encoding/q2_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
v
0critic/q/q2_encoding/q2_encoder/hidden_0/SigmoidSigmoid0critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd*
T0
�
,critic/q/q2_encoding/q2_encoder/hidden_0/MulMul0critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd0critic/q/q2_encoding/q2_encoder/hidden_0/Sigmoid*
T0
�
Rcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
valueB"      *
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
valueB
 *6��=*
dtype0
�
\critic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0*
seed2
�
Pcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/mulMul\critic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel
�
Lcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normalAddPcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/mulQcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel
�
/critic/q/q2_encoding/q2_encoder/hidden_1/kernel
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0*
	container 
�
6critic/q/q2_encoding/q2_encoder/hidden_1/kernel/AssignAssign/critic/q/q2_encoding/q2_encoder/hidden_1/kernelLcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
validate_shape(
�
4critic/q/q2_encoding/q2_encoder/hidden_1/kernel/readIdentity/critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_1/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
valueB�*    *
dtype0
�
-critic/q/q2_encoding/q2_encoder/hidden_1/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
dtype0*
	container 
�
4critic/q/q2_encoding/q2_encoder/hidden_1/bias/AssignAssign-critic/q/q2_encoding/q2_encoder/hidden_1/bias?critic/q/q2_encoding/q2_encoder/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
validate_shape(
�
2critic/q/q2_encoding/q2_encoder/hidden_1/bias/readIdentity-critic/q/q2_encoding/q2_encoder/hidden_1/bias*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias
�
/critic/q/q2_encoding/q2_encoder/hidden_1/MatMulMatMul,critic/q/q2_encoding/q2_encoder/hidden_0/Mul4critic/q/q2_encoding/q2_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q2_encoding/q2_encoder/hidden_1/BiasAddBiasAdd/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul2critic/q/q2_encoding/q2_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
v
0critic/q/q2_encoding/q2_encoder/hidden_1/SigmoidSigmoid0critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd*
T0
�
,critic/q/q2_encoding/q2_encoder/hidden_1/MulMul0critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd0critic/q/q2_encoding/q2_encoder/hidden_1/Sigmoid*
T0
�
Rcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
valueB"      *
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
valueB
 *6��=*
dtype0
�
\critic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0*
seed2
�
Pcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/mulMul\critic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel
�
Lcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normalAddPcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/mulQcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel
�
/critic/q/q2_encoding/q2_encoder/hidden_2/kernel
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0*
	container 
�
6critic/q/q2_encoding/q2_encoder/hidden_2/kernel/AssignAssign/critic/q/q2_encoding/q2_encoder/hidden_2/kernelLcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
validate_shape(
�
4critic/q/q2_encoding/q2_encoder/hidden_2/kernel/readIdentity/critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_2/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
valueB�*    *
dtype0
�
-critic/q/q2_encoding/q2_encoder/hidden_2/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
dtype0*
	container 
�
4critic/q/q2_encoding/q2_encoder/hidden_2/bias/AssignAssign-critic/q/q2_encoding/q2_encoder/hidden_2/bias?critic/q/q2_encoding/q2_encoder/hidden_2/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
validate_shape(
�
2critic/q/q2_encoding/q2_encoder/hidden_2/bias/readIdentity-critic/q/q2_encoding/q2_encoder/hidden_2/bias*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias
�
/critic/q/q2_encoding/q2_encoder/hidden_2/MatMulMatMul,critic/q/q2_encoding/q2_encoder/hidden_1/Mul4critic/q/q2_encoding/q2_encoder/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q2_encoding/q2_encoder/hidden_2/BiasAddBiasAdd/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul2critic/q/q2_encoding/q2_encoder/hidden_2/bias/read*
T0*
data_formatNHWC
v
0critic/q/q2_encoding/q2_encoder/hidden_2/SigmoidSigmoid0critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd*
T0
�
,critic/q/q2_encoding/q2_encoder/hidden_2/MulMul0critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd0critic/q/q2_encoding/q2_encoder/hidden_2/Sigmoid*
T0
�
Rcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/shapeConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
valueB"      *
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/meanConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
valueB
 *    *
dtype0
�
Scritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/stddevConst*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
valueB
 *6��=*
dtype0
�
\critic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalRcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/shape*
seed�*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0*
seed2
�
Pcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/mulMul\critic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalScritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/stddev*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel
�
Lcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normalAddPcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/mulQcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal/mean*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel
�
/critic/q/q2_encoding/q2_encoder/hidden_3/kernel
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0*
	container 
�
6critic/q/q2_encoding/q2_encoder/hidden_3/kernel/AssignAssign/critic/q/q2_encoding/q2_encoder/hidden_3/kernelLcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/Initializer/truncated_normal*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
validate_shape(
�
4critic/q/q2_encoding/q2_encoder/hidden_3/kernel/readIdentity/critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_3/bias/Initializer/zerosConst*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
valueB�*    *
dtype0
�
-critic/q/q2_encoding/q2_encoder/hidden_3/bias
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
dtype0*
	container 
�
4critic/q/q2_encoding/q2_encoder/hidden_3/bias/AssignAssign-critic/q/q2_encoding/q2_encoder/hidden_3/bias?critic/q/q2_encoding/q2_encoder/hidden_3/bias/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
validate_shape(
�
2critic/q/q2_encoding/q2_encoder/hidden_3/bias/readIdentity-critic/q/q2_encoding/q2_encoder/hidden_3/bias*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias
�
/critic/q/q2_encoding/q2_encoder/hidden_3/MatMulMatMul,critic/q/q2_encoding/q2_encoder/hidden_2/Mul4critic/q/q2_encoding/q2_encoder/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
0critic/q/q2_encoding/q2_encoder/hidden_3/BiasAddBiasAdd/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul2critic/q/q2_encoding/q2_encoder/hidden_3/bias/read*
T0*
data_formatNHWC
v
0critic/q/q2_encoding/q2_encoder/hidden_3/SigmoidSigmoid0critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd*
T0
�
,critic/q/q2_encoding/q2_encoder/hidden_3/MulMul0critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd0critic/q/q2_encoding/q2_encoder/hidden_3/Sigmoid*
T0
�
Icritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/shapeConst*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
valueB"      *
dtype0
�
Gcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/minConst*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
valueB
 *Iv�*
dtype0
�
Gcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/maxConst*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
valueB
 *Iv>*
dtype0
�
Qcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/RandomUniformRandomUniformIcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/shape*
seed�*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
dtype0*
seed2
�
Gcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/subSubGcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/maxGcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel
�
Gcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/mulMulQcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/RandomUniformGcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/sub*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel
�
Ccritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniformAddGcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/mulGcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel
�
(critic/q/q2_encoding/extrinsic_q2/kernel
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
dtype0*
	container 
�
/critic/q/q2_encoding/extrinsic_q2/kernel/AssignAssign(critic/q/q2_encoding/extrinsic_q2/kernelCcritic/q/q2_encoding/extrinsic_q2/kernel/Initializer/random_uniform*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
validate_shape(
�
-critic/q/q2_encoding/extrinsic_q2/kernel/readIdentity(critic/q/q2_encoding/extrinsic_q2/kernel*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel
�
8critic/q/q2_encoding/extrinsic_q2/bias/Initializer/zerosConst*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
valueB*    *
dtype0
�
&critic/q/q2_encoding/extrinsic_q2/bias
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
dtype0*
	container 
�
-critic/q/q2_encoding/extrinsic_q2/bias/AssignAssign&critic/q/q2_encoding/extrinsic_q2/bias8critic/q/q2_encoding/extrinsic_q2/bias/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
validate_shape(
�
+critic/q/q2_encoding/extrinsic_q2/bias/readIdentity&critic/q/q2_encoding/extrinsic_q2/bias*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias
�
(critic/q/q2_encoding/extrinsic_q2/MatMulMatMul,critic/q/q2_encoding/q2_encoder/hidden_3/Mul-critic/q/q2_encoding/extrinsic_q2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
)critic/q/q2_encoding/extrinsic_q2/BiasAddBiasAdd(critic/q/q2_encoding/extrinsic_q2/MatMul+critic/q/q2_encoding/extrinsic_q2/bias/read*
T0*
data_formatNHWC
�
Icritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/shapeConst*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
valueB"      *
dtype0
�
Gcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/minConst*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
valueB
 *Iv�*
dtype0
�
Gcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/maxConst*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
valueB
 *Iv>*
dtype0
�
Qcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/RandomUniformRandomUniformIcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/shape*
seed�*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
dtype0*
seed2
�
Gcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/subSubGcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/maxGcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel
�
Gcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/mulMulQcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/RandomUniformGcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/sub*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel
�
Ccritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniformAddGcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/mulGcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform/min*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel
�
(critic/q/q2_encoding/curiosity_q2/kernel
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
dtype0*
	container 
�
/critic/q/q2_encoding/curiosity_q2/kernel/AssignAssign(critic/q/q2_encoding/curiosity_q2/kernelCcritic/q/q2_encoding/curiosity_q2/kernel/Initializer/random_uniform*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
validate_shape(
�
-critic/q/q2_encoding/curiosity_q2/kernel/readIdentity(critic/q/q2_encoding/curiosity_q2/kernel*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel
�
8critic/q/q2_encoding/curiosity_q2/bias/Initializer/zerosConst*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
valueB*    *
dtype0
�
&critic/q/q2_encoding/curiosity_q2/bias
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
dtype0*
	container 
�
-critic/q/q2_encoding/curiosity_q2/bias/AssignAssign&critic/q/q2_encoding/curiosity_q2/bias8critic/q/q2_encoding/curiosity_q2/bias/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
validate_shape(
�
+critic/q/q2_encoding/curiosity_q2/bias/readIdentity&critic/q/q2_encoding/curiosity_q2/bias*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias
�
(critic/q/q2_encoding/curiosity_q2/MatMulMatMul,critic/q/q2_encoding/q2_encoder/hidden_3/Mul-critic/q/q2_encoding/curiosity_q2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
)critic/q/q2_encoding/curiosity_q2/BiasAddBiasAdd(critic/q/q2_encoding/curiosity_q2/MatMul+critic/q/q2_encoding/curiosity_q2/bias/read*
T0*
data_formatNHWC
�
critic/q/q2_encoding/Mean/inputPack)critic/q/q2_encoding/extrinsic_q2/BiasAdd)critic/q/q2_encoding/curiosity_q2/BiasAdd*
T0*

axis *
N
U
+critic/q/q2_encoding/Mean/reduction_indicesConst*
value	B : *
dtype0
�
critic/q/q2_encoding/MeanMeancritic/q/q2_encoding/Mean/input+critic/q/q2_encoding/Mean/reduction_indices*

Tidx0*
	keep_dims( *
T0
�
1critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMulMatMulconcat_54critic/q/q1_encoding/q1_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAddBiasAdd1critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul2critic/q/q1_encoding/q1_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
z
2critic/q/q1_encoding_1/q1_encoder/hidden_0/SigmoidSigmoid2critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd*
T0
�
.critic/q/q1_encoding_1/q1_encoder/hidden_0/MulMul2critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd2critic/q/q1_encoding_1/q1_encoder/hidden_0/Sigmoid*
T0
�
1critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMulMatMul.critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul4critic/q/q1_encoding/q1_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAddBiasAdd1critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul2critic/q/q1_encoding/q1_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
z
2critic/q/q1_encoding_1/q1_encoder/hidden_1/SigmoidSigmoid2critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd*
T0
�
.critic/q/q1_encoding_1/q1_encoder/hidden_1/MulMul2critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd2critic/q/q1_encoding_1/q1_encoder/hidden_1/Sigmoid*
T0
�
1critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMulMatMul.critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul4critic/q/q1_encoding/q1_encoder/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAddBiasAdd1critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul2critic/q/q1_encoding/q1_encoder/hidden_2/bias/read*
T0*
data_formatNHWC
z
2critic/q/q1_encoding_1/q1_encoder/hidden_2/SigmoidSigmoid2critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd*
T0
�
.critic/q/q1_encoding_1/q1_encoder/hidden_2/MulMul2critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd2critic/q/q1_encoding_1/q1_encoder/hidden_2/Sigmoid*
T0
�
1critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMulMatMul.critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul4critic/q/q1_encoding/q1_encoder/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAddBiasAdd1critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul2critic/q/q1_encoding/q1_encoder/hidden_3/bias/read*
T0*
data_formatNHWC
z
2critic/q/q1_encoding_1/q1_encoder/hidden_3/SigmoidSigmoid2critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd*
T0
�
.critic/q/q1_encoding_1/q1_encoder/hidden_3/MulMul2critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd2critic/q/q1_encoding_1/q1_encoder/hidden_3/Sigmoid*
T0
�
*critic/q/q1_encoding_1/extrinsic_q1/MatMulMatMul.critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul-critic/q/q1_encoding/extrinsic_q1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
+critic/q/q1_encoding_1/extrinsic_q1/BiasAddBiasAdd*critic/q/q1_encoding_1/extrinsic_q1/MatMul+critic/q/q1_encoding/extrinsic_q1/bias/read*
T0*
data_formatNHWC
�
*critic/q/q1_encoding_1/curiosity_q1/MatMulMatMul.critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul-critic/q/q1_encoding/curiosity_q1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
+critic/q/q1_encoding_1/curiosity_q1/BiasAddBiasAdd*critic/q/q1_encoding_1/curiosity_q1/MatMul+critic/q/q1_encoding/curiosity_q1/bias/read*
T0*
data_formatNHWC
�
!critic/q/q1_encoding_1/Mean/inputPack+critic/q/q1_encoding_1/extrinsic_q1/BiasAdd+critic/q/q1_encoding_1/curiosity_q1/BiasAdd*
T0*

axis *
N
W
-critic/q/q1_encoding_1/Mean/reduction_indicesConst*
value	B : *
dtype0
�
critic/q/q1_encoding_1/MeanMean!critic/q/q1_encoding_1/Mean/input-critic/q/q1_encoding_1/Mean/reduction_indices*

Tidx0*
	keep_dims( *
T0
�
1critic/q/q2_encoding_1/q2_encoder/hidden_0/MatMulMatMulconcat_54critic/q/q2_encoding/q2_encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q2_encoding_1/q2_encoder/hidden_0/BiasAddBiasAdd1critic/q/q2_encoding_1/q2_encoder/hidden_0/MatMul2critic/q/q2_encoding/q2_encoder/hidden_0/bias/read*
T0*
data_formatNHWC
z
2critic/q/q2_encoding_1/q2_encoder/hidden_0/SigmoidSigmoid2critic/q/q2_encoding_1/q2_encoder/hidden_0/BiasAdd*
T0
�
.critic/q/q2_encoding_1/q2_encoder/hidden_0/MulMul2critic/q/q2_encoding_1/q2_encoder/hidden_0/BiasAdd2critic/q/q2_encoding_1/q2_encoder/hidden_0/Sigmoid*
T0
�
1critic/q/q2_encoding_1/q2_encoder/hidden_1/MatMulMatMul.critic/q/q2_encoding_1/q2_encoder/hidden_0/Mul4critic/q/q2_encoding/q2_encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q2_encoding_1/q2_encoder/hidden_1/BiasAddBiasAdd1critic/q/q2_encoding_1/q2_encoder/hidden_1/MatMul2critic/q/q2_encoding/q2_encoder/hidden_1/bias/read*
T0*
data_formatNHWC
z
2critic/q/q2_encoding_1/q2_encoder/hidden_1/SigmoidSigmoid2critic/q/q2_encoding_1/q2_encoder/hidden_1/BiasAdd*
T0
�
.critic/q/q2_encoding_1/q2_encoder/hidden_1/MulMul2critic/q/q2_encoding_1/q2_encoder/hidden_1/BiasAdd2critic/q/q2_encoding_1/q2_encoder/hidden_1/Sigmoid*
T0
�
1critic/q/q2_encoding_1/q2_encoder/hidden_2/MatMulMatMul.critic/q/q2_encoding_1/q2_encoder/hidden_1/Mul4critic/q/q2_encoding/q2_encoder/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q2_encoding_1/q2_encoder/hidden_2/BiasAddBiasAdd1critic/q/q2_encoding_1/q2_encoder/hidden_2/MatMul2critic/q/q2_encoding/q2_encoder/hidden_2/bias/read*
T0*
data_formatNHWC
z
2critic/q/q2_encoding_1/q2_encoder/hidden_2/SigmoidSigmoid2critic/q/q2_encoding_1/q2_encoder/hidden_2/BiasAdd*
T0
�
.critic/q/q2_encoding_1/q2_encoder/hidden_2/MulMul2critic/q/q2_encoding_1/q2_encoder/hidden_2/BiasAdd2critic/q/q2_encoding_1/q2_encoder/hidden_2/Sigmoid*
T0
�
1critic/q/q2_encoding_1/q2_encoder/hidden_3/MatMulMatMul.critic/q/q2_encoding_1/q2_encoder/hidden_2/Mul4critic/q/q2_encoding/q2_encoder/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
2critic/q/q2_encoding_1/q2_encoder/hidden_3/BiasAddBiasAdd1critic/q/q2_encoding_1/q2_encoder/hidden_3/MatMul2critic/q/q2_encoding/q2_encoder/hidden_3/bias/read*
T0*
data_formatNHWC
z
2critic/q/q2_encoding_1/q2_encoder/hidden_3/SigmoidSigmoid2critic/q/q2_encoding_1/q2_encoder/hidden_3/BiasAdd*
T0
�
.critic/q/q2_encoding_1/q2_encoder/hidden_3/MulMul2critic/q/q2_encoding_1/q2_encoder/hidden_3/BiasAdd2critic/q/q2_encoding_1/q2_encoder/hidden_3/Sigmoid*
T0
�
*critic/q/q2_encoding_1/extrinsic_q2/MatMulMatMul.critic/q/q2_encoding_1/q2_encoder/hidden_3/Mul-critic/q/q2_encoding/extrinsic_q2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
+critic/q/q2_encoding_1/extrinsic_q2/BiasAddBiasAdd*critic/q/q2_encoding_1/extrinsic_q2/MatMul+critic/q/q2_encoding/extrinsic_q2/bias/read*
T0*
data_formatNHWC
�
*critic/q/q2_encoding_1/curiosity_q2/MatMulMatMul.critic/q/q2_encoding_1/q2_encoder/hidden_3/Mul-critic/q/q2_encoding/curiosity_q2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
+critic/q/q2_encoding_1/curiosity_q2/BiasAddBiasAdd*critic/q/q2_encoding_1/curiosity_q2/MatMul+critic/q/q2_encoding/curiosity_q2/bias/read*
T0*
data_formatNHWC
�
!critic/q/q2_encoding_1/Mean/inputPack+critic/q/q2_encoding_1/extrinsic_q2/BiasAdd+critic/q/q2_encoding_1/curiosity_q2/BiasAdd*
T0*

axis *
N
W
-critic/q/q2_encoding_1/Mean/reduction_indicesConst*
value	B : *
dtype0
�
critic/q/q2_encoding_1/MeanMean!critic/q/q2_encoding_1/Mean/input-critic/q/q2_encoding_1/Mean/reduction_indices*

Tidx0*
	keep_dims( *
T0
@
sac_sequence_length_1Placeholder*
shape:*
dtype0
[
!target_network/vector_observationPlaceholder*
shape:���������N*
dtype0
�
4target_network/normalization_steps/Initializer/zerosConst*5
_class+
)'loc:@target_network/normalization_steps*
value	B : *
dtype0
�
"target_network/normalization_steps
VariableV2*
shape: *
shared_name *5
_class+
)'loc:@target_network/normalization_steps*
dtype0*
	container 
�
)target_network/normalization_steps/AssignAssign"target_network/normalization_steps4target_network/normalization_steps/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@target_network/normalization_steps*
validate_shape(
�
'target_network/normalization_steps/readIdentity"target_network/normalization_steps*
T0*5
_class+
)'loc:@target_network/normalization_steps
�
-target_network/running_mean/Initializer/zerosConst*.
_class$
" loc:@target_network/running_mean*
valueBN*    *
dtype0
�
target_network/running_mean
VariableV2*
shape:N*
shared_name *.
_class$
" loc:@target_network/running_mean*
dtype0*
	container 
�
"target_network/running_mean/AssignAssigntarget_network/running_mean-target_network/running_mean/Initializer/zeros*
use_locking(*
T0*.
_class$
" loc:@target_network/running_mean*
validate_shape(
�
 target_network/running_mean/readIdentitytarget_network/running_mean*
T0*.
_class$
" loc:@target_network/running_mean
�
0target_network/running_variance/Initializer/onesConst*2
_class(
&$loc:@target_network/running_variance*
valueBN*  �?*
dtype0
�
target_network/running_variance
VariableV2*
shape:N*
shared_name *2
_class(
&$loc:@target_network/running_variance*
dtype0*
	container 
�
&target_network/running_variance/AssignAssigntarget_network/running_variance0target_network/running_variance/Initializer/ones*
use_locking(*
T0*2
_class(
&$loc:@target_network/running_variance*
validate_shape(
�
$target_network/running_variance/readIdentitytarget_network/running_variance*
T0*2
_class(
&$loc:@target_network/running_variance
Y
target_network/ShapeShape!target_network/vector_observation*
T0*
out_type0
P
"target_network/strided_slice/stackConst*
valueB: *
dtype0
R
$target_network/strided_slice/stack_1Const*
valueB:*
dtype0
R
$target_network/strided_slice/stack_2Const*
valueB:*
dtype0
�
target_network/strided_sliceStridedSlicetarget_network/Shape"target_network/strided_slice/stack$target_network/strided_slice/stack_1$target_network/strided_slice/stack_2*
T0*
Index0*
shrink_axis_mask*

begin_mask *
ellipsis_mask *
new_axis_mask *
end_mask 
i
target_network/AddAdd'target_network/normalization_steps/readtarget_network/strided_slice*
T0
g
target_network/SubSub!target_network/vector_observation target_network/running_mean/read*
T0
W
target_network/CastCasttarget_network/Add*

SrcT0*
Truncate( *

DstT0
S
target_network/truedivRealDivtarget_network/Subtarget_network/Cast*
T0
N
$target_network/Sum/reduction_indicesConst*
value	B : *
dtype0
}
target_network/SumSumtarget_network/truediv$target_network/Sum/reduction_indices*

Tidx0*
	keep_dims( *
T0
\
target_network/add_1AddV2 target_network/running_mean/readtarget_network/Sum*
T0
]
target_network/Sub_1Sub!target_network/vector_observationtarget_network/add_1*
T0
L
target_network/mulMultarget_network/Sub_1target_network/Sub*
T0
P
&target_network/Sum_1/reduction_indicesConst*
value	B : *
dtype0
}
target_network/Sum_1Sumtarget_network/mul&target_network/Sum_1/reduction_indices*

Tidx0*
	keep_dims( *
T0
b
target_network/add_2AddV2$target_network/running_variance/readtarget_network/Sum_1*
T0
�
target_network/AssignAssigntarget_network/running_meantarget_network/add_1*
use_locking(*
T0*.
_class$
" loc:@target_network/running_mean*
validate_shape(
�
target_network/Assign_1Assigntarget_network/running_variancetarget_network/add_2*
use_locking(*
T0*2
_class(
&$loc:@target_network/running_variance*
validate_shape(
�
target_network/Assign_2Assign"target_network/normalization_stepstarget_network/Add*
use_locking(*
T0*5
_class+
)'loc:@target_network/normalization_steps*
validate_shape(
m
target_network/group_depsNoOp^target_network/Assign^target_network/Assign_1^target_network/Assign_2
i
target_network/sub_2Sub!target_network/vector_observation target_network/running_mean/read*
T0
n
target_network/Cast_1Cast'target_network/normalization_steps/read*

SrcT0*
Truncate( *

DstT0
C
target_network/add_3/yConst*
valueB
 *  �?*
dtype0
U
target_network/add_3AddV2target_network/Cast_1target_network/add_3/y*
T0
h
target_network/truediv_1RealDiv$target_network/running_variance/readtarget_network/add_3*
T0
>
target_network/SqrtSqrttarget_network/truediv_1*
T0
W
target_network/truediv_2RealDivtarget_network/sub_2target_network/Sqrt*
T0
V
)target_network/normalized_state/Minimum/yConst*
valueB
 *  �@*
dtype0
�
'target_network/normalized_state/MinimumMinimumtarget_network/truediv_2)target_network/normalized_state/Minimum/y*
T0
N
!target_network/normalized_state/yConst*
valueB
 *  ��*
dtype0

target_network/normalized_stateMaximum'target_network/normalized_state/Minimum!target_network/normalized_state/y*
T0
�
Vtarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/shapeConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
valueB"N      *
dtype0
�
Utarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/meanConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
valueB
 *    *
dtype0
�
Wtarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/stddevConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
valueB
 *��>*
dtype0
�
`target_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalVtarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/shape*
seed�*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
dtype0*
seed2
�
Ttarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/mulMul`target_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/TruncatedNormalWtarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/stddev*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel
�
Ptarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normalAddTtarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/mulUtarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal/mean*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel
�
3target_network/critic/value/encoder/hidden_0/kernel
VariableV2*
shape:	N�*
shared_name *F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
dtype0*
	container 
�
:target_network/critic/value/encoder/hidden_0/kernel/AssignAssign3target_network/critic/value/encoder/hidden_0/kernelPtarget_network/critic/value/encoder/hidden_0/kernel/Initializer/truncated_normal*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
validate_shape(
�
8target_network/critic/value/encoder/hidden_0/kernel/readIdentity3target_network/critic/value/encoder/hidden_0/kernel*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel
�
Ctarget_network/critic/value/encoder/hidden_0/bias/Initializer/zerosConst*D
_class:
86loc:@target_network/critic/value/encoder/hidden_0/bias*
valueB�*    *
dtype0
�
1target_network/critic/value/encoder/hidden_0/bias
VariableV2*
shape:�*
shared_name *D
_class:
86loc:@target_network/critic/value/encoder/hidden_0/bias*
dtype0*
	container 
�
8target_network/critic/value/encoder/hidden_0/bias/AssignAssign1target_network/critic/value/encoder/hidden_0/biasCtarget_network/critic/value/encoder/hidden_0/bias/Initializer/zeros*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_0/bias*
validate_shape(
�
6target_network/critic/value/encoder/hidden_0/bias/readIdentity1target_network/critic/value/encoder/hidden_0/bias*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_0/bias
�
3target_network/critic/value/encoder/hidden_0/MatMulMatMultarget_network/normalized_state8target_network/critic/value/encoder/hidden_0/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
4target_network/critic/value/encoder/hidden_0/BiasAddBiasAdd3target_network/critic/value/encoder/hidden_0/MatMul6target_network/critic/value/encoder/hidden_0/bias/read*
T0*
data_formatNHWC
~
4target_network/critic/value/encoder/hidden_0/SigmoidSigmoid4target_network/critic/value/encoder/hidden_0/BiasAdd*
T0
�
0target_network/critic/value/encoder/hidden_0/MulMul4target_network/critic/value/encoder/hidden_0/BiasAdd4target_network/critic/value/encoder/hidden_0/Sigmoid*
T0
�
Vtarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/shapeConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
valueB"      *
dtype0
�
Utarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/meanConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
valueB
 *    *
dtype0
�
Wtarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/stddevConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
valueB
 *6��=*
dtype0
�
`target_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalVtarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/shape*
seed�*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
dtype0*
seed2 
�
Ttarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/mulMul`target_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/TruncatedNormalWtarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/stddev*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel
�
Ptarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normalAddTtarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/mulUtarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal/mean*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel
�
3target_network/critic/value/encoder/hidden_1/kernel
VariableV2*
shape:
��*
shared_name *F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
dtype0*
	container 
�
:target_network/critic/value/encoder/hidden_1/kernel/AssignAssign3target_network/critic/value/encoder/hidden_1/kernelPtarget_network/critic/value/encoder/hidden_1/kernel/Initializer/truncated_normal*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
validate_shape(
�
8target_network/critic/value/encoder/hidden_1/kernel/readIdentity3target_network/critic/value/encoder/hidden_1/kernel*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel
�
Ctarget_network/critic/value/encoder/hidden_1/bias/Initializer/zerosConst*D
_class:
86loc:@target_network/critic/value/encoder/hidden_1/bias*
valueB�*    *
dtype0
�
1target_network/critic/value/encoder/hidden_1/bias
VariableV2*
shape:�*
shared_name *D
_class:
86loc:@target_network/critic/value/encoder/hidden_1/bias*
dtype0*
	container 
�
8target_network/critic/value/encoder/hidden_1/bias/AssignAssign1target_network/critic/value/encoder/hidden_1/biasCtarget_network/critic/value/encoder/hidden_1/bias/Initializer/zeros*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_1/bias*
validate_shape(
�
6target_network/critic/value/encoder/hidden_1/bias/readIdentity1target_network/critic/value/encoder/hidden_1/bias*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_1/bias
�
3target_network/critic/value/encoder/hidden_1/MatMulMatMul0target_network/critic/value/encoder/hidden_0/Mul8target_network/critic/value/encoder/hidden_1/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
4target_network/critic/value/encoder/hidden_1/BiasAddBiasAdd3target_network/critic/value/encoder/hidden_1/MatMul6target_network/critic/value/encoder/hidden_1/bias/read*
T0*
data_formatNHWC
~
4target_network/critic/value/encoder/hidden_1/SigmoidSigmoid4target_network/critic/value/encoder/hidden_1/BiasAdd*
T0
�
0target_network/critic/value/encoder/hidden_1/MulMul4target_network/critic/value/encoder/hidden_1/BiasAdd4target_network/critic/value/encoder/hidden_1/Sigmoid*
T0
�
Vtarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/shapeConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
valueB"      *
dtype0
�
Utarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/meanConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
valueB
 *    *
dtype0
�
Wtarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/stddevConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
valueB
 *6��=*
dtype0
�
`target_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalVtarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/shape*
seed�*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
dtype0*
seed2!
�
Ttarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/mulMul`target_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/TruncatedNormalWtarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/stddev*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel
�
Ptarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normalAddTtarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/mulUtarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal/mean*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel
�
3target_network/critic/value/encoder/hidden_2/kernel
VariableV2*
shape:
��*
shared_name *F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
dtype0*
	container 
�
:target_network/critic/value/encoder/hidden_2/kernel/AssignAssign3target_network/critic/value/encoder/hidden_2/kernelPtarget_network/critic/value/encoder/hidden_2/kernel/Initializer/truncated_normal*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
validate_shape(
�
8target_network/critic/value/encoder/hidden_2/kernel/readIdentity3target_network/critic/value/encoder/hidden_2/kernel*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel
�
Ctarget_network/critic/value/encoder/hidden_2/bias/Initializer/zerosConst*D
_class:
86loc:@target_network/critic/value/encoder/hidden_2/bias*
valueB�*    *
dtype0
�
1target_network/critic/value/encoder/hidden_2/bias
VariableV2*
shape:�*
shared_name *D
_class:
86loc:@target_network/critic/value/encoder/hidden_2/bias*
dtype0*
	container 
�
8target_network/critic/value/encoder/hidden_2/bias/AssignAssign1target_network/critic/value/encoder/hidden_2/biasCtarget_network/critic/value/encoder/hidden_2/bias/Initializer/zeros*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_2/bias*
validate_shape(
�
6target_network/critic/value/encoder/hidden_2/bias/readIdentity1target_network/critic/value/encoder/hidden_2/bias*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_2/bias
�
3target_network/critic/value/encoder/hidden_2/MatMulMatMul0target_network/critic/value/encoder/hidden_1/Mul8target_network/critic/value/encoder/hidden_2/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
4target_network/critic/value/encoder/hidden_2/BiasAddBiasAdd3target_network/critic/value/encoder/hidden_2/MatMul6target_network/critic/value/encoder/hidden_2/bias/read*
T0*
data_formatNHWC
~
4target_network/critic/value/encoder/hidden_2/SigmoidSigmoid4target_network/critic/value/encoder/hidden_2/BiasAdd*
T0
�
0target_network/critic/value/encoder/hidden_2/MulMul4target_network/critic/value/encoder/hidden_2/BiasAdd4target_network/critic/value/encoder/hidden_2/Sigmoid*
T0
�
Vtarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/shapeConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
valueB"      *
dtype0
�
Utarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/meanConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
valueB
 *    *
dtype0
�
Wtarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/stddevConst*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
valueB
 *6��=*
dtype0
�
`target_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalTruncatedNormalVtarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/shape*
seed�*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
dtype0*
seed2"
�
Ttarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/mulMul`target_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/TruncatedNormalWtarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/stddev*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel
�
Ptarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normalAddTtarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/mulUtarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal/mean*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel
�
3target_network/critic/value/encoder/hidden_3/kernel
VariableV2*
shape:
��*
shared_name *F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
dtype0*
	container 
�
:target_network/critic/value/encoder/hidden_3/kernel/AssignAssign3target_network/critic/value/encoder/hidden_3/kernelPtarget_network/critic/value/encoder/hidden_3/kernel/Initializer/truncated_normal*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
validate_shape(
�
8target_network/critic/value/encoder/hidden_3/kernel/readIdentity3target_network/critic/value/encoder/hidden_3/kernel*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel
�
Ctarget_network/critic/value/encoder/hidden_3/bias/Initializer/zerosConst*D
_class:
86loc:@target_network/critic/value/encoder/hidden_3/bias*
valueB�*    *
dtype0
�
1target_network/critic/value/encoder/hidden_3/bias
VariableV2*
shape:�*
shared_name *D
_class:
86loc:@target_network/critic/value/encoder/hidden_3/bias*
dtype0*
	container 
�
8target_network/critic/value/encoder/hidden_3/bias/AssignAssign1target_network/critic/value/encoder/hidden_3/biasCtarget_network/critic/value/encoder/hidden_3/bias/Initializer/zeros*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_3/bias*
validate_shape(
�
6target_network/critic/value/encoder/hidden_3/bias/readIdentity1target_network/critic/value/encoder/hidden_3/bias*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_3/bias
�
3target_network/critic/value/encoder/hidden_3/MatMulMatMul0target_network/critic/value/encoder/hidden_2/Mul8target_network/critic/value/encoder/hidden_3/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
4target_network/critic/value/encoder/hidden_3/BiasAddBiasAdd3target_network/critic/value/encoder/hidden_3/MatMul6target_network/critic/value/encoder/hidden_3/bias/read*
T0*
data_formatNHWC
~
4target_network/critic/value/encoder/hidden_3/SigmoidSigmoid4target_network/critic/value/encoder/hidden_3/BiasAdd*
T0
�
0target_network/critic/value/encoder/hidden_3/MulMul4target_network/critic/value/encoder/hidden_3/BiasAdd4target_network/critic/value/encoder/hidden_3/Sigmoid*
T0
�
Starget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/shapeConst*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
valueB"      *
dtype0
�
Qtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/minConst*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
valueB
 *Iv�*
dtype0
�
Qtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/maxConst*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
valueB
 *Iv>*
dtype0
�
[target_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/RandomUniformRandomUniformStarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/shape*
seed�*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
dtype0*
seed2#
�
Qtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/subSubQtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/maxQtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/min*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel
�
Qtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/mulMul[target_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/RandomUniformQtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/sub*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel
�
Mtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniformAddQtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/mulQtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform/min*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel
�
2target_network/critic/value/extrinsic_value/kernel
VariableV2*
shape:	�*
shared_name *E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
dtype0*
	container 
�
9target_network/critic/value/extrinsic_value/kernel/AssignAssign2target_network/critic/value/extrinsic_value/kernelMtarget_network/critic/value/extrinsic_value/kernel/Initializer/random_uniform*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
validate_shape(
�
7target_network/critic/value/extrinsic_value/kernel/readIdentity2target_network/critic/value/extrinsic_value/kernel*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel
�
Btarget_network/critic/value/extrinsic_value/bias/Initializer/zerosConst*C
_class9
75loc:@target_network/critic/value/extrinsic_value/bias*
valueB*    *
dtype0
�
0target_network/critic/value/extrinsic_value/bias
VariableV2*
shape:*
shared_name *C
_class9
75loc:@target_network/critic/value/extrinsic_value/bias*
dtype0*
	container 
�
7target_network/critic/value/extrinsic_value/bias/AssignAssign0target_network/critic/value/extrinsic_value/biasBtarget_network/critic/value/extrinsic_value/bias/Initializer/zeros*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/extrinsic_value/bias*
validate_shape(
�
5target_network/critic/value/extrinsic_value/bias/readIdentity0target_network/critic/value/extrinsic_value/bias*
T0*C
_class9
75loc:@target_network/critic/value/extrinsic_value/bias
�
2target_network/critic/value/extrinsic_value/MatMulMatMul0target_network/critic/value/encoder/hidden_3/Mul7target_network/critic/value/extrinsic_value/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
3target_network/critic/value/extrinsic_value/BiasAddBiasAdd2target_network/critic/value/extrinsic_value/MatMul5target_network/critic/value/extrinsic_value/bias/read*
T0*
data_formatNHWC
�
Starget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/shapeConst*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
valueB"      *
dtype0
�
Qtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/minConst*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
valueB
 *Iv�*
dtype0
�
Qtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/maxConst*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
valueB
 *Iv>*
dtype0
�
[target_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/RandomUniformRandomUniformStarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/shape*
seed�*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
dtype0*
seed2$
�
Qtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/subSubQtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/maxQtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/min*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel
�
Qtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/mulMul[target_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/RandomUniformQtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/sub*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel
�
Mtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniformAddQtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/mulQtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform/min*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel
�
2target_network/critic/value/curiosity_value/kernel
VariableV2*
shape:	�*
shared_name *E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
dtype0*
	container 
�
9target_network/critic/value/curiosity_value/kernel/AssignAssign2target_network/critic/value/curiosity_value/kernelMtarget_network/critic/value/curiosity_value/kernel/Initializer/random_uniform*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
validate_shape(
�
7target_network/critic/value/curiosity_value/kernel/readIdentity2target_network/critic/value/curiosity_value/kernel*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel
�
Btarget_network/critic/value/curiosity_value/bias/Initializer/zerosConst*C
_class9
75loc:@target_network/critic/value/curiosity_value/bias*
valueB*    *
dtype0
�
0target_network/critic/value/curiosity_value/bias
VariableV2*
shape:*
shared_name *C
_class9
75loc:@target_network/critic/value/curiosity_value/bias*
dtype0*
	container 
�
7target_network/critic/value/curiosity_value/bias/AssignAssign0target_network/critic/value/curiosity_value/biasBtarget_network/critic/value/curiosity_value/bias/Initializer/zeros*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/curiosity_value/bias*
validate_shape(
�
5target_network/critic/value/curiosity_value/bias/readIdentity0target_network/critic/value/curiosity_value/bias*
T0*C
_class9
75loc:@target_network/critic/value/curiosity_value/bias
�
2target_network/critic/value/curiosity_value/MatMulMatMul0target_network/critic/value/encoder/hidden_3/Mul7target_network/critic/value/curiosity_value/kernel/read*
transpose_b( *
T0*
transpose_a( 
�
3target_network/critic/value/curiosity_value/BiasAddBiasAdd2target_network/critic/value/curiosity_value/MatMul5target_network/critic/value/curiosity_value/bias/read*
T0*
data_formatNHWC
�
&target_network/critic/value/Mean/inputPack3target_network/critic/value/extrinsic_value/BiasAdd3target_network/critic/value/curiosity_value/BiasAdd*
T0*

axis *
N
\
2target_network/critic/value/Mean/reduction_indicesConst*
value	B : *
dtype0
�
 target_network/critic/value/MeanMean&target_network/critic/value/Mean/input2target_network/critic/value/Mean/reduction_indices*

Tidx0*
	keep_dims( *
T0
N
external_action_in_1Placeholder*
shape:���������
*
dtype0
=
value_estimate_unusedIdentitycritic/value/Mean*
T0
B
dones_holderPlaceholder*
shape:���������*
dtype0
E
Variable_2/initial_valueConst*
valueB
 *RI:*
dtype0
V

Variable_2
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
Variable_2/AssignAssign
Variable_2Variable_2/initial_value*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(
O
Variable_2/readIdentity
Variable_2*
T0*
_class
loc:@Variable_2
u
MinimumMinimum+critic/q/q1_encoding_1/extrinsic_q1/BiasAdd+critic/q/q2_encoding_1/extrinsic_q2/BiasAdd*
T0
G
extrinsic_rewardsPlaceholder*
shape:���������*
dtype0
w
	Minimum_1Minimum+critic/q/q1_encoding_1/curiosity_q1/BiasAdd+critic/q/q2_encoding_1/curiosity_q2/BiasAdd*
T0
G
curiosity_rewardsPlaceholder*
shape:���������*
dtype0
A
ExpandDims/dimConst*
valueB :
���������*
dtype0
K

ExpandDims
ExpandDimsdones_holderExpandDims/dim*

Tdim0*
T0
C
ExpandDims_1/dimConst*
valueB :
���������*
dtype0
T
ExpandDims_1
ExpandDimsextrinsic_rewardsExpandDims_1/dim*

Tdim0*
T0
0
mul_5MulVariable/read
ExpandDims*
T0
4
sub_3/xConst*
valueB
 *  �?*
dtype0
%
sub_3Subsub_3/xmul_5*
T0
4
mul_6/yConst*
valueB
 *R�~?*
dtype0
%
mul_6Mulsub_3mul_6/y*
T0
Q
mul_7Mulmul_63target_network/critic/value/extrinsic_value/BiasAdd*
T0
,
add_6AddV2ExpandDims_1mul_7*
T0
.
StopGradient_1StopGradientadd_6*
T0
?
ToFloatCastCast_2*

SrcT0*
Truncate( *

DstT0
l
SquaredDifference_2SquaredDifferenceStopGradient_1)critic/q/q1_encoding/extrinsic_q1/BiasAdd*
T0
3
mul_8MulToFloatSquaredDifference_2*
T0
<
Const_2Const*
valueB"       *
dtype0
D
Mean_2Meanmul_8Const_2*

Tidx0*
	keep_dims( *
T0
4
mul_9/xConst*
valueB
 *   ?*
dtype0
&
mul_9Mulmul_9/xMean_2*
T0
A
	ToFloat_1CastCast_2*

SrcT0*
Truncate( *

DstT0
l
SquaredDifference_3SquaredDifferenceStopGradient_1)critic/q/q2_encoding/extrinsic_q2/BiasAdd*
T0
6
mul_10Mul	ToFloat_1SquaredDifference_3*
T0
<
Const_3Const*
valueB"       *
dtype0
E
Mean_3Meanmul_10Const_3*

Tidx0*
	keep_dims( *
T0
5
mul_11/xConst*
valueB
 *   ?*
dtype0
(
mul_11Mulmul_11/xMean_3*
T0
C
ExpandDims_2/dimConst*
valueB :
���������*
dtype0
T
ExpandDims_2
ExpandDimscuriosity_rewardsExpandDims_2/dim*

Tdim0*
T0
3
mul_12MulVariable_1/read
ExpandDims*
T0
4
sub_4/xConst*
valueB
 *  �?*
dtype0
&
sub_4Subsub_4/xmul_12*
T0
5
mul_13/yConst*
valueB
 *�p}?*
dtype0
'
mul_13Mulsub_4mul_13/y*
T0
S
mul_14Mulmul_133target_network/critic/value/curiosity_value/BiasAdd*
T0
-
add_7AddV2ExpandDims_2mul_14*
T0
.
StopGradient_2StopGradientadd_7*
T0
A
	ToFloat_2CastCast_2*

SrcT0*
Truncate( *

DstT0
l
SquaredDifference_4SquaredDifferenceStopGradient_2)critic/q/q1_encoding/curiosity_q1/BiasAdd*
T0
6
mul_15Mul	ToFloat_2SquaredDifference_4*
T0
<
Const_4Const*
valueB"       *
dtype0
E
Mean_4Meanmul_15Const_4*

Tidx0*
	keep_dims( *
T0
5
mul_16/xConst*
valueB
 *   ?*
dtype0
(
mul_16Mulmul_16/xMean_4*
T0
A
	ToFloat_3CastCast_2*

SrcT0*
Truncate( *

DstT0
l
SquaredDifference_5SquaredDifferenceStopGradient_2)critic/q/q2_encoding/curiosity_q2/BiasAdd*
T0
6
mul_17Mul	ToFloat_3SquaredDifference_5*
T0
<
Const_5Const*
valueB"       *
dtype0
E
Mean_5Meanmul_17Const_5*

Tidx0*
	keep_dims( *
T0
5
mul_18/xConst*
valueB
 *   ?*
dtype0
(
mul_18Mulmul_18/xMean_5*
T0
@
Rank/packedPackmul_9mul_16*
T0*

axis *
N
.
RankConst*
value	B :*
dtype0
5
range/startConst*
value	B : *
dtype0
5
range/deltaConst*
value	B :*
dtype0
:
rangeRangerange/startRankrange/delta*

Tidx0
A
Mean_6/inputPackmul_9mul_16*
T0*

axis *
N
I
Mean_6MeanMean_6/inputrange*

Tidx0*
	keep_dims( *
T0
C
Rank_1/packedPackmul_11mul_18*
T0*

axis *
N
0
Rank_1Const*
value	B :*
dtype0
7
range_1/startConst*
value	B : *
dtype0
7
range_1/deltaConst*
value	B :*
dtype0
B
range_1Rangerange_1/startRank_1range_1/delta*

Tidx0
B
Mean_7/inputPackmul_11mul_18*
T0*

axis *
N
K
Mean_7MeanMean_7/inputrange_1*

Tidx0*
	keep_dims( *
T0
4
Const_6Const*
valueB
 *    *
dtype0
G
log_ent_coef/initial_valueConst*
valueB
 *    *
dtype0
X
log_ent_coef
VariableV2*
shape: *
shared_name *
dtype0*
	container 
�
log_ent_coef/AssignAssignlog_ent_coeflog_ent_coef/initial_value*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
U
log_ent_coef/readIdentitylog_ent_coef*
T0*
_class
loc:@log_ent_coef
&
ExpExplog_ent_coef/read*
T0
A
	ToFloat_4CastCast_2*

SrcT0*
Truncate( *

DstT0
4
mul_19Mullog_ent_coef/read	ToFloat_4*
T0
4
add_8/yConst*
valueB
 *   �*
dtype0
.
add_8AddV2action_probsadd_8/y*
T0
A
Sum_4/reduction_indicesConst*
value	B :*
dtype0
R
Sum_4Sumadd_8Sum_4/reduction_indices*

Tidx0*
	keep_dims(*
T0
.
StopGradient_3StopGradientSum_4*
T0
.
mul_20Mulmul_19StopGradient_3*
T0
<
Const_7Const*
valueB"       *
dtype0
E
Mean_8Meanmul_20Const_7*

Tidx0*
	keep_dims( *
T0

NegNegMean_8*
T0
)
mul_21MulExpaction_probs*
T0
:
sub_5Submul_21critic/q/q1_encoding_1/Mean*
T0
B
Mean_9/reduction_indicesConst*
value	B :*
dtype0
U
Mean_9Meansub_5Mean_9/reduction_indices*

Tidx0*
	keep_dims( *
T0
A
	ToFloat_5CastCast_2*

SrcT0*
Truncate( *

DstT0
)
mul_22Mul	ToFloat_5Mean_9*
T0
5
Const_8Const*
valueB: *
dtype0
F
Mean_10Meanmul_22Const_8*

Tidx0*
	keep_dims( *
T0
)
mul_23MulExpaction_probs*
T0
A
Sum_5/reduction_indicesConst*
value	B :*
dtype0
S
Sum_5Summul_23Sum_5/reduction_indices*

Tidx0*
	keep_dims( *
T0
%
sub_6SubMinimumSum_5*
T0
.
StopGradient_4StopGradientsub_6*
T0
A
	ToFloat_6CastCast_2*

SrcT0*
Truncate( *

DstT0
g
SquaredDifference_6SquaredDifference$critic/value/extrinsic_value/BiasAddStopGradient_4*
T0
6
mul_24Mul	ToFloat_6SquaredDifference_6*
T0
<
Const_9Const*
valueB"       *
dtype0
F
Mean_11Meanmul_24Const_9*

Tidx0*
	keep_dims( *
T0
5
mul_25/xConst*
valueB
 *   ?*
dtype0
)
mul_25Mulmul_25/xMean_11*
T0
)
mul_26MulExpaction_probs*
T0
A
Sum_6/reduction_indicesConst*
value	B :*
dtype0
S
Sum_6Summul_26Sum_6/reduction_indices*

Tidx0*
	keep_dims( *
T0
'
sub_7Sub	Minimum_1Sum_6*
T0
.
StopGradient_5StopGradientsub_7*
T0
A
	ToFloat_7CastCast_2*

SrcT0*
Truncate( *

DstT0
g
SquaredDifference_7SquaredDifference$critic/value/curiosity_value/BiasAddStopGradient_5*
T0
6
mul_27Mul	ToFloat_7SquaredDifference_7*
T0
=
Const_10Const*
valueB"       *
dtype0
G
Mean_12Meanmul_27Const_10*

Tidx0*
	keep_dims( *
T0
5
mul_28/xConst*
valueB
 *   ?*
dtype0
)
mul_28Mulmul_28/xMean_12*
T0
C
Rank_2/packedPackmul_25mul_28*
T0*

axis *
N
0
Rank_2Const*
value	B :*
dtype0
7
range_2/startConst*
value	B : *
dtype0
7
range_2/deltaConst*
value	B :*
dtype0
B
range_2Rangerange_2/startRank_2range_2/delta*

Tidx0
C
Mean_13/inputPackmul_25mul_28*
T0*

axis *
N
M
Mean_13MeanMean_13/inputrange_2*

Tidx0*
	keep_dims( *
T0
'
add_9AddV2Mean_6Mean_7*
T0
(
add_10AddV2add_9Mean_13*
T0
5
mul_29/xConst*
valueB
 *R�~?*
dtype0
Z
mul_29Mulmul_29/x8target_network/critic/value/encoder/hidden_0/kernel/read*
T0
5
mul_30/xConst*
valueB
 *
ף;*
dtype0
K
mul_30Mulmul_30/x)critic/value/encoder/hidden_0/kernel/read*
T0
(
add_11AddV2mul_29mul_30*
T0
�
Assign_6Assign3target_network/critic/value/encoder/hidden_0/kerneladd_11*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
validate_shape(
5
mul_31/xConst*
valueB
 *R�~?*
dtype0
X
mul_31Mulmul_31/x6target_network/critic/value/encoder/hidden_0/bias/read*
T0
5
mul_32/xConst*
valueB
 *
ף;*
dtype0
I
mul_32Mulmul_32/x'critic/value/encoder/hidden_0/bias/read*
T0
(
add_12AddV2mul_31mul_32*
T0
�
Assign_7Assign1target_network/critic/value/encoder/hidden_0/biasadd_12*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_0/bias*
validate_shape(
5
mul_33/xConst*
valueB
 *R�~?*
dtype0
Z
mul_33Mulmul_33/x8target_network/critic/value/encoder/hidden_1/kernel/read*
T0
5
mul_34/xConst*
valueB
 *
ף;*
dtype0
K
mul_34Mulmul_34/x)critic/value/encoder/hidden_1/kernel/read*
T0
(
add_13AddV2mul_33mul_34*
T0
�
Assign_8Assign3target_network/critic/value/encoder/hidden_1/kerneladd_13*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
validate_shape(
5
mul_35/xConst*
valueB
 *R�~?*
dtype0
X
mul_35Mulmul_35/x6target_network/critic/value/encoder/hidden_1/bias/read*
T0
5
mul_36/xConst*
valueB
 *
ף;*
dtype0
I
mul_36Mulmul_36/x'critic/value/encoder/hidden_1/bias/read*
T0
(
add_14AddV2mul_35mul_36*
T0
�
Assign_9Assign1target_network/critic/value/encoder/hidden_1/biasadd_14*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_1/bias*
validate_shape(
5
mul_37/xConst*
valueB
 *R�~?*
dtype0
Z
mul_37Mulmul_37/x8target_network/critic/value/encoder/hidden_2/kernel/read*
T0
5
mul_38/xConst*
valueB
 *
ף;*
dtype0
K
mul_38Mulmul_38/x)critic/value/encoder/hidden_2/kernel/read*
T0
(
add_15AddV2mul_37mul_38*
T0
�
	Assign_10Assign3target_network/critic/value/encoder/hidden_2/kerneladd_15*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
validate_shape(
5
mul_39/xConst*
valueB
 *R�~?*
dtype0
X
mul_39Mulmul_39/x6target_network/critic/value/encoder/hidden_2/bias/read*
T0
5
mul_40/xConst*
valueB
 *
ף;*
dtype0
I
mul_40Mulmul_40/x'critic/value/encoder/hidden_2/bias/read*
T0
(
add_16AddV2mul_39mul_40*
T0
�
	Assign_11Assign1target_network/critic/value/encoder/hidden_2/biasadd_16*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_2/bias*
validate_shape(
5
mul_41/xConst*
valueB
 *R�~?*
dtype0
Z
mul_41Mulmul_41/x8target_network/critic/value/encoder/hidden_3/kernel/read*
T0
5
mul_42/xConst*
valueB
 *
ף;*
dtype0
K
mul_42Mulmul_42/x)critic/value/encoder/hidden_3/kernel/read*
T0
(
add_17AddV2mul_41mul_42*
T0
�
	Assign_12Assign3target_network/critic/value/encoder/hidden_3/kerneladd_17*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
validate_shape(
5
mul_43/xConst*
valueB
 *R�~?*
dtype0
X
mul_43Mulmul_43/x6target_network/critic/value/encoder/hidden_3/bias/read*
T0
5
mul_44/xConst*
valueB
 *
ף;*
dtype0
I
mul_44Mulmul_44/x'critic/value/encoder/hidden_3/bias/read*
T0
(
add_18AddV2mul_43mul_44*
T0
�
	Assign_13Assign1target_network/critic/value/encoder/hidden_3/biasadd_18*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_3/bias*
validate_shape(
5
mul_45/xConst*
valueB
 *R�~?*
dtype0
Y
mul_45Mulmul_45/x7target_network/critic/value/extrinsic_value/kernel/read*
T0
5
mul_46/xConst*
valueB
 *
ף;*
dtype0
J
mul_46Mulmul_46/x(critic/value/extrinsic_value/kernel/read*
T0
(
add_19AddV2mul_45mul_46*
T0
�
	Assign_14Assign2target_network/critic/value/extrinsic_value/kerneladd_19*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
validate_shape(
5
mul_47/xConst*
valueB
 *R�~?*
dtype0
W
mul_47Mulmul_47/x5target_network/critic/value/extrinsic_value/bias/read*
T0
5
mul_48/xConst*
valueB
 *
ף;*
dtype0
H
mul_48Mulmul_48/x&critic/value/extrinsic_value/bias/read*
T0
(
add_20AddV2mul_47mul_48*
T0
�
	Assign_15Assign0target_network/critic/value/extrinsic_value/biasadd_20*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/extrinsic_value/bias*
validate_shape(
5
mul_49/xConst*
valueB
 *R�~?*
dtype0
Y
mul_49Mulmul_49/x7target_network/critic/value/curiosity_value/kernel/read*
T0
5
mul_50/xConst*
valueB
 *
ף;*
dtype0
J
mul_50Mulmul_50/x(critic/value/curiosity_value/kernel/read*
T0
(
add_21AddV2mul_49mul_50*
T0
�
	Assign_16Assign2target_network/critic/value/curiosity_value/kerneladd_21*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
validate_shape(
5
mul_51/xConst*
valueB
 *R�~?*
dtype0
W
mul_51Mulmul_51/x5target_network/critic/value/curiosity_value/bias/read*
T0
5
mul_52/xConst*
valueB
 *
ף;*
dtype0
H
mul_52Mulmul_52/x&critic/value/curiosity_value/bias/read*
T0
(
add_22AddV2mul_51mul_52*
T0
�
	Assign_17Assign0target_network/critic/value/curiosity_value/biasadd_22*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/curiosity_value/bias*
validate_shape(
�
	Assign_18Assign3target_network/critic/value/encoder/hidden_0/kernel)critic/value/encoder/hidden_0/kernel/read*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
validate_shape(
�
	Assign_19Assign1target_network/critic/value/encoder/hidden_0/bias'critic/value/encoder/hidden_0/bias/read*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_0/bias*
validate_shape(
�
	Assign_20Assign3target_network/critic/value/encoder/hidden_1/kernel)critic/value/encoder/hidden_1/kernel/read*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
validate_shape(
�
	Assign_21Assign1target_network/critic/value/encoder/hidden_1/bias'critic/value/encoder/hidden_1/bias/read*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_1/bias*
validate_shape(
�
	Assign_22Assign3target_network/critic/value/encoder/hidden_2/kernel)critic/value/encoder/hidden_2/kernel/read*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
validate_shape(
�
	Assign_23Assign1target_network/critic/value/encoder/hidden_2/bias'critic/value/encoder/hidden_2/bias/read*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_2/bias*
validate_shape(
�
	Assign_24Assign3target_network/critic/value/encoder/hidden_3/kernel)critic/value/encoder/hidden_3/kernel/read*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
validate_shape(
�
	Assign_25Assign1target_network/critic/value/encoder/hidden_3/bias'critic/value/encoder/hidden_3/bias/read*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_3/bias*
validate_shape(
�
	Assign_26Assign2target_network/critic/value/extrinsic_value/kernel(critic/value/extrinsic_value/kernel/read*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
validate_shape(
�
	Assign_27Assign0target_network/critic/value/extrinsic_value/bias&critic/value/extrinsic_value/bias/read*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/extrinsic_value/bias*
validate_shape(
�
	Assign_28Assign2target_network/critic/value/curiosity_value/kernel(critic/value/curiosity_value/kernel/read*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
validate_shape(
�
	Assign_29Assign0target_network/critic/value/curiosity_value/bias&critic/value/curiosity_value/bias/read*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/curiosity_value/bias*
validate_shape(
:
gradients_1/ShapeConst*
valueB *
dtype0
B
gradients_1/grad_ys_0Const*
valueB
 *  �?*
dtype0
]
gradients_1/FillFillgradients_1/Shapegradients_1/grad_ys_0*
T0*

index_type0
T
&gradients_1/Mean_10_grad/Reshape/shapeConst*
valueB:*
dtype0
|
 gradients_1/Mean_10_grad/ReshapeReshapegradients_1/Fill&gradients_1/Mean_10_grad/Reshape/shape*
T0*
Tshape0
H
gradients_1/Mean_10_grad/ShapeShapemul_22*
T0*
out_type0
�
gradients_1/Mean_10_grad/TileTile gradients_1/Mean_10_grad/Reshapegradients_1/Mean_10_grad/Shape*

Tmultiples0*
T0
J
 gradients_1/Mean_10_grad/Shape_1Shapemul_22*
T0*
out_type0
I
 gradients_1/Mean_10_grad/Shape_2Const*
valueB *
dtype0
L
gradients_1/Mean_10_grad/ConstConst*
valueB: *
dtype0
�
gradients_1/Mean_10_grad/ProdProd gradients_1/Mean_10_grad/Shape_1gradients_1/Mean_10_grad/Const*

Tidx0*
	keep_dims( *
T0
N
 gradients_1/Mean_10_grad/Const_1Const*
valueB: *
dtype0
�
gradients_1/Mean_10_grad/Prod_1Prod gradients_1/Mean_10_grad/Shape_2 gradients_1/Mean_10_grad/Const_1*

Tidx0*
	keep_dims( *
T0
L
"gradients_1/Mean_10_grad/Maximum/yConst*
value	B :*
dtype0
y
 gradients_1/Mean_10_grad/MaximumMaximumgradients_1/Mean_10_grad/Prod_1"gradients_1/Mean_10_grad/Maximum/y*
T0
w
!gradients_1/Mean_10_grad/floordivFloorDivgradients_1/Mean_10_grad/Prod gradients_1/Mean_10_grad/Maximum*
T0
p
gradients_1/Mean_10_grad/CastCast!gradients_1/Mean_10_grad/floordiv*

SrcT0*
Truncate( *

DstT0
r
 gradients_1/Mean_10_grad/truedivRealDivgradients_1/Mean_10_grad/Tilegradients_1/Mean_10_grad/Cast*
T0
J
gradients_1/mul_22_grad/ShapeShape	ToFloat_5*
T0*
out_type0
I
gradients_1/mul_22_grad/Shape_1ShapeMean_9*
T0*
out_type0
�
-gradients_1/mul_22_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_22_grad/Shapegradients_1/mul_22_grad/Shape_1*
T0
U
gradients_1/mul_22_grad/MulMul gradients_1/Mean_10_grad/truedivMean_9*
T0
�
gradients_1/mul_22_grad/SumSumgradients_1/mul_22_grad/Mul-gradients_1/mul_22_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_1/mul_22_grad/ReshapeReshapegradients_1/mul_22_grad/Sumgradients_1/mul_22_grad/Shape*
T0*
Tshape0
Z
gradients_1/mul_22_grad/Mul_1Mul	ToFloat_5 gradients_1/Mean_10_grad/truediv*
T0
�
gradients_1/mul_22_grad/Sum_1Sumgradients_1/mul_22_grad/Mul_1/gradients_1/mul_22_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_1/mul_22_grad/Reshape_1Reshapegradients_1/mul_22_grad/Sum_1gradients_1/mul_22_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/mul_22_grad/tuple/group_depsNoOp ^gradients_1/mul_22_grad/Reshape"^gradients_1/mul_22_grad/Reshape_1
�
0gradients_1/mul_22_grad/tuple/control_dependencyIdentitygradients_1/mul_22_grad/Reshape)^gradients_1/mul_22_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/mul_22_grad/Reshape
�
2gradients_1/mul_22_grad/tuple/control_dependency_1Identity!gradients_1/mul_22_grad/Reshape_1)^gradients_1/mul_22_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/mul_22_grad/Reshape_1
F
gradients_1/Mean_9_grad/ShapeShapesub_5*
T0*
out_type0
x
gradients_1/Mean_9_grad/SizeConst*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape*
value	B :*
dtype0
�
gradients_1/Mean_9_grad/addAddV2Mean_9/reduction_indicesgradients_1/Mean_9_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape
�
gradients_1/Mean_9_grad/modFloorModgradients_1/Mean_9_grad/addgradients_1/Mean_9_grad/Size*
T0*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape
z
gradients_1/Mean_9_grad/Shape_1Const*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape*
valueB *
dtype0

#gradients_1/Mean_9_grad/range/startConst*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape*
value	B : *
dtype0

#gradients_1/Mean_9_grad/range/deltaConst*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape*
value	B :*
dtype0
�
gradients_1/Mean_9_grad/rangeRange#gradients_1/Mean_9_grad/range/startgradients_1/Mean_9_grad/Size#gradients_1/Mean_9_grad/range/delta*

Tidx0*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape
~
"gradients_1/Mean_9_grad/Fill/valueConst*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape*
value	B :*
dtype0
�
gradients_1/Mean_9_grad/FillFillgradients_1/Mean_9_grad/Shape_1"gradients_1/Mean_9_grad/Fill/value*
T0*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape*

index_type0
�
%gradients_1/Mean_9_grad/DynamicStitchDynamicStitchgradients_1/Mean_9_grad/rangegradients_1/Mean_9_grad/modgradients_1/Mean_9_grad/Shapegradients_1/Mean_9_grad/Fill*
T0*0
_class&
$"loc:@gradients_1/Mean_9_grad/Shape*
N
�
gradients_1/Mean_9_grad/ReshapeReshape2gradients_1/mul_22_grad/tuple/control_dependency_1%gradients_1/Mean_9_grad/DynamicStitch*
T0*
Tshape0
�
#gradients_1/Mean_9_grad/BroadcastToBroadcastTogradients_1/Mean_9_grad/Reshapegradients_1/Mean_9_grad/Shape*

Tidx0*
T0
H
gradients_1/Mean_9_grad/Shape_2Shapesub_5*
T0*
out_type0
I
gradients_1/Mean_9_grad/Shape_3ShapeMean_9*
T0*
out_type0
K
gradients_1/Mean_9_grad/ConstConst*
valueB: *
dtype0
�
gradients_1/Mean_9_grad/ProdProdgradients_1/Mean_9_grad/Shape_2gradients_1/Mean_9_grad/Const*

Tidx0*
	keep_dims( *
T0
M
gradients_1/Mean_9_grad/Const_1Const*
valueB: *
dtype0
�
gradients_1/Mean_9_grad/Prod_1Prodgradients_1/Mean_9_grad/Shape_3gradients_1/Mean_9_grad/Const_1*

Tidx0*
	keep_dims( *
T0
K
!gradients_1/Mean_9_grad/Maximum/yConst*
value	B :*
dtype0
v
gradients_1/Mean_9_grad/MaximumMaximumgradients_1/Mean_9_grad/Prod_1!gradients_1/Mean_9_grad/Maximum/y*
T0
t
 gradients_1/Mean_9_grad/floordivFloorDivgradients_1/Mean_9_grad/Prodgradients_1/Mean_9_grad/Maximum*
T0
n
gradients_1/Mean_9_grad/CastCast gradients_1/Mean_9_grad/floordiv*

SrcT0*
Truncate( *

DstT0
v
gradients_1/Mean_9_grad/truedivRealDiv#gradients_1/Mean_9_grad/BroadcastTogradients_1/Mean_9_grad/Cast*
T0
F
gradients_1/sub_5_grad/ShapeShapemul_21*
T0*
out_type0
]
gradients_1/sub_5_grad/Shape_1Shapecritic/q/q1_encoding_1/Mean*
T0*
out_type0
�
,gradients_1/sub_5_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/sub_5_grad/Shapegradients_1/sub_5_grad/Shape_1*
T0
�
gradients_1/sub_5_grad/SumSumgradients_1/Mean_9_grad/truediv,gradients_1/sub_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_1/sub_5_grad/ReshapeReshapegradients_1/sub_5_grad/Sumgradients_1/sub_5_grad/Shape*
T0*
Tshape0
K
gradients_1/sub_5_grad/NegNeggradients_1/Mean_9_grad/truediv*
T0
�
gradients_1/sub_5_grad/Sum_1Sumgradients_1/sub_5_grad/Neg.gradients_1/sub_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_1/sub_5_grad/Reshape_1Reshapegradients_1/sub_5_grad/Sum_1gradients_1/sub_5_grad/Shape_1*
T0*
Tshape0
s
'gradients_1/sub_5_grad/tuple/group_depsNoOp^gradients_1/sub_5_grad/Reshape!^gradients_1/sub_5_grad/Reshape_1
�
/gradients_1/sub_5_grad/tuple/control_dependencyIdentitygradients_1/sub_5_grad/Reshape(^gradients_1/sub_5_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_1/sub_5_grad/Reshape
�
1gradients_1/sub_5_grad/tuple/control_dependency_1Identity gradients_1/sub_5_grad/Reshape_1(^gradients_1/sub_5_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_1/sub_5_grad/Reshape_1
D
gradients_1/mul_21_grad/ShapeShapeExp*
T0*
out_type0
O
gradients_1/mul_21_grad/Shape_1Shapeaction_probs*
T0*
out_type0
�
-gradients_1/mul_21_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_1/mul_21_grad/Shapegradients_1/mul_21_grad/Shape_1*
T0
j
gradients_1/mul_21_grad/MulMul/gradients_1/sub_5_grad/tuple/control_dependencyaction_probs*
T0
�
gradients_1/mul_21_grad/SumSumgradients_1/mul_21_grad/Mul-gradients_1/mul_21_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_1/mul_21_grad/ReshapeReshapegradients_1/mul_21_grad/Sumgradients_1/mul_21_grad/Shape*
T0*
Tshape0
c
gradients_1/mul_21_grad/Mul_1MulExp/gradients_1/sub_5_grad/tuple/control_dependency*
T0
�
gradients_1/mul_21_grad/Sum_1Sumgradients_1/mul_21_grad/Mul_1/gradients_1/mul_21_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_1/mul_21_grad/Reshape_1Reshapegradients_1/mul_21_grad/Sum_1gradients_1/mul_21_grad/Shape_1*
T0*
Tshape0
v
(gradients_1/mul_21_grad/tuple/group_depsNoOp ^gradients_1/mul_21_grad/Reshape"^gradients_1/mul_21_grad/Reshape_1
�
0gradients_1/mul_21_grad/tuple/control_dependencyIdentitygradients_1/mul_21_grad/Reshape)^gradients_1/mul_21_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/mul_21_grad/Reshape
�
2gradients_1/mul_21_grad/tuple/control_dependency_1Identity!gradients_1/mul_21_grad/Reshape_1)^gradients_1/mul_21_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/mul_21_grad/Reshape_1
w
2gradients_1/critic/q/q1_encoding_1/Mean_grad/ShapeShape!critic/q/q1_encoding_1/Mean/input*
T0*
out_type0
�
1gradients_1/critic/q/q1_encoding_1/Mean_grad/SizeConst*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*
value	B :*
dtype0
�
0gradients_1/critic/q/q1_encoding_1/Mean_grad/addAddV2-critic/q/q1_encoding_1/Mean/reduction_indices1gradients_1/critic/q/q1_encoding_1/Mean_grad/Size*
T0*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape
�
0gradients_1/critic/q/q1_encoding_1/Mean_grad/modFloorMod0gradients_1/critic/q/q1_encoding_1/Mean_grad/add1gradients_1/critic/q/q1_encoding_1/Mean_grad/Size*
T0*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape
�
4gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape_1Const*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*
valueB *
dtype0
�
8gradients_1/critic/q/q1_encoding_1/Mean_grad/range/startConst*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*
value	B : *
dtype0
�
8gradients_1/critic/q/q1_encoding_1/Mean_grad/range/deltaConst*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*
value	B :*
dtype0
�
2gradients_1/critic/q/q1_encoding_1/Mean_grad/rangeRange8gradients_1/critic/q/q1_encoding_1/Mean_grad/range/start1gradients_1/critic/q/q1_encoding_1/Mean_grad/Size8gradients_1/critic/q/q1_encoding_1/Mean_grad/range/delta*

Tidx0*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape
�
7gradients_1/critic/q/q1_encoding_1/Mean_grad/Fill/valueConst*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*
value	B :*
dtype0
�
1gradients_1/critic/q/q1_encoding_1/Mean_grad/FillFill4gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape_17gradients_1/critic/q/q1_encoding_1/Mean_grad/Fill/value*
T0*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*

index_type0
�
:gradients_1/critic/q/q1_encoding_1/Mean_grad/DynamicStitchDynamicStitch2gradients_1/critic/q/q1_encoding_1/Mean_grad/range0gradients_1/critic/q/q1_encoding_1/Mean_grad/mod2gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape1gradients_1/critic/q/q1_encoding_1/Mean_grad/Fill*
T0*E
_class;
97loc:@gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*
N
�
4gradients_1/critic/q/q1_encoding_1/Mean_grad/ReshapeReshape1gradients_1/sub_5_grad/tuple/control_dependency_1:gradients_1/critic/q/q1_encoding_1/Mean_grad/DynamicStitch*
T0*
Tshape0
�
8gradients_1/critic/q/q1_encoding_1/Mean_grad/BroadcastToBroadcastTo4gradients_1/critic/q/q1_encoding_1/Mean_grad/Reshape2gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape*

Tidx0*
T0
y
4gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape_2Shape!critic/q/q1_encoding_1/Mean/input*
T0*
out_type0
s
4gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape_3Shapecritic/q/q1_encoding_1/Mean*
T0*
out_type0
`
2gradients_1/critic/q/q1_encoding_1/Mean_grad/ConstConst*
valueB: *
dtype0
�
1gradients_1/critic/q/q1_encoding_1/Mean_grad/ProdProd4gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape_22gradients_1/critic/q/q1_encoding_1/Mean_grad/Const*

Tidx0*
	keep_dims( *
T0
b
4gradients_1/critic/q/q1_encoding_1/Mean_grad/Const_1Const*
valueB: *
dtype0
�
3gradients_1/critic/q/q1_encoding_1/Mean_grad/Prod_1Prod4gradients_1/critic/q/q1_encoding_1/Mean_grad/Shape_34gradients_1/critic/q/q1_encoding_1/Mean_grad/Const_1*

Tidx0*
	keep_dims( *
T0
`
6gradients_1/critic/q/q1_encoding_1/Mean_grad/Maximum/yConst*
value	B :*
dtype0
�
4gradients_1/critic/q/q1_encoding_1/Mean_grad/MaximumMaximum3gradients_1/critic/q/q1_encoding_1/Mean_grad/Prod_16gradients_1/critic/q/q1_encoding_1/Mean_grad/Maximum/y*
T0
�
5gradients_1/critic/q/q1_encoding_1/Mean_grad/floordivFloorDiv1gradients_1/critic/q/q1_encoding_1/Mean_grad/Prod4gradients_1/critic/q/q1_encoding_1/Mean_grad/Maximum*
T0
�
1gradients_1/critic/q/q1_encoding_1/Mean_grad/CastCast5gradients_1/critic/q/q1_encoding_1/Mean_grad/floordiv*

SrcT0*
Truncate( *

DstT0
�
4gradients_1/critic/q/q1_encoding_1/Mean_grad/truedivRealDiv8gradients_1/critic/q/q1_encoding_1/Mean_grad/BroadcastTo1gradients_1/critic/q/q1_encoding_1/Mean_grad/Cast*
T0
�
:gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstackUnpack4gradients_1/critic/q/q1_encoding_1/Mean_grad/truediv*
T0*	
num*

axis 
�
Cgradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/group_depsNoOp;^gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstack
�
Kgradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependencyIdentity:gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstackD^gradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstack
�
Mgradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependency_1Identity<gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstack:1D^gradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstack
W
%gradients_1/policy_1/sub_2_grad/ShapeShapepolicy_1/mul_2*
T0*
out_type0
W
'gradients_1/policy_1/sub_2_grad/Shape_1Shapepolicy_1/Log*
T0*
out_type0
�
5gradients_1/policy_1/sub_2_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/sub_2_grad/Shape'gradients_1/policy_1/sub_2_grad/Shape_1*
T0
�
#gradients_1/policy_1/sub_2_grad/SumSum2gradients_1/mul_21_grad/tuple/control_dependency_15gradients_1/policy_1/sub_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/sub_2_grad/ReshapeReshape#gradients_1/policy_1/sub_2_grad/Sum%gradients_1/policy_1/sub_2_grad/Shape*
T0*
Tshape0
g
#gradients_1/policy_1/sub_2_grad/NegNeg2gradients_1/mul_21_grad/tuple/control_dependency_1*
T0
�
%gradients_1/policy_1/sub_2_grad/Sum_1Sum#gradients_1/policy_1/sub_2_grad/Neg7gradients_1/policy_1/sub_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/sub_2_grad/Reshape_1Reshape%gradients_1/policy_1/sub_2_grad/Sum_1'gradients_1/policy_1/sub_2_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/sub_2_grad/tuple/group_depsNoOp(^gradients_1/policy_1/sub_2_grad/Reshape*^gradients_1/policy_1/sub_2_grad/Reshape_1
�
8gradients_1/policy_1/sub_2_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/sub_2_grad/Reshape1^gradients_1/policy_1/sub_2_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/sub_2_grad/Reshape
�
:gradients_1/policy_1/sub_2_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/sub_2_grad/Reshape_11^gradients_1/policy_1/sub_2_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/sub_2_grad/Reshape_1
�
Hgradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/BiasAddGradBiasAddGradKgradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependency*
T0*
data_formatNHWC
�
Mgradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/tuple/group_depsNoOpL^gradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependencyI^gradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/BiasAddGrad
�
Ugradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/tuple/control_dependencyIdentityKgradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependencyN^gradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstack
�
Wgradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/tuple/control_dependency_1IdentityHgradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/BiasAddGradN^gradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/BiasAddGrad
�
Hgradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/BiasAddGradBiasAddGradMgradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependency_1*
T0*
data_formatNHWC
�
Mgradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/tuple/group_depsNoOpN^gradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependency_1I^gradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/BiasAddGrad
�
Ugradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/tuple/control_dependencyIdentityMgradients_1/critic/q/q1_encoding_1/Mean/input_grad/tuple/control_dependency_1N^gradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_1/critic/q/q1_encoding_1/Mean/input_grad/unstack
�
Wgradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/tuple/control_dependency_1IdentityHgradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/BiasAddGradN^gradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/tuple/group_deps*
T0*[
_classQ
OMloc:@gradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/BiasAddGrad
Y
%gradients_1/policy_1/mul_2_grad/ShapeShapepolicy_1/mul_2/x*
T0*
out_type0
Y
'gradients_1/policy_1/mul_2_grad/Shape_1Shapepolicy_1/add_3*
T0*
out_type0
�
5gradients_1/policy_1/mul_2_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/mul_2_grad/Shape'gradients_1/policy_1/mul_2_grad/Shape_1*
T0
}
#gradients_1/policy_1/mul_2_grad/MulMul8gradients_1/policy_1/sub_2_grad/tuple/control_dependencypolicy_1/add_3*
T0
�
#gradients_1/policy_1/mul_2_grad/SumSum#gradients_1/policy_1/mul_2_grad/Mul5gradients_1/policy_1/mul_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/mul_2_grad/ReshapeReshape#gradients_1/policy_1/mul_2_grad/Sum%gradients_1/policy_1/mul_2_grad/Shape*
T0*
Tshape0
�
%gradients_1/policy_1/mul_2_grad/Mul_1Mulpolicy_1/mul_2/x8gradients_1/policy_1/sub_2_grad/tuple/control_dependency*
T0
�
%gradients_1/policy_1/mul_2_grad/Sum_1Sum%gradients_1/policy_1/mul_2_grad/Mul_17gradients_1/policy_1/mul_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/mul_2_grad/Reshape_1Reshape%gradients_1/policy_1/mul_2_grad/Sum_1'gradients_1/policy_1/mul_2_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/mul_2_grad/tuple/group_depsNoOp(^gradients_1/policy_1/mul_2_grad/Reshape*^gradients_1/policy_1/mul_2_grad/Reshape_1
�
8gradients_1/policy_1/mul_2_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/mul_2_grad/Reshape1^gradients_1/policy_1/mul_2_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/mul_2_grad/Reshape
�
:gradients_1/policy_1/mul_2_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/mul_2_grad/Reshape_11^gradients_1/policy_1/mul_2_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/mul_2_grad/Reshape_1
�
(gradients_1/policy_1/Log_grad/Reciprocal
Reciprocalpolicy_1/add_4;^gradients_1/policy_1/sub_2_grad/tuple/control_dependency_1*
T0
�
!gradients_1/policy_1/Log_grad/mulMul:gradients_1/policy_1/sub_2_grad/tuple/control_dependency_1(gradients_1/policy_1/Log_grad/Reciprocal*
T0
�
Bgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMulMatMulUgradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/tuple/control_dependency-critic/q/q1_encoding/extrinsic_q1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Dgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMul_1MatMul.critic/q/q1_encoding_1/q1_encoder/hidden_3/MulUgradients_1/critic/q/q1_encoding_1/extrinsic_q1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Lgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/tuple/group_depsNoOpC^gradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMulE^gradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMul_1
�
Tgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/tuple/control_dependencyIdentityBgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMulM^gradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMul
�
Vgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/tuple/control_dependency_1IdentityDgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMul_1M^gradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMul_1
�
Bgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMulMatMulUgradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/tuple/control_dependency-critic/q/q1_encoding/curiosity_q1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Dgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMul_1MatMul.critic/q/q1_encoding_1/q1_encoder/hidden_3/MulUgradients_1/critic/q/q1_encoding_1/curiosity_q1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Lgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/tuple/group_depsNoOpC^gradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMulE^gradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMul_1
�
Tgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/tuple/control_dependencyIdentityBgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMulM^gradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMul
�
Vgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/tuple/control_dependency_1IdentityDgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMul_1M^gradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/tuple/group_deps*
T0*W
_classM
KIloc:@gradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/MatMul_1
W
%gradients_1/policy_1/add_3_grad/ShapeShapepolicy_1/add_2*
T0*
out_type0
[
'gradients_1/policy_1/add_3_grad/Shape_1Shapepolicy_1/add_3/y*
T0*
out_type0
�
5gradients_1/policy_1/add_3_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/add_3_grad/Shape'gradients_1/policy_1/add_3_grad/Shape_1*
T0
�
#gradients_1/policy_1/add_3_grad/SumSum:gradients_1/policy_1/mul_2_grad/tuple/control_dependency_15gradients_1/policy_1/add_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/add_3_grad/ReshapeReshape#gradients_1/policy_1/add_3_grad/Sum%gradients_1/policy_1/add_3_grad/Shape*
T0*
Tshape0
�
%gradients_1/policy_1/add_3_grad/Sum_1Sum:gradients_1/policy_1/mul_2_grad/tuple/control_dependency_17gradients_1/policy_1/add_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/add_3_grad/Reshape_1Reshape%gradients_1/policy_1/add_3_grad/Sum_1'gradients_1/policy_1/add_3_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/add_3_grad/tuple/group_depsNoOp(^gradients_1/policy_1/add_3_grad/Reshape*^gradients_1/policy_1/add_3_grad/Reshape_1
�
8gradients_1/policy_1/add_3_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/add_3_grad/Reshape1^gradients_1/policy_1/add_3_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/add_3_grad/Reshape
�
:gradients_1/policy_1/add_3_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/add_3_grad/Reshape_11^gradients_1/policy_1/add_3_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/add_3_grad/Reshape_1
W
%gradients_1/policy_1/add_4_grad/ShapeShapepolicy_1/sub_1*
T0*
out_type0
[
'gradients_1/policy_1/add_4_grad/Shape_1Shapepolicy_1/add_4/y*
T0*
out_type0
�
5gradients_1/policy_1/add_4_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/add_4_grad/Shape'gradients_1/policy_1/add_4_grad/Shape_1*
T0
�
#gradients_1/policy_1/add_4_grad/SumSum!gradients_1/policy_1/Log_grad/mul5gradients_1/policy_1/add_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/add_4_grad/ReshapeReshape#gradients_1/policy_1/add_4_grad/Sum%gradients_1/policy_1/add_4_grad/Shape*
T0*
Tshape0
�
%gradients_1/policy_1/add_4_grad/Sum_1Sum!gradients_1/policy_1/Log_grad/mul7gradients_1/policy_1/add_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/add_4_grad/Reshape_1Reshape%gradients_1/policy_1/add_4_grad/Sum_1'gradients_1/policy_1/add_4_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/add_4_grad/tuple/group_depsNoOp(^gradients_1/policy_1/add_4_grad/Reshape*^gradients_1/policy_1/add_4_grad/Reshape_1
�
8gradients_1/policy_1/add_4_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/add_4_grad/Reshape1^gradients_1/policy_1/add_4_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/add_4_grad/Reshape
�
:gradients_1/policy_1/add_4_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/add_4_grad/Reshape_11^gradients_1/policy_1/add_4_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/add_4_grad/Reshape_1
�
gradients_1/AddNAddNTgradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/tuple/control_dependencyTgradients_1/critic/q/q1_encoding_1/curiosity_q1/MatMul_grad/tuple/control_dependency*
T0*U
_classK
IGloc:@gradients_1/critic/q/q1_encoding_1/extrinsic_q1/MatMul_grad/MatMul*
N
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/ShapeShape2critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd*
T0*
out_type0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Shape_1Shape2critic/q/q1_encoding_1/q1_encoder/hidden_3/Sigmoid*
T0*
out_type0
�
Ugradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/ShapeGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Shape_1*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/MulMulgradients_1/AddN2critic/q/q1_encoding_1/q1_encoder/hidden_3/Sigmoid*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/SumSumCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/MulUgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/ReshapeReshapeCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Shape*
T0*
Tshape0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Mul_1Mul2critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAddgradients_1/AddN*
T0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Sum_1SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Mul_1Wgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Reshape_1ReshapeEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Sum_1Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
�
Pgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/tuple/group_depsNoOpH^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/ReshapeJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Reshape_1
�
Xgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/tuple/control_dependencyIdentityGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/ReshapeQ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Reshape
�
Zgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/tuple/control_dependency_1IdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Reshape_1Q^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Reshape_1
U
%gradients_1/policy_1/add_2_grad/ShapeShapepolicy_1/pow*
T0*
out_type0
Y
'gradients_1/policy_1/add_2_grad/Shape_1Shapepolicy_1/mul_1*
T0*
out_type0
�
5gradients_1/policy_1/add_2_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/add_2_grad/Shape'gradients_1/policy_1/add_2_grad/Shape_1*
T0
�
#gradients_1/policy_1/add_2_grad/SumSum8gradients_1/policy_1/add_3_grad/tuple/control_dependency5gradients_1/policy_1/add_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/add_2_grad/ReshapeReshape#gradients_1/policy_1/add_2_grad/Sum%gradients_1/policy_1/add_2_grad/Shape*
T0*
Tshape0
�
%gradients_1/policy_1/add_2_grad/Sum_1Sum8gradients_1/policy_1/add_3_grad/tuple/control_dependency7gradients_1/policy_1/add_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/add_2_grad/Reshape_1Reshape%gradients_1/policy_1/add_2_grad/Sum_1'gradients_1/policy_1/add_2_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/add_2_grad/tuple/group_depsNoOp(^gradients_1/policy_1/add_2_grad/Reshape*^gradients_1/policy_1/add_2_grad/Reshape_1
�
8gradients_1/policy_1/add_2_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/add_2_grad/Reshape1^gradients_1/policy_1/add_2_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/add_2_grad/Reshape
�
:gradients_1/policy_1/add_2_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/add_2_grad/Reshape_11^gradients_1/policy_1/add_2_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/add_2_grad/Reshape_1
Y
%gradients_1/policy_1/sub_1_grad/ShapeShapepolicy_1/sub_1/x*
T0*
out_type0
Y
'gradients_1/policy_1/sub_1_grad/Shape_1Shapepolicy_1/pow_1*
T0*
out_type0
�
5gradients_1/policy_1/sub_1_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/sub_1_grad/Shape'gradients_1/policy_1/sub_1_grad/Shape_1*
T0
�
#gradients_1/policy_1/sub_1_grad/SumSum8gradients_1/policy_1/add_4_grad/tuple/control_dependency5gradients_1/policy_1/sub_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/sub_1_grad/ReshapeReshape#gradients_1/policy_1/sub_1_grad/Sum%gradients_1/policy_1/sub_1_grad/Shape*
T0*
Tshape0
m
#gradients_1/policy_1/sub_1_grad/NegNeg8gradients_1/policy_1/add_4_grad/tuple/control_dependency*
T0
�
%gradients_1/policy_1/sub_1_grad/Sum_1Sum#gradients_1/policy_1/sub_1_grad/Neg7gradients_1/policy_1/sub_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/sub_1_grad/Reshape_1Reshape%gradients_1/policy_1/sub_1_grad/Sum_1'gradients_1/policy_1/sub_1_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/sub_1_grad/tuple/group_depsNoOp(^gradients_1/policy_1/sub_1_grad/Reshape*^gradients_1/policy_1/sub_1_grad/Reshape_1
�
8gradients_1/policy_1/sub_1_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/sub_1_grad/Reshape1^gradients_1/policy_1/sub_1_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/sub_1_grad/Reshape
�
:gradients_1/policy_1/sub_1_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/sub_1_grad/Reshape_11^gradients_1/policy_1/sub_1_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/sub_1_grad/Reshape_1
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGrad2critic/q/q1_encoding_1/q1_encoder/hidden_3/SigmoidZgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
W
#gradients_1/policy_1/pow_grad/ShapeShapepolicy_1/truediv*
T0*
out_type0
W
%gradients_1/policy_1/pow_grad/Shape_1Shapepolicy_1/pow/y*
T0*
out_type0
�
3gradients_1/policy_1/pow_grad/BroadcastGradientArgsBroadcastGradientArgs#gradients_1/policy_1/pow_grad/Shape%gradients_1/policy_1/pow_grad/Shape_1*
T0
{
!gradients_1/policy_1/pow_grad/mulMul8gradients_1/policy_1/add_2_grad/tuple/control_dependencypolicy_1/pow/y*
T0
P
#gradients_1/policy_1/pow_grad/sub/yConst*
valueB
 *  �?*
dtype0
f
!gradients_1/policy_1/pow_grad/subSubpolicy_1/pow/y#gradients_1/policy_1/pow_grad/sub/y*
T0
f
!gradients_1/policy_1/pow_grad/PowPowpolicy_1/truediv!gradients_1/policy_1/pow_grad/sub*
T0
y
#gradients_1/policy_1/pow_grad/mul_1Mul!gradients_1/policy_1/pow_grad/mul!gradients_1/policy_1/pow_grad/Pow*
T0
�
!gradients_1/policy_1/pow_grad/SumSum#gradients_1/policy_1/pow_grad/mul_13gradients_1/policy_1/pow_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
%gradients_1/policy_1/pow_grad/ReshapeReshape!gradients_1/policy_1/pow_grad/Sum#gradients_1/policy_1/pow_grad/Shape*
T0*
Tshape0
T
'gradients_1/policy_1/pow_grad/Greater/yConst*
valueB
 *    *
dtype0
t
%gradients_1/policy_1/pow_grad/GreaterGreaterpolicy_1/truediv'gradients_1/policy_1/pow_grad/Greater/y*
T0
a
-gradients_1/policy_1/pow_grad/ones_like/ShapeShapepolicy_1/truediv*
T0*
out_type0
Z
-gradients_1/policy_1/pow_grad/ones_like/ConstConst*
valueB
 *  �?*
dtype0
�
'gradients_1/policy_1/pow_grad/ones_likeFill-gradients_1/policy_1/pow_grad/ones_like/Shape-gradients_1/policy_1/pow_grad/ones_like/Const*
T0*

index_type0
�
$gradients_1/policy_1/pow_grad/SelectSelect%gradients_1/policy_1/pow_grad/Greaterpolicy_1/truediv'gradients_1/policy_1/pow_grad/ones_like*
T0
W
!gradients_1/policy_1/pow_grad/LogLog$gradients_1/policy_1/pow_grad/Select*
T0
P
(gradients_1/policy_1/pow_grad/zeros_like	ZerosLikepolicy_1/truediv*
T0
�
&gradients_1/policy_1/pow_grad/Select_1Select%gradients_1/policy_1/pow_grad/Greater!gradients_1/policy_1/pow_grad/Log(gradients_1/policy_1/pow_grad/zeros_like*
T0
{
#gradients_1/policy_1/pow_grad/mul_2Mul8gradients_1/policy_1/add_2_grad/tuple/control_dependencypolicy_1/pow*
T0
�
#gradients_1/policy_1/pow_grad/mul_3Mul#gradients_1/policy_1/pow_grad/mul_2&gradients_1/policy_1/pow_grad/Select_1*
T0
�
#gradients_1/policy_1/pow_grad/Sum_1Sum#gradients_1/policy_1/pow_grad/mul_35gradients_1/policy_1/pow_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/pow_grad/Reshape_1Reshape#gradients_1/policy_1/pow_grad/Sum_1%gradients_1/policy_1/pow_grad/Shape_1*
T0*
Tshape0
�
.gradients_1/policy_1/pow_grad/tuple/group_depsNoOp&^gradients_1/policy_1/pow_grad/Reshape(^gradients_1/policy_1/pow_grad/Reshape_1
�
6gradients_1/policy_1/pow_grad/tuple/control_dependencyIdentity%gradients_1/policy_1/pow_grad/Reshape/^gradients_1/policy_1/pow_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/policy_1/pow_grad/Reshape
�
8gradients_1/policy_1/pow_grad/tuple/control_dependency_1Identity'gradients_1/policy_1/pow_grad/Reshape_1/^gradients_1/policy_1/pow_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/pow_grad/Reshape_1
Y
%gradients_1/policy_1/mul_1_grad/ShapeShapepolicy_1/mul_1/x*
T0*
out_type0
a
'gradients_1/policy_1/mul_1_grad/Shape_1Shapepolicy_1/clip_by_value*
T0*
out_type0
�
5gradients_1/policy_1/mul_1_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/mul_1_grad/Shape'gradients_1/policy_1/mul_1_grad/Shape_1*
T0
�
#gradients_1/policy_1/mul_1_grad/MulMul:gradients_1/policy_1/add_2_grad/tuple/control_dependency_1policy_1/clip_by_value*
T0
�
#gradients_1/policy_1/mul_1_grad/SumSum#gradients_1/policy_1/mul_1_grad/Mul5gradients_1/policy_1/mul_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/mul_1_grad/ReshapeReshape#gradients_1/policy_1/mul_1_grad/Sum%gradients_1/policy_1/mul_1_grad/Shape*
T0*
Tshape0
�
%gradients_1/policy_1/mul_1_grad/Mul_1Mulpolicy_1/mul_1/x:gradients_1/policy_1/add_2_grad/tuple/control_dependency_1*
T0
�
%gradients_1/policy_1/mul_1_grad/Sum_1Sum%gradients_1/policy_1/mul_1_grad/Mul_17gradients_1/policy_1/mul_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/mul_1_grad/Reshape_1Reshape%gradients_1/policy_1/mul_1_grad/Sum_1'gradients_1/policy_1/mul_1_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/mul_1_grad/tuple/group_depsNoOp(^gradients_1/policy_1/mul_1_grad/Reshape*^gradients_1/policy_1/mul_1_grad/Reshape_1
�
8gradients_1/policy_1/mul_1_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/mul_1_grad/Reshape1^gradients_1/policy_1/mul_1_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/mul_1_grad/Reshape
�
:gradients_1/policy_1/mul_1_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/mul_1_grad/Reshape_11^gradients_1/policy_1/mul_1_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/mul_1_grad/Reshape_1
V
%gradients_1/policy_1/pow_1_grad/ShapeShapepolicy_1/Tanh*
T0*
out_type0
[
'gradients_1/policy_1/pow_1_grad/Shape_1Shapepolicy_1/pow_1/y*
T0*
out_type0
�
5gradients_1/policy_1/pow_1_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/pow_1_grad/Shape'gradients_1/policy_1/pow_1_grad/Shape_1*
T0
�
#gradients_1/policy_1/pow_1_grad/mulMul:gradients_1/policy_1/sub_1_grad/tuple/control_dependency_1policy_1/pow_1/y*
T0
R
%gradients_1/policy_1/pow_1_grad/sub/yConst*
valueB
 *  �?*
dtype0
l
#gradients_1/policy_1/pow_1_grad/subSubpolicy_1/pow_1/y%gradients_1/policy_1/pow_1_grad/sub/y*
T0
g
#gradients_1/policy_1/pow_1_grad/PowPowpolicy_1/Tanh#gradients_1/policy_1/pow_1_grad/sub*
T0

%gradients_1/policy_1/pow_1_grad/mul_1Mul#gradients_1/policy_1/pow_1_grad/mul#gradients_1/policy_1/pow_1_grad/Pow*
T0
�
#gradients_1/policy_1/pow_1_grad/SumSum%gradients_1/policy_1/pow_1_grad/mul_15gradients_1/policy_1/pow_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/pow_1_grad/ReshapeReshape#gradients_1/policy_1/pow_1_grad/Sum%gradients_1/policy_1/pow_1_grad/Shape*
T0*
Tshape0
V
)gradients_1/policy_1/pow_1_grad/Greater/yConst*
valueB
 *    *
dtype0
u
'gradients_1/policy_1/pow_1_grad/GreaterGreaterpolicy_1/Tanh)gradients_1/policy_1/pow_1_grad/Greater/y*
T0
`
/gradients_1/policy_1/pow_1_grad/ones_like/ShapeShapepolicy_1/Tanh*
T0*
out_type0
\
/gradients_1/policy_1/pow_1_grad/ones_like/ConstConst*
valueB
 *  �?*
dtype0
�
)gradients_1/policy_1/pow_1_grad/ones_likeFill/gradients_1/policy_1/pow_1_grad/ones_like/Shape/gradients_1/policy_1/pow_1_grad/ones_like/Const*
T0*

index_type0
�
&gradients_1/policy_1/pow_1_grad/SelectSelect'gradients_1/policy_1/pow_1_grad/Greaterpolicy_1/Tanh)gradients_1/policy_1/pow_1_grad/ones_like*
T0
[
#gradients_1/policy_1/pow_1_grad/LogLog&gradients_1/policy_1/pow_1_grad/Select*
T0
O
*gradients_1/policy_1/pow_1_grad/zeros_like	ZerosLikepolicy_1/Tanh*
T0
�
(gradients_1/policy_1/pow_1_grad/Select_1Select'gradients_1/policy_1/pow_1_grad/Greater#gradients_1/policy_1/pow_1_grad/Log*gradients_1/policy_1/pow_1_grad/zeros_like*
T0
�
%gradients_1/policy_1/pow_1_grad/mul_2Mul:gradients_1/policy_1/sub_1_grad/tuple/control_dependency_1policy_1/pow_1*
T0
�
%gradients_1/policy_1/pow_1_grad/mul_3Mul%gradients_1/policy_1/pow_1_grad/mul_2(gradients_1/policy_1/pow_1_grad/Select_1*
T0
�
%gradients_1/policy_1/pow_1_grad/Sum_1Sum%gradients_1/policy_1/pow_1_grad/mul_37gradients_1/policy_1/pow_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/pow_1_grad/Reshape_1Reshape%gradients_1/policy_1/pow_1_grad/Sum_1'gradients_1/policy_1/pow_1_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/pow_1_grad/tuple/group_depsNoOp(^gradients_1/policy_1/pow_1_grad/Reshape*^gradients_1/policy_1/pow_1_grad/Reshape_1
�
8gradients_1/policy_1/pow_1_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/pow_1_grad/Reshape1^gradients_1/policy_1/pow_1_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/pow_1_grad/Reshape
�
:gradients_1/policy_1/pow_1_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/pow_1_grad/Reshape_11^gradients_1/policy_1/pow_1_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/pow_1_grad/Reshape_1
�
gradients_1/AddN_1AddNXgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/tuple/control_dependencyOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Reshape*
N
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_1*
T0*
data_formatNHWC
�
Tgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_1P^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGrad
�
\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_1U^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/Mul_grad/Reshape
�
^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency_1IdentityOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGradU^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*b
_classX
VTloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGrad
W
'gradients_1/policy_1/truediv_grad/ShapeShapepolicy_1/sub*
T0*
out_type0
[
)gradients_1/policy_1/truediv_grad/Shape_1Shapepolicy_1/add_1*
T0*
out_type0
�
7gradients_1/policy_1/truediv_grad/BroadcastGradientArgsBroadcastGradientArgs'gradients_1/policy_1/truediv_grad/Shape)gradients_1/policy_1/truediv_grad/Shape_1*
T0
�
)gradients_1/policy_1/truediv_grad/RealDivRealDiv6gradients_1/policy_1/pow_grad/tuple/control_dependencypolicy_1/add_1*
T0
�
%gradients_1/policy_1/truediv_grad/SumSum)gradients_1/policy_1/truediv_grad/RealDiv7gradients_1/policy_1/truediv_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/truediv_grad/ReshapeReshape%gradients_1/policy_1/truediv_grad/Sum'gradients_1/policy_1/truediv_grad/Shape*
T0*
Tshape0
C
%gradients_1/policy_1/truediv_grad/NegNegpolicy_1/sub*
T0
v
+gradients_1/policy_1/truediv_grad/RealDiv_1RealDiv%gradients_1/policy_1/truediv_grad/Negpolicy_1/add_1*
T0
|
+gradients_1/policy_1/truediv_grad/RealDiv_2RealDiv+gradients_1/policy_1/truediv_grad/RealDiv_1policy_1/add_1*
T0
�
%gradients_1/policy_1/truediv_grad/mulMul6gradients_1/policy_1/pow_grad/tuple/control_dependency+gradients_1/policy_1/truediv_grad/RealDiv_2*
T0
�
'gradients_1/policy_1/truediv_grad/Sum_1Sum%gradients_1/policy_1/truediv_grad/mul9gradients_1/policy_1/truediv_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
+gradients_1/policy_1/truediv_grad/Reshape_1Reshape'gradients_1/policy_1/truediv_grad/Sum_1)gradients_1/policy_1/truediv_grad/Shape_1*
T0*
Tshape0
�
2gradients_1/policy_1/truediv_grad/tuple/group_depsNoOp*^gradients_1/policy_1/truediv_grad/Reshape,^gradients_1/policy_1/truediv_grad/Reshape_1
�
:gradients_1/policy_1/truediv_grad/tuple/control_dependencyIdentity)gradients_1/policy_1/truediv_grad/Reshape3^gradients_1/policy_1/truediv_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/truediv_grad/Reshape
�
<gradients_1/policy_1/truediv_grad/tuple/control_dependency_1Identity+gradients_1/policy_1/truediv_grad/Reshape_13^gradients_1/policy_1/truediv_grad/tuple/group_deps*
T0*>
_class4
20loc:@gradients_1/policy_1/truediv_grad/Reshape_1
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMulMatMul\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Kgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMul_1MatMul.critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Sgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/tuple/group_depsNoOpJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMulL^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMul_1
�
[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependencyIdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMulT^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMul
�
]gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependency_1IdentityKgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMul_1T^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*^
_classT
RPloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/MatMul_1
S
#gradients_1/policy_1/sub_grad/ShapeShapepolicy_1/add*
T0*
out_type0
\
%gradients_1/policy_1/sub_grad/Shape_1Shapepolicy_1/mu/BiasAdd*
T0*
out_type0
�
3gradients_1/policy_1/sub_grad/BroadcastGradientArgsBroadcastGradientArgs#gradients_1/policy_1/sub_grad/Shape%gradients_1/policy_1/sub_grad/Shape_1*
T0
�
!gradients_1/policy_1/sub_grad/SumSum:gradients_1/policy_1/truediv_grad/tuple/control_dependency3gradients_1/policy_1/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
%gradients_1/policy_1/sub_grad/ReshapeReshape!gradients_1/policy_1/sub_grad/Sum#gradients_1/policy_1/sub_grad/Shape*
T0*
Tshape0
m
!gradients_1/policy_1/sub_grad/NegNeg:gradients_1/policy_1/truediv_grad/tuple/control_dependency*
T0
�
#gradients_1/policy_1/sub_grad/Sum_1Sum!gradients_1/policy_1/sub_grad/Neg5gradients_1/policy_1/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/sub_grad/Reshape_1Reshape#gradients_1/policy_1/sub_grad/Sum_1%gradients_1/policy_1/sub_grad/Shape_1*
T0*
Tshape0
�
.gradients_1/policy_1/sub_grad/tuple/group_depsNoOp&^gradients_1/policy_1/sub_grad/Reshape(^gradients_1/policy_1/sub_grad/Reshape_1
�
6gradients_1/policy_1/sub_grad/tuple/control_dependencyIdentity%gradients_1/policy_1/sub_grad/Reshape/^gradients_1/policy_1/sub_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/policy_1/sub_grad/Reshape
�
8gradients_1/policy_1/sub_grad/tuple/control_dependency_1Identity'gradients_1/policy_1/sub_grad/Reshape_1/^gradients_1/policy_1/sub_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/sub_grad/Reshape_1
U
%gradients_1/policy_1/add_1_grad/ShapeShapepolicy_1/Exp*
T0*
out_type0
[
'gradients_1/policy_1/add_1_grad/Shape_1Shapepolicy_1/add_1/y*
T0*
out_type0
�
5gradients_1/policy_1/add_1_grad/BroadcastGradientArgsBroadcastGradientArgs%gradients_1/policy_1/add_1_grad/Shape'gradients_1/policy_1/add_1_grad/Shape_1*
T0
�
#gradients_1/policy_1/add_1_grad/SumSum<gradients_1/policy_1/truediv_grad/tuple/control_dependency_15gradients_1/policy_1/add_1_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/add_1_grad/ReshapeReshape#gradients_1/policy_1/add_1_grad/Sum%gradients_1/policy_1/add_1_grad/Shape*
T0*
Tshape0
�
%gradients_1/policy_1/add_1_grad/Sum_1Sum<gradients_1/policy_1/truediv_grad/tuple/control_dependency_17gradients_1/policy_1/add_1_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
)gradients_1/policy_1/add_1_grad/Reshape_1Reshape%gradients_1/policy_1/add_1_grad/Sum_1'gradients_1/policy_1/add_1_grad/Shape_1*
T0*
Tshape0
�
0gradients_1/policy_1/add_1_grad/tuple/group_depsNoOp(^gradients_1/policy_1/add_1_grad/Reshape*^gradients_1/policy_1/add_1_grad/Reshape_1
�
8gradients_1/policy_1/add_1_grad/tuple/control_dependencyIdentity'gradients_1/policy_1/add_1_grad/Reshape1^gradients_1/policy_1/add_1_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/add_1_grad/Reshape
�
:gradients_1/policy_1/add_1_grad/tuple/control_dependency_1Identity)gradients_1/policy_1/add_1_grad/Reshape_11^gradients_1/policy_1/add_1_grad/tuple/group_deps*
T0*<
_class2
0.loc:@gradients_1/policy_1/add_1_grad/Reshape_1
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/ShapeShape2critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd*
T0*
out_type0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Shape_1Shape2critic/q/q1_encoding_1/q1_encoder/hidden_2/Sigmoid*
T0*
out_type0
�
Ugradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/ShapeGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Shape_1*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/MulMul[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependency2critic/q/q1_encoding_1/q1_encoder/hidden_2/Sigmoid*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/SumSumCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/MulUgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/ReshapeReshapeCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Shape*
T0*
Tshape0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Mul_1Mul2critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependency*
T0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Sum_1SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Mul_1Wgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Reshape_1ReshapeEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Sum_1Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
�
Pgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/tuple/group_depsNoOpH^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/ReshapeJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Reshape_1
�
Xgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/tuple/control_dependencyIdentityGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/ReshapeQ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Reshape
�
Zgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/tuple/control_dependency_1IdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Reshape_1Q^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Reshape_1
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGrad2critic/q/q1_encoding_1/q1_encoder/hidden_2/SigmoidZgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_2AddNXgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/tuple/control_dependencyOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Reshape*
N
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_2*
T0*
data_formatNHWC
�
Tgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_2P^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGrad
�
\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_2U^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/Mul_grad/Reshape
�
^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency_1IdentityOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGradU^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*b
_classX
VTloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGrad
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMulMatMul\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Kgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMul_1MatMul.critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Sgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/tuple/group_depsNoOpJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMulL^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMul_1
�
[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependencyIdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMulT^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMul
�
]gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependency_1IdentityKgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMul_1T^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*^
_classT
RPloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/MatMul_1
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/ShapeShape2critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd*
T0*
out_type0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Shape_1Shape2critic/q/q1_encoding_1/q1_encoder/hidden_1/Sigmoid*
T0*
out_type0
�
Ugradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/ShapeGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Shape_1*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/MulMul[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependency2critic/q/q1_encoding_1/q1_encoder/hidden_1/Sigmoid*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/SumSumCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/MulUgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/ReshapeReshapeCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Mul_1Mul2critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependency*
T0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Sum_1SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Mul_1Wgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Reshape_1ReshapeEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Sum_1Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Pgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/tuple/group_depsNoOpH^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/ReshapeJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Reshape_1
�
Xgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/tuple/control_dependencyIdentityGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/ReshapeQ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Reshape
�
Zgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/tuple/control_dependency_1IdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Reshape_1Q^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Reshape_1
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad2critic/q/q1_encoding_1/q1_encoder/hidden_1/SigmoidZgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_3AddNXgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/tuple/control_dependencyOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Reshape*
N
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_3*
T0*
data_formatNHWC
�
Tgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_3P^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_3U^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/Mul_grad/Reshape
�
^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGradU^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*b
_classX
VTloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMulMatMul\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Kgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMul_1MatMul.critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Sgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/tuple/group_depsNoOpJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMulL^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMul_1
�
[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependencyIdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMulT^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMul
�
]gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityKgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMul_1T^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*^
_classT
RPloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/MatMul_1
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/ShapeShape2critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd*
T0*
out_type0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Shape_1Shape2critic/q/q1_encoding_1/q1_encoder/hidden_0/Sigmoid*
T0*
out_type0
�
Ugradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/ShapeGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Shape_1*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/MulMul[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependency2critic/q/q1_encoding_1/q1_encoder/hidden_0/Sigmoid*
T0
�
Cgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/SumSumCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/MulUgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/ReshapeReshapeCgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Mul_1Mul2critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
Egradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Sum_1SumEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Mul_1Wgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Reshape_1ReshapeEgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Sum_1Ggradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Pgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/tuple/group_depsNoOpH^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/ReshapeJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Reshape_1
�
Xgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/tuple/control_dependencyIdentityGgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/ReshapeQ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Reshape
�
Zgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/tuple/control_dependency_1IdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Reshape_1Q^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Reshape_1
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad2critic/q/q1_encoding_1/q1_encoder/hidden_0/SigmoidZgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_4AddNXgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/tuple/control_dependencyOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Reshape*
N
�
Ogradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_4*
T0*
data_formatNHWC
�
Tgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_4P^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_4U^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/Mul_grad/Reshape
�
^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityOgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGradU^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*b
_classX
VTloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
Igradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMulMatMul\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Kgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMul_1MatMulconcat_5\gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Sgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/tuple/group_depsNoOpJ^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMulL^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMul_1
�
[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/tuple/control_dependencyIdentityIgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMulT^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMul
�
]gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityKgradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMul_1T^gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*^
_classT
RPloc:@gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/MatMul_1
H
gradients_1/concat_5_grad/RankConst*
value	B :*
dtype0
a
gradients_1/concat_5_grad/modFloorModconcat_5/axisgradients_1/concat_5_grad/Rank*
T0
S
gradients_1/concat_5_grad/ShapeShapenormalized_state*
T0*
out_type0
f
 gradients_1/concat_5_grad/ShapeNShapeNnormalized_stateaction*
T0*
out_type0*
N
�
&gradients_1/concat_5_grad/ConcatOffsetConcatOffsetgradients_1/concat_5_grad/mod gradients_1/concat_5_grad/ShapeN"gradients_1/concat_5_grad/ShapeN:1*
N
�
gradients_1/concat_5_grad/SliceSlice[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/tuple/control_dependency&gradients_1/concat_5_grad/ConcatOffset gradients_1/concat_5_grad/ShapeN*
T0*
Index0
�
!gradients_1/concat_5_grad/Slice_1Slice[gradients_1/critic/q/q1_encoding_1/q1_encoder/hidden_0/MatMul_grad/tuple/control_dependency(gradients_1/concat_5_grad/ConcatOffset:1"gradients_1/concat_5_grad/ShapeN:1*
T0*
Index0
x
*gradients_1/concat_5_grad/tuple/group_depsNoOp ^gradients_1/concat_5_grad/Slice"^gradients_1/concat_5_grad/Slice_1
�
2gradients_1/concat_5_grad/tuple/control_dependencyIdentitygradients_1/concat_5_grad/Slice+^gradients_1/concat_5_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_1/concat_5_grad/Slice
�
4gradients_1/concat_5_grad/tuple/control_dependency_1Identity!gradients_1/concat_5_grad/Slice_1+^gradients_1/concat_5_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_1/concat_5_grad/Slice_1
�
gradients_1/AddN_5AddN8gradients_1/policy_1/pow_1_grad/tuple/control_dependency4gradients_1/concat_5_grad/tuple/control_dependency_1*
T0*:
_class0
.,loc:@gradients_1/policy_1/pow_1_grad/Reshape*
N
_
'gradients_1/policy_1/Tanh_grad/TanhGradTanhGradpolicy_1/Tanhgradients_1/AddN_5*
T0
�
gradients_1/AddN_6AddN6gradients_1/policy_1/sub_grad/tuple/control_dependency'gradients_1/policy_1/Tanh_grad/TanhGrad*
T0*8
_class.
,*loc:@gradients_1/policy_1/sub_grad/Reshape*
N
Z
#gradients_1/policy_1/add_grad/ShapeShapepolicy_1/mu/BiasAdd*
T0*
out_type0
U
%gradients_1/policy_1/add_grad/Shape_1Shapepolicy_1/mul*
T0*
out_type0
�
3gradients_1/policy_1/add_grad/BroadcastGradientArgsBroadcastGradientArgs#gradients_1/policy_1/add_grad/Shape%gradients_1/policy_1/add_grad/Shape_1*
T0
�
!gradients_1/policy_1/add_grad/SumSumgradients_1/AddN_63gradients_1/policy_1/add_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
%gradients_1/policy_1/add_grad/ReshapeReshape!gradients_1/policy_1/add_grad/Sum#gradients_1/policy_1/add_grad/Shape*
T0*
Tshape0
�
#gradients_1/policy_1/add_grad/Sum_1Sumgradients_1/AddN_65gradients_1/policy_1/add_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/add_grad/Reshape_1Reshape#gradients_1/policy_1/add_grad/Sum_1%gradients_1/policy_1/add_grad/Shape_1*
T0*
Tshape0
�
.gradients_1/policy_1/add_grad/tuple/group_depsNoOp&^gradients_1/policy_1/add_grad/Reshape(^gradients_1/policy_1/add_grad/Reshape_1
�
6gradients_1/policy_1/add_grad/tuple/control_dependencyIdentity%gradients_1/policy_1/add_grad/Reshape/^gradients_1/policy_1/add_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/policy_1/add_grad/Reshape
�
8gradients_1/policy_1/add_grad/tuple/control_dependency_1Identity'gradients_1/policy_1/add_grad/Reshape_1/^gradients_1/policy_1/add_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/add_grad/Reshape_1
�
gradients_1/AddN_7AddN8gradients_1/policy_1/sub_grad/tuple/control_dependency_16gradients_1/policy_1/add_grad/tuple/control_dependency*
T0*:
_class0
.,loc:@gradients_1/policy_1/sub_grad/Reshape_1*
N
s
0gradients_1/policy_1/mu/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_7*
T0*
data_formatNHWC
�
5gradients_1/policy_1/mu/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_71^gradients_1/policy_1/mu/BiasAdd_grad/BiasAddGrad
�
=gradients_1/policy_1/mu/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_76^gradients_1/policy_1/mu/BiasAdd_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/sub_grad/Reshape_1
�
?gradients_1/policy_1/mu/BiasAdd_grad/tuple/control_dependency_1Identity0gradients_1/policy_1/mu/BiasAdd_grad/BiasAddGrad6^gradients_1/policy_1/mu/BiasAdd_grad/tuple/group_deps*
T0*C
_class9
75loc:@gradients_1/policy_1/mu/BiasAdd_grad/BiasAddGrad
S
#gradients_1/policy_1/mul_grad/ShapeShapepolicy_1/Exp*
T0*
out_type0
_
%gradients_1/policy_1/mul_grad/Shape_1Shapepolicy_1/random_normal*
T0*
out_type0
�
3gradients_1/policy_1/mul_grad/BroadcastGradientArgsBroadcastGradientArgs#gradients_1/policy_1/mul_grad/Shape%gradients_1/policy_1/mul_grad/Shape_1*
T0
�
!gradients_1/policy_1/mul_grad/MulMul8gradients_1/policy_1/add_grad/tuple/control_dependency_1policy_1/random_normal*
T0
�
!gradients_1/policy_1/mul_grad/SumSum!gradients_1/policy_1/mul_grad/Mul3gradients_1/policy_1/mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
%gradients_1/policy_1/mul_grad/ReshapeReshape!gradients_1/policy_1/mul_grad/Sum#gradients_1/policy_1/mul_grad/Shape*
T0*
Tshape0
{
#gradients_1/policy_1/mul_grad/Mul_1Mulpolicy_1/Exp8gradients_1/policy_1/add_grad/tuple/control_dependency_1*
T0
�
#gradients_1/policy_1/mul_grad/Sum_1Sum#gradients_1/policy_1/mul_grad/Mul_15gradients_1/policy_1/mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
'gradients_1/policy_1/mul_grad/Reshape_1Reshape#gradients_1/policy_1/mul_grad/Sum_1%gradients_1/policy_1/mul_grad/Shape_1*
T0*
Tshape0
�
.gradients_1/policy_1/mul_grad/tuple/group_depsNoOp&^gradients_1/policy_1/mul_grad/Reshape(^gradients_1/policy_1/mul_grad/Reshape_1
�
6gradients_1/policy_1/mul_grad/tuple/control_dependencyIdentity%gradients_1/policy_1/mul_grad/Reshape/^gradients_1/policy_1/mul_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_1/policy_1/mul_grad/Reshape
�
8gradients_1/policy_1/mul_grad/tuple/control_dependency_1Identity'gradients_1/policy_1/mul_grad/Reshape_1/^gradients_1/policy_1/mul_grad/tuple/group_deps*
T0*:
_class0
.,loc:@gradients_1/policy_1/mul_grad/Reshape_1
�
*gradients_1/policy_1/mu/MatMul_grad/MatMulMatMul=gradients_1/policy_1/mu/BiasAdd_grad/tuple/control_dependencypolicy/mu/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
,gradients_1/policy_1/mu/MatMul_grad/MatMul_1MatMul policy/main_graph_0/hidden_3/Mul=gradients_1/policy_1/mu/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
4gradients_1/policy_1/mu/MatMul_grad/tuple/group_depsNoOp+^gradients_1/policy_1/mu/MatMul_grad/MatMul-^gradients_1/policy_1/mu/MatMul_grad/MatMul_1
�
<gradients_1/policy_1/mu/MatMul_grad/tuple/control_dependencyIdentity*gradients_1/policy_1/mu/MatMul_grad/MatMul5^gradients_1/policy_1/mu/MatMul_grad/tuple/group_deps*
T0*=
_class3
1/loc:@gradients_1/policy_1/mu/MatMul_grad/MatMul
�
>gradients_1/policy_1/mu/MatMul_grad/tuple/control_dependency_1Identity,gradients_1/policy_1/mu/MatMul_grad/MatMul_15^gradients_1/policy_1/mu/MatMul_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_1/policy_1/mu/MatMul_grad/MatMul_1
�
gradients_1/AddN_8AddN8gradients_1/policy_1/add_1_grad/tuple/control_dependency6gradients_1/policy_1/mul_grad/tuple/control_dependency*
T0*:
_class0
.,loc:@gradients_1/policy_1/add_1_grad/Reshape*
N
S
!gradients_1/policy_1/Exp_grad/mulMulgradients_1/AddN_8policy_1/Exp*
T0
�
gradients_1/AddN_9AddN:gradients_1/policy_1/mul_1_grad/tuple/control_dependency_1!gradients_1/policy_1/Exp_grad/mul*
T0*<
_class2
0.loc:@gradients_1/policy_1/mul_1_grad/Reshape_1*
N
o
-gradients_1/policy_1/clip_by_value_grad/ShapeShapepolicy_1/clip_by_value/Minimum*
T0*
out_type0
X
/gradients_1/policy_1/clip_by_value_grad/Shape_1Const*
valueB *
dtype0
e
/gradients_1/policy_1/clip_by_value_grad/Shape_2Shapegradients_1/AddN_9*
T0*
out_type0
`
3gradients_1/policy_1/clip_by_value_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
-gradients_1/policy_1/clip_by_value_grad/zerosFill/gradients_1/policy_1/clip_by_value_grad/Shape_23gradients_1/policy_1/clip_by_value_grad/zeros/Const*
T0*

index_type0
�
4gradients_1/policy_1/clip_by_value_grad/GreaterEqualGreaterEqualpolicy_1/clip_by_value/Minimumpolicy_1/clip_by_value/y*
T0
�
=gradients_1/policy_1/clip_by_value_grad/BroadcastGradientArgsBroadcastGradientArgs-gradients_1/policy_1/clip_by_value_grad/Shape/gradients_1/policy_1/clip_by_value_grad/Shape_1*
T0
�
0gradients_1/policy_1/clip_by_value_grad/SelectV2SelectV24gradients_1/policy_1/clip_by_value_grad/GreaterEqualgradients_1/AddN_9-gradients_1/policy_1/clip_by_value_grad/zeros*
T0
�
+gradients_1/policy_1/clip_by_value_grad/SumSum0gradients_1/policy_1/clip_by_value_grad/SelectV2=gradients_1/policy_1/clip_by_value_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
/gradients_1/policy_1/clip_by_value_grad/ReshapeReshape+gradients_1/policy_1/clip_by_value_grad/Sum-gradients_1/policy_1/clip_by_value_grad/Shape*
T0*
Tshape0
�
2gradients_1/policy_1/clip_by_value_grad/SelectV2_1SelectV24gradients_1/policy_1/clip_by_value_grad/GreaterEqual-gradients_1/policy_1/clip_by_value_grad/zerosgradients_1/AddN_9*
T0
�
-gradients_1/policy_1/clip_by_value_grad/Sum_1Sum2gradients_1/policy_1/clip_by_value_grad/SelectV2_1?gradients_1/policy_1/clip_by_value_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
1gradients_1/policy_1/clip_by_value_grad/Reshape_1Reshape-gradients_1/policy_1/clip_by_value_grad/Sum_1/gradients_1/policy_1/clip_by_value_grad/Shape_1*
T0*
Tshape0
�
8gradients_1/policy_1/clip_by_value_grad/tuple/group_depsNoOp0^gradients_1/policy_1/clip_by_value_grad/Reshape2^gradients_1/policy_1/clip_by_value_grad/Reshape_1
�
@gradients_1/policy_1/clip_by_value_grad/tuple/control_dependencyIdentity/gradients_1/policy_1/clip_by_value_grad/Reshape9^gradients_1/policy_1/clip_by_value_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients_1/policy_1/clip_by_value_grad/Reshape
�
Bgradients_1/policy_1/clip_by_value_grad/tuple/control_dependency_1Identity1gradients_1/policy_1/clip_by_value_grad/Reshape_19^gradients_1/policy_1/clip_by_value_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/policy_1/clip_by_value_grad/Reshape_1
q
5gradients_1/policy_1/clip_by_value/Minimum_grad/ShapeShapepolicy_1/log_std/BiasAdd*
T0*
out_type0
`
7gradients_1/policy_1/clip_by_value/Minimum_grad/Shape_1Const*
valueB *
dtype0
�
7gradients_1/policy_1/clip_by_value/Minimum_grad/Shape_2Shape@gradients_1/policy_1/clip_by_value_grad/tuple/control_dependency*
T0*
out_type0
h
;gradients_1/policy_1/clip_by_value/Minimum_grad/zeros/ConstConst*
valueB
 *    *
dtype0
�
5gradients_1/policy_1/clip_by_value/Minimum_grad/zerosFill7gradients_1/policy_1/clip_by_value/Minimum_grad/Shape_2;gradients_1/policy_1/clip_by_value/Minimum_grad/zeros/Const*
T0*

index_type0
�
9gradients_1/policy_1/clip_by_value/Minimum_grad/LessEqual	LessEqualpolicy_1/log_std/BiasAdd policy_1/clip_by_value/Minimum/y*
T0
�
Egradients_1/policy_1/clip_by_value/Minimum_grad/BroadcastGradientArgsBroadcastGradientArgs5gradients_1/policy_1/clip_by_value/Minimum_grad/Shape7gradients_1/policy_1/clip_by_value/Minimum_grad/Shape_1*
T0
�
8gradients_1/policy_1/clip_by_value/Minimum_grad/SelectV2SelectV29gradients_1/policy_1/clip_by_value/Minimum_grad/LessEqual@gradients_1/policy_1/clip_by_value_grad/tuple/control_dependency5gradients_1/policy_1/clip_by_value/Minimum_grad/zeros*
T0
�
3gradients_1/policy_1/clip_by_value/Minimum_grad/SumSum8gradients_1/policy_1/clip_by_value/Minimum_grad/SelectV2Egradients_1/policy_1/clip_by_value/Minimum_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
7gradients_1/policy_1/clip_by_value/Minimum_grad/ReshapeReshape3gradients_1/policy_1/clip_by_value/Minimum_grad/Sum5gradients_1/policy_1/clip_by_value/Minimum_grad/Shape*
T0*
Tshape0
�
:gradients_1/policy_1/clip_by_value/Minimum_grad/SelectV2_1SelectV29gradients_1/policy_1/clip_by_value/Minimum_grad/LessEqual5gradients_1/policy_1/clip_by_value/Minimum_grad/zeros@gradients_1/policy_1/clip_by_value_grad/tuple/control_dependency*
T0
�
5gradients_1/policy_1/clip_by_value/Minimum_grad/Sum_1Sum:gradients_1/policy_1/clip_by_value/Minimum_grad/SelectV2_1Ggradients_1/policy_1/clip_by_value/Minimum_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
9gradients_1/policy_1/clip_by_value/Minimum_grad/Reshape_1Reshape5gradients_1/policy_1/clip_by_value/Minimum_grad/Sum_17gradients_1/policy_1/clip_by_value/Minimum_grad/Shape_1*
T0*
Tshape0
�
@gradients_1/policy_1/clip_by_value/Minimum_grad/tuple/group_depsNoOp8^gradients_1/policy_1/clip_by_value/Minimum_grad/Reshape:^gradients_1/policy_1/clip_by_value/Minimum_grad/Reshape_1
�
Hgradients_1/policy_1/clip_by_value/Minimum_grad/tuple/control_dependencyIdentity7gradients_1/policy_1/clip_by_value/Minimum_grad/ReshapeA^gradients_1/policy_1/clip_by_value/Minimum_grad/tuple/group_deps*
T0*J
_class@
><loc:@gradients_1/policy_1/clip_by_value/Minimum_grad/Reshape
�
Jgradients_1/policy_1/clip_by_value/Minimum_grad/tuple/control_dependency_1Identity9gradients_1/policy_1/clip_by_value/Minimum_grad/Reshape_1A^gradients_1/policy_1/clip_by_value/Minimum_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy_1/clip_by_value/Minimum_grad/Reshape_1
�
5gradients_1/policy_1/log_std/BiasAdd_grad/BiasAddGradBiasAddGradHgradients_1/policy_1/clip_by_value/Minimum_grad/tuple/control_dependency*
T0*
data_formatNHWC
�
:gradients_1/policy_1/log_std/BiasAdd_grad/tuple/group_depsNoOpI^gradients_1/policy_1/clip_by_value/Minimum_grad/tuple/control_dependency6^gradients_1/policy_1/log_std/BiasAdd_grad/BiasAddGrad
�
Bgradients_1/policy_1/log_std/BiasAdd_grad/tuple/control_dependencyIdentityHgradients_1/policy_1/clip_by_value/Minimum_grad/tuple/control_dependency;^gradients_1/policy_1/log_std/BiasAdd_grad/tuple/group_deps*
T0*J
_class@
><loc:@gradients_1/policy_1/clip_by_value/Minimum_grad/Reshape
�
Dgradients_1/policy_1/log_std/BiasAdd_grad/tuple/control_dependency_1Identity5gradients_1/policy_1/log_std/BiasAdd_grad/BiasAddGrad;^gradients_1/policy_1/log_std/BiasAdd_grad/tuple/group_deps*
T0*H
_class>
<:loc:@gradients_1/policy_1/log_std/BiasAdd_grad/BiasAddGrad
�
/gradients_1/policy_1/log_std/MatMul_grad/MatMulMatMulBgradients_1/policy_1/log_std/BiasAdd_grad/tuple/control_dependencypolicy/log_std/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
1gradients_1/policy_1/log_std/MatMul_grad/MatMul_1MatMul policy/main_graph_0/hidden_3/MulBgradients_1/policy_1/log_std/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
9gradients_1/policy_1/log_std/MatMul_grad/tuple/group_depsNoOp0^gradients_1/policy_1/log_std/MatMul_grad/MatMul2^gradients_1/policy_1/log_std/MatMul_grad/MatMul_1
�
Agradients_1/policy_1/log_std/MatMul_grad/tuple/control_dependencyIdentity/gradients_1/policy_1/log_std/MatMul_grad/MatMul:^gradients_1/policy_1/log_std/MatMul_grad/tuple/group_deps*
T0*B
_class8
64loc:@gradients_1/policy_1/log_std/MatMul_grad/MatMul
�
Cgradients_1/policy_1/log_std/MatMul_grad/tuple/control_dependency_1Identity1gradients_1/policy_1/log_std/MatMul_grad/MatMul_1:^gradients_1/policy_1/log_std/MatMul_grad/tuple/group_deps*
T0*D
_class:
86loc:@gradients_1/policy_1/log_std/MatMul_grad/MatMul_1
�
gradients_1/AddN_10AddN<gradients_1/policy_1/mu/MatMul_grad/tuple/control_dependencyAgradients_1/policy_1/log_std/MatMul_grad/tuple/control_dependency*
T0*=
_class3
1/loc:@gradients_1/policy_1/mu/MatMul_grad/MatMul*
N

7gradients_1/policy/main_graph_0/hidden_3/Mul_grad/ShapeShape$policy/main_graph_0/hidden_3/BiasAdd*
T0*
out_type0
�
9gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Shape_1Shape$policy/main_graph_0/hidden_3/Sigmoid*
T0*
out_type0
�
Ggradients_1/policy/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs7gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Shape9gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0
�
5gradients_1/policy/main_graph_0/hidden_3/Mul_grad/MulMulgradients_1/AddN_10$policy/main_graph_0/hidden_3/Sigmoid*
T0
�
5gradients_1/policy/main_graph_0/hidden_3/Mul_grad/SumSum5gradients_1/policy/main_graph_0/hidden_3/Mul_grad/MulGgradients_1/policy/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
9gradients_1/policy/main_graph_0/hidden_3/Mul_grad/ReshapeReshape5gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Sum7gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Shape*
T0*
Tshape0
�
7gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Mul_1Mul$policy/main_graph_0/hidden_3/BiasAddgradients_1/AddN_10*
T0
�
7gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Sum_1Sum7gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Mul_1Igradients_1/policy/main_graph_0/hidden_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
;gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape_1Reshape7gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Sum_19gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
�
Bgradients_1/policy/main_graph_0/hidden_3/Mul_grad/tuple/group_depsNoOp:^gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape<^gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape_1
�
Jgradients_1/policy/main_graph_0/hidden_3/Mul_grad/tuple/control_dependencyIdentity9gradients_1/policy/main_graph_0/hidden_3/Mul_grad/ReshapeC^gradients_1/policy/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape
�
Lgradients_1/policy/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1Identity;gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape_1C^gradients_1/policy/main_graph_0/hidden_3/Mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape_1
�
Agradients_1/policy/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGrad$policy/main_graph_0/hidden_3/SigmoidLgradients_1/policy/main_graph_0/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_11AddNJgradients_1/policy/main_graph_0/hidden_3/Mul_grad/tuple/control_dependencyAgradients_1/policy/main_graph_0/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape*
N
�
Agradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_11*
T0*
data_formatNHWC
�
Fgradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_11B^gradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
�
Ngradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_11G^gradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_3/Mul_grad/Reshape
�
Pgradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency_1IdentityAgradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGradG^gradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/BiasAddGrad
�
;gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMulMatMulNgradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency(policy/main_graph_0/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
=gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMul_1MatMul policy/main_graph_0/hidden_2/MulNgradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Egradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/group_depsNoOp<^gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMul>^gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMul_1
�
Mgradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependencyIdentity;gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMulF^gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMul
�
Ogradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency_1Identity=gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMul_1F^gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/policy/main_graph_0/hidden_3/MatMul_grad/MatMul_1

7gradients_1/policy/main_graph_0/hidden_2/Mul_grad/ShapeShape$policy/main_graph_0/hidden_2/BiasAdd*
T0*
out_type0
�
9gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Shape_1Shape$policy/main_graph_0/hidden_2/Sigmoid*
T0*
out_type0
�
Ggradients_1/policy/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs7gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Shape9gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0
�
5gradients_1/policy/main_graph_0/hidden_2/Mul_grad/MulMulMgradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency$policy/main_graph_0/hidden_2/Sigmoid*
T0
�
5gradients_1/policy/main_graph_0/hidden_2/Mul_grad/SumSum5gradients_1/policy/main_graph_0/hidden_2/Mul_grad/MulGgradients_1/policy/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
9gradients_1/policy/main_graph_0/hidden_2/Mul_grad/ReshapeReshape5gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Sum7gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Shape*
T0*
Tshape0
�
7gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Mul_1Mul$policy/main_graph_0/hidden_2/BiasAddMgradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency*
T0
�
7gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Sum_1Sum7gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Mul_1Igradients_1/policy/main_graph_0/hidden_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
;gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape_1Reshape7gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Sum_19gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
�
Bgradients_1/policy/main_graph_0/hidden_2/Mul_grad/tuple/group_depsNoOp:^gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape<^gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape_1
�
Jgradients_1/policy/main_graph_0/hidden_2/Mul_grad/tuple/control_dependencyIdentity9gradients_1/policy/main_graph_0/hidden_2/Mul_grad/ReshapeC^gradients_1/policy/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape
�
Lgradients_1/policy/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1Identity;gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape_1C^gradients_1/policy/main_graph_0/hidden_2/Mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape_1
�
Agradients_1/policy/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGrad$policy/main_graph_0/hidden_2/SigmoidLgradients_1/policy/main_graph_0/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_12AddNJgradients_1/policy/main_graph_0/hidden_2/Mul_grad/tuple/control_dependencyAgradients_1/policy/main_graph_0/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape*
N
�
Agradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_12*
T0*
data_formatNHWC
�
Fgradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_12B^gradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
�
Ngradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_12G^gradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_2/Mul_grad/Reshape
�
Pgradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency_1IdentityAgradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGradG^gradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/BiasAddGrad
�
;gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMulMatMulNgradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency(policy/main_graph_0/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
=gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMul_1MatMul policy/main_graph_0/hidden_1/MulNgradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Egradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/group_depsNoOp<^gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMul>^gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMul_1
�
Mgradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependencyIdentity;gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMulF^gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMul
�
Ogradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency_1Identity=gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMul_1F^gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/policy/main_graph_0/hidden_2/MatMul_grad/MatMul_1

7gradients_1/policy/main_graph_0/hidden_1/Mul_grad/ShapeShape$policy/main_graph_0/hidden_1/BiasAdd*
T0*
out_type0
�
9gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Shape_1Shape$policy/main_graph_0/hidden_1/Sigmoid*
T0*
out_type0
�
Ggradients_1/policy/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs7gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Shape9gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0
�
5gradients_1/policy/main_graph_0/hidden_1/Mul_grad/MulMulMgradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency$policy/main_graph_0/hidden_1/Sigmoid*
T0
�
5gradients_1/policy/main_graph_0/hidden_1/Mul_grad/SumSum5gradients_1/policy/main_graph_0/hidden_1/Mul_grad/MulGgradients_1/policy/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
9gradients_1/policy/main_graph_0/hidden_1/Mul_grad/ReshapeReshape5gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Sum7gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
7gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Mul_1Mul$policy/main_graph_0/hidden_1/BiasAddMgradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency*
T0
�
7gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Sum_1Sum7gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Mul_1Igradients_1/policy/main_graph_0/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
;gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape_1Reshape7gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Sum_19gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Bgradients_1/policy/main_graph_0/hidden_1/Mul_grad/tuple/group_depsNoOp:^gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape<^gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape_1
�
Jgradients_1/policy/main_graph_0/hidden_1/Mul_grad/tuple/control_dependencyIdentity9gradients_1/policy/main_graph_0/hidden_1/Mul_grad/ReshapeC^gradients_1/policy/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape
�
Lgradients_1/policy/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1Identity;gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape_1C^gradients_1/policy/main_graph_0/hidden_1/Mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape_1
�
Agradients_1/policy/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad$policy/main_graph_0/hidden_1/SigmoidLgradients_1/policy/main_graph_0/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_13AddNJgradients_1/policy/main_graph_0/hidden_1/Mul_grad/tuple/control_dependencyAgradients_1/policy/main_graph_0/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape*
N
�
Agradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_13*
T0*
data_formatNHWC
�
Fgradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_13B^gradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
�
Ngradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_13G^gradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_1/Mul_grad/Reshape
�
Pgradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityAgradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGradG^gradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/BiasAddGrad
�
;gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMulMatMulNgradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency(policy/main_graph_0/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
=gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMul_1MatMul policy/main_graph_0/hidden_0/MulNgradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Egradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/group_depsNoOp<^gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMul>^gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMul_1
�
Mgradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependencyIdentity;gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMulF^gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMul
�
Ogradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1Identity=gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMul_1F^gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/policy/main_graph_0/hidden_1/MatMul_grad/MatMul_1

7gradients_1/policy/main_graph_0/hidden_0/Mul_grad/ShapeShape$policy/main_graph_0/hidden_0/BiasAdd*
T0*
out_type0
�
9gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Shape_1Shape$policy/main_graph_0/hidden_0/Sigmoid*
T0*
out_type0
�
Ggradients_1/policy/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs7gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Shape9gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0
�
5gradients_1/policy/main_graph_0/hidden_0/Mul_grad/MulMulMgradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency$policy/main_graph_0/hidden_0/Sigmoid*
T0
�
5gradients_1/policy/main_graph_0/hidden_0/Mul_grad/SumSum5gradients_1/policy/main_graph_0/hidden_0/Mul_grad/MulGgradients_1/policy/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
9gradients_1/policy/main_graph_0/hidden_0/Mul_grad/ReshapeReshape5gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Sum7gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
7gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Mul_1Mul$policy/main_graph_0/hidden_0/BiasAddMgradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
7gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Sum_1Sum7gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Mul_1Igradients_1/policy/main_graph_0/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
;gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape_1Reshape7gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Sum_19gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Bgradients_1/policy/main_graph_0/hidden_0/Mul_grad/tuple/group_depsNoOp:^gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape<^gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape_1
�
Jgradients_1/policy/main_graph_0/hidden_0/Mul_grad/tuple/control_dependencyIdentity9gradients_1/policy/main_graph_0/hidden_0/Mul_grad/ReshapeC^gradients_1/policy/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape
�
Lgradients_1/policy/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1Identity;gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape_1C^gradients_1/policy/main_graph_0/hidden_0/Mul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape_1
�
Agradients_1/policy/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad$policy/main_graph_0/hidden_0/SigmoidLgradients_1/policy/main_graph_0/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_1/AddN_14AddNJgradients_1/policy/main_graph_0/hidden_0/Mul_grad/tuple/control_dependencyAgradients_1/policy/main_graph_0/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape*
N
�
Agradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_1/AddN_14*
T0*
data_formatNHWC
�
Fgradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_1/AddN_14B^gradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
�
Ngradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_1/AddN_14G^gradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients_1/policy/main_graph_0/hidden_0/Mul_grad/Reshape
�
Pgradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityAgradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGradG^gradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/BiasAddGrad
�
;gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMulMatMulNgradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency(policy/main_graph_0/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
=gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMul_1MatMulnormalized_stateNgradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Egradients_1/policy/main_graph_0/hidden_0/MatMul_grad/tuple/group_depsNoOp<^gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMul>^gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMul_1
�
Mgradients_1/policy/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependencyIdentity;gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMulF^gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMul
�
Ogradients_1/policy/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1Identity=gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMul_1F^gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_1/policy/main_graph_0/hidden_0/MatMul_grad/MatMul_1
p
beta1_power_1/initial_valueConst*&
_class
loc:@policy/log_std/bias*
valueB
 *fff?*
dtype0
�
beta1_power_1
VariableV2*
shape: *
shared_name *&
_class
loc:@policy/log_std/bias*
dtype0*
	container 
�
beta1_power_1/AssignAssignbeta1_power_1beta1_power_1/initial_value*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
^
beta1_power_1/readIdentitybeta1_power_1*
T0*&
_class
loc:@policy/log_std/bias
p
beta2_power_1/initial_valueConst*&
_class
loc:@policy/log_std/bias*
valueB
 *w�?*
dtype0
�
beta2_power_1
VariableV2*
shape: *
shared_name *&
_class
loc:@policy/log_std/bias*
dtype0*
	container 
�
beta2_power_1/AssignAssignbeta2_power_1beta2_power_1/initial_value*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
^
beta2_power_1/readIdentitybeta2_power_1*
T0*&
_class
loc:@policy/log_std/bias
�
Tpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorConst*
valueB"N      *6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0
�
Jpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0
�
Dpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt/Initializer/zerosFillTpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorJpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel
�
2policy/main_graph_0/hidden_0/kernel/sac_policy_opt
VariableV2*
shape:	N�*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0*
	container 
�
9policy/main_graph_0/hidden_0/kernel/sac_policy_opt/AssignAssign2policy/main_graph_0/hidden_0/kernel/sac_policy_optDpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
validate_shape(
�
7policy/main_graph_0/hidden_0/kernel/sac_policy_opt/readIdentity2policy/main_graph_0/hidden_0/kernel/sac_policy_opt*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel
�
Vpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"N      *6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0
�
Lpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0
�
Fpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/Initializer/zerosFillVpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorLpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel
�
4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1
VariableV2*
shape:	N�*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
dtype0*
	container 
�
;policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/AssignAssign4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1Fpolicy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
validate_shape(
�
9policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/readIdentity4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel
�
Bpolicy/main_graph_0/hidden_0/bias/sac_policy_opt/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
dtype0
�
0policy/main_graph_0/hidden_0/bias/sac_policy_opt
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
dtype0*
	container 
�
7policy/main_graph_0/hidden_0/bias/sac_policy_opt/AssignAssign0policy/main_graph_0/hidden_0/bias/sac_policy_optBpolicy/main_graph_0/hidden_0/bias/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
validate_shape(
�
5policy/main_graph_0/hidden_0/bias/sac_policy_opt/readIdentity0policy/main_graph_0/hidden_0/bias/sac_policy_opt*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias
�
Dpolicy/main_graph_0/hidden_0/bias/sac_policy_opt_1/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
dtype0
�
2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
dtype0*
	container 
�
9policy/main_graph_0/hidden_0/bias/sac_policy_opt_1/AssignAssign2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1Dpolicy/main_graph_0/hidden_0/bias/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
validate_shape(
�
7policy/main_graph_0/hidden_0/bias/sac_policy_opt_1/readIdentity2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias
�
Tpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0
�
Jpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0
�
Dpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt/Initializer/zerosFillTpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorJpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel
�
2policy/main_graph_0/hidden_1/kernel/sac_policy_opt
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0*
	container 
�
9policy/main_graph_0/hidden_1/kernel/sac_policy_opt/AssignAssign2policy/main_graph_0/hidden_1/kernel/sac_policy_optDpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
validate_shape(
�
7policy/main_graph_0/hidden_1/kernel/sac_policy_opt/readIdentity2policy/main_graph_0/hidden_1/kernel/sac_policy_opt*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel
�
Vpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0
�
Lpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0
�
Fpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/Initializer/zerosFillVpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorLpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel
�
4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
dtype0*
	container 
�
;policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/AssignAssign4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1Fpolicy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
validate_shape(
�
9policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/readIdentity4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel
�
Bpolicy/main_graph_0/hidden_1/bias/sac_policy_opt/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
dtype0
�
0policy/main_graph_0/hidden_1/bias/sac_policy_opt
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
dtype0*
	container 
�
7policy/main_graph_0/hidden_1/bias/sac_policy_opt/AssignAssign0policy/main_graph_0/hidden_1/bias/sac_policy_optBpolicy/main_graph_0/hidden_1/bias/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
validate_shape(
�
5policy/main_graph_0/hidden_1/bias/sac_policy_opt/readIdentity0policy/main_graph_0/hidden_1/bias/sac_policy_opt*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias
�
Dpolicy/main_graph_0/hidden_1/bias/sac_policy_opt_1/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
dtype0
�
2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
dtype0*
	container 
�
9policy/main_graph_0/hidden_1/bias/sac_policy_opt_1/AssignAssign2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1Dpolicy/main_graph_0/hidden_1/bias/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
validate_shape(
�
7policy/main_graph_0/hidden_1/bias/sac_policy_opt_1/readIdentity2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias
�
Tpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0
�
Jpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0
�
Dpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt/Initializer/zerosFillTpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorJpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel
�
2policy/main_graph_0/hidden_2/kernel/sac_policy_opt
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0*
	container 
�
9policy/main_graph_0/hidden_2/kernel/sac_policy_opt/AssignAssign2policy/main_graph_0/hidden_2/kernel/sac_policy_optDpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
validate_shape(
�
7policy/main_graph_0/hidden_2/kernel/sac_policy_opt/readIdentity2policy/main_graph_0/hidden_2/kernel/sac_policy_opt*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel
�
Vpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0
�
Lpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0
�
Fpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/Initializer/zerosFillVpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorLpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel
�
4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
dtype0*
	container 
�
;policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/AssignAssign4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1Fpolicy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
validate_shape(
�
9policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/readIdentity4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel
�
Bpolicy/main_graph_0/hidden_2/bias/sac_policy_opt/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
dtype0
�
0policy/main_graph_0/hidden_2/bias/sac_policy_opt
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
dtype0*
	container 
�
7policy/main_graph_0/hidden_2/bias/sac_policy_opt/AssignAssign0policy/main_graph_0/hidden_2/bias/sac_policy_optBpolicy/main_graph_0/hidden_2/bias/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
validate_shape(
�
5policy/main_graph_0/hidden_2/bias/sac_policy_opt/readIdentity0policy/main_graph_0/hidden_2/bias/sac_policy_opt*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias
�
Dpolicy/main_graph_0/hidden_2/bias/sac_policy_opt_1/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
dtype0
�
2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
dtype0*
	container 
�
9policy/main_graph_0/hidden_2/bias/sac_policy_opt_1/AssignAssign2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1Dpolicy/main_graph_0/hidden_2/bias/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
validate_shape(
�
7policy/main_graph_0/hidden_2/bias/sac_policy_opt_1/readIdentity2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias
�
Tpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0
�
Jpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0
�
Dpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt/Initializer/zerosFillTpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorJpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel
�
2policy/main_graph_0/hidden_3/kernel/sac_policy_opt
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0*
	container 
�
9policy/main_graph_0/hidden_3/kernel/sac_policy_opt/AssignAssign2policy/main_graph_0/hidden_3/kernel/sac_policy_optDpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
validate_shape(
�
7policy/main_graph_0/hidden_3/kernel/sac_policy_opt/readIdentity2policy/main_graph_0/hidden_3/kernel/sac_policy_opt*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel
�
Vpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0
�
Lpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0
�
Fpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/Initializer/zerosFillVpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorLpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/Initializer/zeros/Const*
T0*

index_type0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel
�
4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1
VariableV2*
shape:
��*
shared_name *6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
dtype0*
	container 
�
;policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/AssignAssign4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1Fpolicy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
validate_shape(
�
9policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/readIdentity4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel
�
Bpolicy/main_graph_0/hidden_3/bias/sac_policy_opt/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
dtype0
�
0policy/main_graph_0/hidden_3/bias/sac_policy_opt
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
dtype0*
	container 
�
7policy/main_graph_0/hidden_3/bias/sac_policy_opt/AssignAssign0policy/main_graph_0/hidden_3/bias/sac_policy_optBpolicy/main_graph_0/hidden_3/bias/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
validate_shape(
�
5policy/main_graph_0/hidden_3/bias/sac_policy_opt/readIdentity0policy/main_graph_0/hidden_3/bias/sac_policy_opt*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias
�
Dpolicy/main_graph_0/hidden_3/bias/sac_policy_opt_1/Initializer/zerosConst*
valueB�*    *4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
dtype0
�
2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1
VariableV2*
shape:�*
shared_name *4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
dtype0*
	container 
�
9policy/main_graph_0/hidden_3/bias/sac_policy_opt_1/AssignAssign2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1Dpolicy/main_graph_0/hidden_3/bias/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
validate_shape(
�
7policy/main_graph_0/hidden_3/bias/sac_policy_opt_1/readIdentity2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias
�
Apolicy/mu/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorConst*
valueB"   
   *#
_class
loc:@policy/mu/kernel*
dtype0
�
7policy/mu/kernel/sac_policy_opt/Initializer/zeros/ConstConst*
valueB
 *    *#
_class
loc:@policy/mu/kernel*
dtype0
�
1policy/mu/kernel/sac_policy_opt/Initializer/zerosFillApolicy/mu/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensor7policy/mu/kernel/sac_policy_opt/Initializer/zeros/Const*
T0*

index_type0*#
_class
loc:@policy/mu/kernel
�
policy/mu/kernel/sac_policy_opt
VariableV2*
shape:	�
*
shared_name *#
_class
loc:@policy/mu/kernel*
dtype0*
	container 
�
&policy/mu/kernel/sac_policy_opt/AssignAssignpolicy/mu/kernel/sac_policy_opt1policy/mu/kernel/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*#
_class
loc:@policy/mu/kernel*
validate_shape(

$policy/mu/kernel/sac_policy_opt/readIdentitypolicy/mu/kernel/sac_policy_opt*
T0*#
_class
loc:@policy/mu/kernel
�
Cpolicy/mu/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"   
   *#
_class
loc:@policy/mu/kernel*
dtype0
�
9policy/mu/kernel/sac_policy_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *#
_class
loc:@policy/mu/kernel*
dtype0
�
3policy/mu/kernel/sac_policy_opt_1/Initializer/zerosFillCpolicy/mu/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensor9policy/mu/kernel/sac_policy_opt_1/Initializer/zeros/Const*
T0*

index_type0*#
_class
loc:@policy/mu/kernel
�
!policy/mu/kernel/sac_policy_opt_1
VariableV2*
shape:	�
*
shared_name *#
_class
loc:@policy/mu/kernel*
dtype0*
	container 
�
(policy/mu/kernel/sac_policy_opt_1/AssignAssign!policy/mu/kernel/sac_policy_opt_13policy/mu/kernel/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*#
_class
loc:@policy/mu/kernel*
validate_shape(
�
&policy/mu/kernel/sac_policy_opt_1/readIdentity!policy/mu/kernel/sac_policy_opt_1*
T0*#
_class
loc:@policy/mu/kernel
�
/policy/mu/bias/sac_policy_opt/Initializer/zerosConst*
valueB
*    *!
_class
loc:@policy/mu/bias*
dtype0
�
policy/mu/bias/sac_policy_opt
VariableV2*
shape:
*
shared_name *!
_class
loc:@policy/mu/bias*
dtype0*
	container 
�
$policy/mu/bias/sac_policy_opt/AssignAssignpolicy/mu/bias/sac_policy_opt/policy/mu/bias/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@policy/mu/bias*
validate_shape(
y
"policy/mu/bias/sac_policy_opt/readIdentitypolicy/mu/bias/sac_policy_opt*
T0*!
_class
loc:@policy/mu/bias
�
1policy/mu/bias/sac_policy_opt_1/Initializer/zerosConst*
valueB
*    *!
_class
loc:@policy/mu/bias*
dtype0
�
policy/mu/bias/sac_policy_opt_1
VariableV2*
shape:
*
shared_name *!
_class
loc:@policy/mu/bias*
dtype0*
	container 
�
&policy/mu/bias/sac_policy_opt_1/AssignAssignpolicy/mu/bias/sac_policy_opt_11policy/mu/bias/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*!
_class
loc:@policy/mu/bias*
validate_shape(
}
$policy/mu/bias/sac_policy_opt_1/readIdentitypolicy/mu/bias/sac_policy_opt_1*
T0*!
_class
loc:@policy/mu/bias
�
Fpolicy/log_std/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensorConst*
valueB"   
   *(
_class
loc:@policy/log_std/kernel*
dtype0
�
<policy/log_std/kernel/sac_policy_opt/Initializer/zeros/ConstConst*
valueB
 *    *(
_class
loc:@policy/log_std/kernel*
dtype0
�
6policy/log_std/kernel/sac_policy_opt/Initializer/zerosFillFpolicy/log_std/kernel/sac_policy_opt/Initializer/zeros/shape_as_tensor<policy/log_std/kernel/sac_policy_opt/Initializer/zeros/Const*
T0*

index_type0*(
_class
loc:@policy/log_std/kernel
�
$policy/log_std/kernel/sac_policy_opt
VariableV2*
shape:	�
*
shared_name *(
_class
loc:@policy/log_std/kernel*
dtype0*
	container 
�
+policy/log_std/kernel/sac_policy_opt/AssignAssign$policy/log_std/kernel/sac_policy_opt6policy/log_std/kernel/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*(
_class
loc:@policy/log_std/kernel*
validate_shape(
�
)policy/log_std/kernel/sac_policy_opt/readIdentity$policy/log_std/kernel/sac_policy_opt*
T0*(
_class
loc:@policy/log_std/kernel
�
Hpolicy/log_std/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"   
   *(
_class
loc:@policy/log_std/kernel*
dtype0
�
>policy/log_std/kernel/sac_policy_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *(
_class
loc:@policy/log_std/kernel*
dtype0
�
8policy/log_std/kernel/sac_policy_opt_1/Initializer/zerosFillHpolicy/log_std/kernel/sac_policy_opt_1/Initializer/zeros/shape_as_tensor>policy/log_std/kernel/sac_policy_opt_1/Initializer/zeros/Const*
T0*

index_type0*(
_class
loc:@policy/log_std/kernel
�
&policy/log_std/kernel/sac_policy_opt_1
VariableV2*
shape:	�
*
shared_name *(
_class
loc:@policy/log_std/kernel*
dtype0*
	container 
�
-policy/log_std/kernel/sac_policy_opt_1/AssignAssign&policy/log_std/kernel/sac_policy_opt_18policy/log_std/kernel/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*(
_class
loc:@policy/log_std/kernel*
validate_shape(
�
+policy/log_std/kernel/sac_policy_opt_1/readIdentity&policy/log_std/kernel/sac_policy_opt_1*
T0*(
_class
loc:@policy/log_std/kernel
�
4policy/log_std/bias/sac_policy_opt/Initializer/zerosConst*
valueB
*    *&
_class
loc:@policy/log_std/bias*
dtype0
�
"policy/log_std/bias/sac_policy_opt
VariableV2*
shape:
*
shared_name *&
_class
loc:@policy/log_std/bias*
dtype0*
	container 
�
)policy/log_std/bias/sac_policy_opt/AssignAssign"policy/log_std/bias/sac_policy_opt4policy/log_std/bias/sac_policy_opt/Initializer/zeros*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
'policy/log_std/bias/sac_policy_opt/readIdentity"policy/log_std/bias/sac_policy_opt*
T0*&
_class
loc:@policy/log_std/bias
�
6policy/log_std/bias/sac_policy_opt_1/Initializer/zerosConst*
valueB
*    *&
_class
loc:@policy/log_std/bias*
dtype0
�
$policy/log_std/bias/sac_policy_opt_1
VariableV2*
shape:
*
shared_name *&
_class
loc:@policy/log_std/bias*
dtype0*
	container 
�
+policy/log_std/bias/sac_policy_opt_1/AssignAssign$policy/log_std/bias/sac_policy_opt_16policy/log_std/bias/sac_policy_opt_1/Initializer/zeros*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
)policy/log_std/bias/sac_policy_opt_1/readIdentity$policy/log_std/bias/sac_policy_opt_1*
T0*&
_class
loc:@policy/log_std/bias
A
sac_policy_opt/beta1Const*
valueB
 *fff?*
dtype0
A
sac_policy_opt/beta2Const*
valueB
 *w�?*
dtype0
C
sac_policy_opt/epsilonConst*
valueB
 *w�+2*
dtype0
�
Csac_policy_opt/update_policy/main_graph_0/hidden_0/kernel/ApplyAdam	ApplyAdam#policy/main_graph_0/hidden_0/kernel2policy/main_graph_0/hidden_0/kernel/sac_policy_opt4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonOgradients_1/policy/main_graph_0/hidden_0/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
use_nesterov( 
�
Asac_policy_opt/update_policy/main_graph_0/hidden_0/bias/ApplyAdam	ApplyAdam!policy/main_graph_0/hidden_0/bias0policy/main_graph_0/hidden_0/bias/sac_policy_opt2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonPgradients_1/policy/main_graph_0/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
use_nesterov( 
�
Csac_policy_opt/update_policy/main_graph_0/hidden_1/kernel/ApplyAdam	ApplyAdam#policy/main_graph_0/hidden_1/kernel2policy/main_graph_0/hidden_1/kernel/sac_policy_opt4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonOgradients_1/policy/main_graph_0/hidden_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
use_nesterov( 
�
Asac_policy_opt/update_policy/main_graph_0/hidden_1/bias/ApplyAdam	ApplyAdam!policy/main_graph_0/hidden_1/bias0policy/main_graph_0/hidden_1/bias/sac_policy_opt2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonPgradients_1/policy/main_graph_0/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
use_nesterov( 
�
Csac_policy_opt/update_policy/main_graph_0/hidden_2/kernel/ApplyAdam	ApplyAdam#policy/main_graph_0/hidden_2/kernel2policy/main_graph_0/hidden_2/kernel/sac_policy_opt4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonOgradients_1/policy/main_graph_0/hidden_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
use_nesterov( 
�
Asac_policy_opt/update_policy/main_graph_0/hidden_2/bias/ApplyAdam	ApplyAdam!policy/main_graph_0/hidden_2/bias0policy/main_graph_0/hidden_2/bias/sac_policy_opt2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonPgradients_1/policy/main_graph_0/hidden_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
use_nesterov( 
�
Csac_policy_opt/update_policy/main_graph_0/hidden_3/kernel/ApplyAdam	ApplyAdam#policy/main_graph_0/hidden_3/kernel2policy/main_graph_0/hidden_3/kernel/sac_policy_opt4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonOgradients_1/policy/main_graph_0/hidden_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
use_nesterov( 
�
Asac_policy_opt/update_policy/main_graph_0/hidden_3/bias/ApplyAdam	ApplyAdam!policy/main_graph_0/hidden_3/bias0policy/main_graph_0/hidden_3/bias/sac_policy_opt2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonPgradients_1/policy/main_graph_0/hidden_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
use_nesterov( 
�
0sac_policy_opt/update_policy/mu/kernel/ApplyAdam	ApplyAdampolicy/mu/kernelpolicy/mu/kernel/sac_policy_opt!policy/mu/kernel/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilon>gradients_1/policy_1/mu/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*#
_class
loc:@policy/mu/kernel*
use_nesterov( 
�
.sac_policy_opt/update_policy/mu/bias/ApplyAdam	ApplyAdampolicy/mu/biaspolicy/mu/bias/sac_policy_optpolicy/mu/bias/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilon?gradients_1/policy_1/mu/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*!
_class
loc:@policy/mu/bias*
use_nesterov( 
�
5sac_policy_opt/update_policy/log_std/kernel/ApplyAdam	ApplyAdampolicy/log_std/kernel$policy/log_std/kernel/sac_policy_opt&policy/log_std/kernel/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonCgradients_1/policy_1/log_std/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*(
_class
loc:@policy/log_std/kernel*
use_nesterov( 
�
3sac_policy_opt/update_policy/log_std/bias/ApplyAdam	ApplyAdampolicy/log_std/bias"policy/log_std/bias/sac_policy_opt$policy/log_std/bias/sac_policy_opt_1beta1_power_1/readbeta2_power_1/readVariable_2/readsac_policy_opt/beta1sac_policy_opt/beta2sac_policy_opt/epsilonDgradients_1/policy_1/log_std/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*&
_class
loc:@policy/log_std/bias*
use_nesterov( 
�
sac_policy_opt/mulMulbeta1_power_1/readsac_policy_opt/beta14^sac_policy_opt/update_policy/log_std/bias/ApplyAdam6^sac_policy_opt/update_policy/log_std/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_0/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_0/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_1/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_1/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_2/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_2/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_3/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_3/kernel/ApplyAdam/^sac_policy_opt/update_policy/mu/bias/ApplyAdam1^sac_policy_opt/update_policy/mu/kernel/ApplyAdam*
T0*&
_class
loc:@policy/log_std/bias
�
sac_policy_opt/AssignAssignbeta1_power_1sac_policy_opt/mul*
use_locking( *
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
sac_policy_opt/mul_1Mulbeta2_power_1/readsac_policy_opt/beta24^sac_policy_opt/update_policy/log_std/bias/ApplyAdam6^sac_policy_opt/update_policy/log_std/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_0/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_0/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_1/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_1/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_2/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_2/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_3/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_3/kernel/ApplyAdam/^sac_policy_opt/update_policy/mu/bias/ApplyAdam1^sac_policy_opt/update_policy/mu/kernel/ApplyAdam*
T0*&
_class
loc:@policy/log_std/bias
�
sac_policy_opt/Assign_1Assignbeta2_power_1sac_policy_opt/mul_1*
use_locking( *
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
sac_policy_optNoOp^sac_policy_opt/Assign^sac_policy_opt/Assign_14^sac_policy_opt/update_policy/log_std/bias/ApplyAdam6^sac_policy_opt/update_policy/log_std/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_0/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_0/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_1/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_1/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_2/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_2/kernel/ApplyAdamB^sac_policy_opt/update_policy/main_graph_0/hidden_3/bias/ApplyAdamD^sac_policy_opt/update_policy/main_graph_0/hidden_3/kernel/ApplyAdam/^sac_policy_opt/update_policy/mu/bias/ApplyAdam1^sac_policy_opt/update_policy/mu/kernel/ApplyAdam
K
gradients_2/ShapeConst^sac_policy_opt*
valueB *
dtype0
S
gradients_2/grad_ys_0Const^sac_policy_opt*
valueB
 *  �?*
dtype0
]
gradients_2/FillFillgradients_2/Shapegradients_2/grad_ys_0*
T0*

index_type0
T
(gradients_2/add_10_grad/tuple/group_depsNoOp^gradients_2/Fill^sac_policy_opt
�
0gradients_2/add_10_grad/tuple/control_dependencyIdentitygradients_2/Fill)^gradients_2/add_10_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_2/Fill
�
2gradients_2/add_10_grad/tuple/control_dependency_1Identitygradients_2/Fill)^gradients_2/add_10_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_2/Fill
s
'gradients_2/add_9_grad/tuple/group_depsNoOp1^gradients_2/add_10_grad/tuple/control_dependency^sac_policy_opt
�
/gradients_2/add_9_grad/tuple/control_dependencyIdentity0gradients_2/add_10_grad/tuple/control_dependency(^gradients_2/add_9_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_2/Fill
�
1gradients_2/add_9_grad/tuple/control_dependency_1Identity0gradients_2/add_10_grad/tuple/control_dependency(^gradients_2/add_9_grad/tuple/group_deps*
T0*#
_class
loc:@gradients_2/Fill
e
&gradients_2/Mean_13_grad/Reshape/shapeConst^sac_policy_opt*
valueB:*
dtype0
�
 gradients_2/Mean_13_grad/ReshapeReshape2gradients_2/add_10_grad/tuple/control_dependency_1&gradients_2/Mean_13_grad/Reshape/shape*
T0*
Tshape0
]
gradients_2/Mean_13_grad/ConstConst^sac_policy_opt*
valueB:*
dtype0
�
gradients_2/Mean_13_grad/TileTile gradients_2/Mean_13_grad/Reshapegradients_2/Mean_13_grad/Const*

Tmultiples0*
T0
^
 gradients_2/Mean_13_grad/Const_1Const^sac_policy_opt*
valueB
 *   @*
dtype0
u
 gradients_2/Mean_13_grad/truedivRealDivgradients_2/Mean_13_grad/Tile gradients_2/Mean_13_grad/Const_1*
T0
d
%gradients_2/Mean_6_grad/Reshape/shapeConst^sac_policy_opt*
valueB:*
dtype0
�
gradients_2/Mean_6_grad/ReshapeReshape/gradients_2/add_9_grad/tuple/control_dependency%gradients_2/Mean_6_grad/Reshape/shape*
T0*
Tshape0
\
gradients_2/Mean_6_grad/ConstConst^sac_policy_opt*
valueB:*
dtype0

gradients_2/Mean_6_grad/TileTilegradients_2/Mean_6_grad/Reshapegradients_2/Mean_6_grad/Const*

Tmultiples0*
T0
]
gradients_2/Mean_6_grad/Const_1Const^sac_policy_opt*
valueB
 *   @*
dtype0
r
gradients_2/Mean_6_grad/truedivRealDivgradients_2/Mean_6_grad/Tilegradients_2/Mean_6_grad/Const_1*
T0
d
%gradients_2/Mean_7_grad/Reshape/shapeConst^sac_policy_opt*
valueB:*
dtype0
�
gradients_2/Mean_7_grad/ReshapeReshape1gradients_2/add_9_grad/tuple/control_dependency_1%gradients_2/Mean_7_grad/Reshape/shape*
T0*
Tshape0
\
gradients_2/Mean_7_grad/ConstConst^sac_policy_opt*
valueB:*
dtype0

gradients_2/Mean_7_grad/TileTilegradients_2/Mean_7_grad/Reshapegradients_2/Mean_7_grad/Const*

Tmultiples0*
T0
]
gradients_2/Mean_7_grad/Const_1Const^sac_policy_opt*
valueB
 *   @*
dtype0
r
gradients_2/Mean_7_grad/truedivRealDivgradients_2/Mean_7_grad/Tilegradients_2/Mean_7_grad/Const_1*
T0
r
&gradients_2/Mean_13/input_grad/unstackUnpack gradients_2/Mean_13_grad/truediv*
T0*	
num*

axis 
q
/gradients_2/Mean_13/input_grad/tuple/group_depsNoOp'^gradients_2/Mean_13/input_grad/unstack^sac_policy_opt
�
7gradients_2/Mean_13/input_grad/tuple/control_dependencyIdentity&gradients_2/Mean_13/input_grad/unstack0^gradients_2/Mean_13/input_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/Mean_13/input_grad/unstack
�
9gradients_2/Mean_13/input_grad/tuple/control_dependency_1Identity(gradients_2/Mean_13/input_grad/unstack:10^gradients_2/Mean_13/input_grad/tuple/group_deps*
T0*9
_class/
-+loc:@gradients_2/Mean_13/input_grad/unstack
p
%gradients_2/Mean_6/input_grad/unstackUnpackgradients_2/Mean_6_grad/truediv*
T0*	
num*

axis 
o
.gradients_2/Mean_6/input_grad/tuple/group_depsNoOp&^gradients_2/Mean_6/input_grad/unstack^sac_policy_opt
�
6gradients_2/Mean_6/input_grad/tuple/control_dependencyIdentity%gradients_2/Mean_6/input_grad/unstack/^gradients_2/Mean_6/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_2/Mean_6/input_grad/unstack
�
8gradients_2/Mean_6/input_grad/tuple/control_dependency_1Identity'gradients_2/Mean_6/input_grad/unstack:1/^gradients_2/Mean_6/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_2/Mean_6/input_grad/unstack
p
%gradients_2/Mean_7/input_grad/unstackUnpackgradients_2/Mean_7_grad/truediv*
T0*	
num*

axis 
o
.gradients_2/Mean_7/input_grad/tuple/group_depsNoOp&^gradients_2/Mean_7/input_grad/unstack^sac_policy_opt
�
6gradients_2/Mean_7/input_grad/tuple/control_dependencyIdentity%gradients_2/Mean_7/input_grad/unstack/^gradients_2/Mean_7/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_2/Mean_7/input_grad/unstack
�
8gradients_2/Mean_7/input_grad/tuple/control_dependency_1Identity'gradients_2/Mean_7/input_grad/unstack:1/^gradients_2/Mean_7/input_grad/tuple/group_deps*
T0*8
_class.
,*loc:@gradients_2/Mean_7/input_grad/unstack
m
gradients_2/mul_25_grad/MulMul7gradients_2/Mean_13/input_grad/tuple/control_dependencyMean_11*
T0
p
gradients_2/mul_25_grad/Mul_1Mul7gradients_2/Mean_13/input_grad/tuple/control_dependencymul_25/x*
T0

(gradients_2/mul_25_grad/tuple/group_depsNoOp^gradients_2/mul_25_grad/Mul^gradients_2/mul_25_grad/Mul_1^sac_policy_opt
�
0gradients_2/mul_25_grad/tuple/control_dependencyIdentitygradients_2/mul_25_grad/Mul)^gradients_2/mul_25_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_25_grad/Mul
�
2gradients_2/mul_25_grad/tuple/control_dependency_1Identitygradients_2/mul_25_grad/Mul_1)^gradients_2/mul_25_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_25_grad/Mul_1
o
gradients_2/mul_28_grad/MulMul9gradients_2/Mean_13/input_grad/tuple/control_dependency_1Mean_12*
T0
r
gradients_2/mul_28_grad/Mul_1Mul9gradients_2/Mean_13/input_grad/tuple/control_dependency_1mul_28/x*
T0

(gradients_2/mul_28_grad/tuple/group_depsNoOp^gradients_2/mul_28_grad/Mul^gradients_2/mul_28_grad/Mul_1^sac_policy_opt
�
0gradients_2/mul_28_grad/tuple/control_dependencyIdentitygradients_2/mul_28_grad/Mul)^gradients_2/mul_28_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_28_grad/Mul
�
2gradients_2/mul_28_grad/tuple/control_dependency_1Identitygradients_2/mul_28_grad/Mul_1)^gradients_2/mul_28_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_28_grad/Mul_1
j
gradients_2/mul_9_grad/MulMul6gradients_2/Mean_6/input_grad/tuple/control_dependencyMean_2*
T0
m
gradients_2/mul_9_grad/Mul_1Mul6gradients_2/Mean_6/input_grad/tuple/control_dependencymul_9/x*
T0
|
'gradients_2/mul_9_grad/tuple/group_depsNoOp^gradients_2/mul_9_grad/Mul^gradients_2/mul_9_grad/Mul_1^sac_policy_opt
�
/gradients_2/mul_9_grad/tuple/control_dependencyIdentitygradients_2/mul_9_grad/Mul(^gradients_2/mul_9_grad/tuple/group_deps*
T0*-
_class#
!loc:@gradients_2/mul_9_grad/Mul
�
1gradients_2/mul_9_grad/tuple/control_dependency_1Identitygradients_2/mul_9_grad/Mul_1(^gradients_2/mul_9_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients_2/mul_9_grad/Mul_1
m
gradients_2/mul_16_grad/MulMul8gradients_2/Mean_6/input_grad/tuple/control_dependency_1Mean_4*
T0
q
gradients_2/mul_16_grad/Mul_1Mul8gradients_2/Mean_6/input_grad/tuple/control_dependency_1mul_16/x*
T0

(gradients_2/mul_16_grad/tuple/group_depsNoOp^gradients_2/mul_16_grad/Mul^gradients_2/mul_16_grad/Mul_1^sac_policy_opt
�
0gradients_2/mul_16_grad/tuple/control_dependencyIdentitygradients_2/mul_16_grad/Mul)^gradients_2/mul_16_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_16_grad/Mul
�
2gradients_2/mul_16_grad/tuple/control_dependency_1Identitygradients_2/mul_16_grad/Mul_1)^gradients_2/mul_16_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_16_grad/Mul_1
k
gradients_2/mul_11_grad/MulMul6gradients_2/Mean_7/input_grad/tuple/control_dependencyMean_3*
T0
o
gradients_2/mul_11_grad/Mul_1Mul6gradients_2/Mean_7/input_grad/tuple/control_dependencymul_11/x*
T0

(gradients_2/mul_11_grad/tuple/group_depsNoOp^gradients_2/mul_11_grad/Mul^gradients_2/mul_11_grad/Mul_1^sac_policy_opt
�
0gradients_2/mul_11_grad/tuple/control_dependencyIdentitygradients_2/mul_11_grad/Mul)^gradients_2/mul_11_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_11_grad/Mul
�
2gradients_2/mul_11_grad/tuple/control_dependency_1Identitygradients_2/mul_11_grad/Mul_1)^gradients_2/mul_11_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_11_grad/Mul_1
m
gradients_2/mul_18_grad/MulMul8gradients_2/Mean_7/input_grad/tuple/control_dependency_1Mean_5*
T0
q
gradients_2/mul_18_grad/Mul_1Mul8gradients_2/Mean_7/input_grad/tuple/control_dependency_1mul_18/x*
T0

(gradients_2/mul_18_grad/tuple/group_depsNoOp^gradients_2/mul_18_grad/Mul^gradients_2/mul_18_grad/Mul_1^sac_policy_opt
�
0gradients_2/mul_18_grad/tuple/control_dependencyIdentitygradients_2/mul_18_grad/Mul)^gradients_2/mul_18_grad/tuple/group_deps*
T0*.
_class$
" loc:@gradients_2/mul_18_grad/Mul
�
2gradients_2/mul_18_grad/tuple/control_dependency_1Identitygradients_2/mul_18_grad/Mul_1)^gradients_2/mul_18_grad/tuple/group_deps*
T0*0
_class&
$"loc:@gradients_2/mul_18_grad/Mul_1
l
&gradients_2/Mean_11_grad/Reshape/shapeConst^sac_policy_opt*
valueB"      *
dtype0
�
 gradients_2/Mean_11_grad/ReshapeReshape2gradients_2/mul_25_grad/tuple/control_dependency_1&gradients_2/Mean_11_grad/Reshape/shape*
T0*
Tshape0
Y
gradients_2/Mean_11_grad/ShapeShapemul_24^sac_policy_opt*
T0*
out_type0
�
gradients_2/Mean_11_grad/TileTile gradients_2/Mean_11_grad/Reshapegradients_2/Mean_11_grad/Shape*

Tmultiples0*
T0
[
 gradients_2/Mean_11_grad/Shape_1Shapemul_24^sac_policy_opt*
T0*
out_type0
Z
 gradients_2/Mean_11_grad/Shape_2Const^sac_policy_opt*
valueB *
dtype0
]
gradients_2/Mean_11_grad/ConstConst^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_11_grad/ProdProd gradients_2/Mean_11_grad/Shape_1gradients_2/Mean_11_grad/Const*

Tidx0*
	keep_dims( *
T0
_
 gradients_2/Mean_11_grad/Const_1Const^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_11_grad/Prod_1Prod gradients_2/Mean_11_grad/Shape_2 gradients_2/Mean_11_grad/Const_1*

Tidx0*
	keep_dims( *
T0
]
"gradients_2/Mean_11_grad/Maximum/yConst^sac_policy_opt*
value	B :*
dtype0
y
 gradients_2/Mean_11_grad/MaximumMaximumgradients_2/Mean_11_grad/Prod_1"gradients_2/Mean_11_grad/Maximum/y*
T0
w
!gradients_2/Mean_11_grad/floordivFloorDivgradients_2/Mean_11_grad/Prod gradients_2/Mean_11_grad/Maximum*
T0
p
gradients_2/Mean_11_grad/CastCast!gradients_2/Mean_11_grad/floordiv*

SrcT0*
Truncate( *

DstT0
r
 gradients_2/Mean_11_grad/truedivRealDivgradients_2/Mean_11_grad/Tilegradients_2/Mean_11_grad/Cast*
T0
l
&gradients_2/Mean_12_grad/Reshape/shapeConst^sac_policy_opt*
valueB"      *
dtype0
�
 gradients_2/Mean_12_grad/ReshapeReshape2gradients_2/mul_28_grad/tuple/control_dependency_1&gradients_2/Mean_12_grad/Reshape/shape*
T0*
Tshape0
Y
gradients_2/Mean_12_grad/ShapeShapemul_27^sac_policy_opt*
T0*
out_type0
�
gradients_2/Mean_12_grad/TileTile gradients_2/Mean_12_grad/Reshapegradients_2/Mean_12_grad/Shape*

Tmultiples0*
T0
[
 gradients_2/Mean_12_grad/Shape_1Shapemul_27^sac_policy_opt*
T0*
out_type0
Z
 gradients_2/Mean_12_grad/Shape_2Const^sac_policy_opt*
valueB *
dtype0
]
gradients_2/Mean_12_grad/ConstConst^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_12_grad/ProdProd gradients_2/Mean_12_grad/Shape_1gradients_2/Mean_12_grad/Const*

Tidx0*
	keep_dims( *
T0
_
 gradients_2/Mean_12_grad/Const_1Const^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_12_grad/Prod_1Prod gradients_2/Mean_12_grad/Shape_2 gradients_2/Mean_12_grad/Const_1*

Tidx0*
	keep_dims( *
T0
]
"gradients_2/Mean_12_grad/Maximum/yConst^sac_policy_opt*
value	B :*
dtype0
y
 gradients_2/Mean_12_grad/MaximumMaximumgradients_2/Mean_12_grad/Prod_1"gradients_2/Mean_12_grad/Maximum/y*
T0
w
!gradients_2/Mean_12_grad/floordivFloorDivgradients_2/Mean_12_grad/Prod gradients_2/Mean_12_grad/Maximum*
T0
p
gradients_2/Mean_12_grad/CastCast!gradients_2/Mean_12_grad/floordiv*

SrcT0*
Truncate( *

DstT0
r
 gradients_2/Mean_12_grad/truedivRealDivgradients_2/Mean_12_grad/Tilegradients_2/Mean_12_grad/Cast*
T0
k
%gradients_2/Mean_2_grad/Reshape/shapeConst^sac_policy_opt*
valueB"      *
dtype0
�
gradients_2/Mean_2_grad/ReshapeReshape1gradients_2/mul_9_grad/tuple/control_dependency_1%gradients_2/Mean_2_grad/Reshape/shape*
T0*
Tshape0
W
gradients_2/Mean_2_grad/ShapeShapemul_8^sac_policy_opt*
T0*
out_type0

gradients_2/Mean_2_grad/TileTilegradients_2/Mean_2_grad/Reshapegradients_2/Mean_2_grad/Shape*

Tmultiples0*
T0
Y
gradients_2/Mean_2_grad/Shape_1Shapemul_8^sac_policy_opt*
T0*
out_type0
Y
gradients_2/Mean_2_grad/Shape_2Const^sac_policy_opt*
valueB *
dtype0
\
gradients_2/Mean_2_grad/ConstConst^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_2_grad/ProdProdgradients_2/Mean_2_grad/Shape_1gradients_2/Mean_2_grad/Const*

Tidx0*
	keep_dims( *
T0
^
gradients_2/Mean_2_grad/Const_1Const^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_2_grad/Prod_1Prodgradients_2/Mean_2_grad/Shape_2gradients_2/Mean_2_grad/Const_1*

Tidx0*
	keep_dims( *
T0
\
!gradients_2/Mean_2_grad/Maximum/yConst^sac_policy_opt*
value	B :*
dtype0
v
gradients_2/Mean_2_grad/MaximumMaximumgradients_2/Mean_2_grad/Prod_1!gradients_2/Mean_2_grad/Maximum/y*
T0
t
 gradients_2/Mean_2_grad/floordivFloorDivgradients_2/Mean_2_grad/Prodgradients_2/Mean_2_grad/Maximum*
T0
n
gradients_2/Mean_2_grad/CastCast gradients_2/Mean_2_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_2_grad/truedivRealDivgradients_2/Mean_2_grad/Tilegradients_2/Mean_2_grad/Cast*
T0
k
%gradients_2/Mean_4_grad/Reshape/shapeConst^sac_policy_opt*
valueB"      *
dtype0
�
gradients_2/Mean_4_grad/ReshapeReshape2gradients_2/mul_16_grad/tuple/control_dependency_1%gradients_2/Mean_4_grad/Reshape/shape*
T0*
Tshape0
X
gradients_2/Mean_4_grad/ShapeShapemul_15^sac_policy_opt*
T0*
out_type0

gradients_2/Mean_4_grad/TileTilegradients_2/Mean_4_grad/Reshapegradients_2/Mean_4_grad/Shape*

Tmultiples0*
T0
Z
gradients_2/Mean_4_grad/Shape_1Shapemul_15^sac_policy_opt*
T0*
out_type0
Y
gradients_2/Mean_4_grad/Shape_2Const^sac_policy_opt*
valueB *
dtype0
\
gradients_2/Mean_4_grad/ConstConst^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_4_grad/ProdProdgradients_2/Mean_4_grad/Shape_1gradients_2/Mean_4_grad/Const*

Tidx0*
	keep_dims( *
T0
^
gradients_2/Mean_4_grad/Const_1Const^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_4_grad/Prod_1Prodgradients_2/Mean_4_grad/Shape_2gradients_2/Mean_4_grad/Const_1*

Tidx0*
	keep_dims( *
T0
\
!gradients_2/Mean_4_grad/Maximum/yConst^sac_policy_opt*
value	B :*
dtype0
v
gradients_2/Mean_4_grad/MaximumMaximumgradients_2/Mean_4_grad/Prod_1!gradients_2/Mean_4_grad/Maximum/y*
T0
t
 gradients_2/Mean_4_grad/floordivFloorDivgradients_2/Mean_4_grad/Prodgradients_2/Mean_4_grad/Maximum*
T0
n
gradients_2/Mean_4_grad/CastCast gradients_2/Mean_4_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_4_grad/truedivRealDivgradients_2/Mean_4_grad/Tilegradients_2/Mean_4_grad/Cast*
T0
k
%gradients_2/Mean_3_grad/Reshape/shapeConst^sac_policy_opt*
valueB"      *
dtype0
�
gradients_2/Mean_3_grad/ReshapeReshape2gradients_2/mul_11_grad/tuple/control_dependency_1%gradients_2/Mean_3_grad/Reshape/shape*
T0*
Tshape0
X
gradients_2/Mean_3_grad/ShapeShapemul_10^sac_policy_opt*
T0*
out_type0

gradients_2/Mean_3_grad/TileTilegradients_2/Mean_3_grad/Reshapegradients_2/Mean_3_grad/Shape*

Tmultiples0*
T0
Z
gradients_2/Mean_3_grad/Shape_1Shapemul_10^sac_policy_opt*
T0*
out_type0
Y
gradients_2/Mean_3_grad/Shape_2Const^sac_policy_opt*
valueB *
dtype0
\
gradients_2/Mean_3_grad/ConstConst^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_3_grad/ProdProdgradients_2/Mean_3_grad/Shape_1gradients_2/Mean_3_grad/Const*

Tidx0*
	keep_dims( *
T0
^
gradients_2/Mean_3_grad/Const_1Const^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_3_grad/Prod_1Prodgradients_2/Mean_3_grad/Shape_2gradients_2/Mean_3_grad/Const_1*

Tidx0*
	keep_dims( *
T0
\
!gradients_2/Mean_3_grad/Maximum/yConst^sac_policy_opt*
value	B :*
dtype0
v
gradients_2/Mean_3_grad/MaximumMaximumgradients_2/Mean_3_grad/Prod_1!gradients_2/Mean_3_grad/Maximum/y*
T0
t
 gradients_2/Mean_3_grad/floordivFloorDivgradients_2/Mean_3_grad/Prodgradients_2/Mean_3_grad/Maximum*
T0
n
gradients_2/Mean_3_grad/CastCast gradients_2/Mean_3_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_3_grad/truedivRealDivgradients_2/Mean_3_grad/Tilegradients_2/Mean_3_grad/Cast*
T0
k
%gradients_2/Mean_5_grad/Reshape/shapeConst^sac_policy_opt*
valueB"      *
dtype0
�
gradients_2/Mean_5_grad/ReshapeReshape2gradients_2/mul_18_grad/tuple/control_dependency_1%gradients_2/Mean_5_grad/Reshape/shape*
T0*
Tshape0
X
gradients_2/Mean_5_grad/ShapeShapemul_17^sac_policy_opt*
T0*
out_type0

gradients_2/Mean_5_grad/TileTilegradients_2/Mean_5_grad/Reshapegradients_2/Mean_5_grad/Shape*

Tmultiples0*
T0
Z
gradients_2/Mean_5_grad/Shape_1Shapemul_17^sac_policy_opt*
T0*
out_type0
Y
gradients_2/Mean_5_grad/Shape_2Const^sac_policy_opt*
valueB *
dtype0
\
gradients_2/Mean_5_grad/ConstConst^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_5_grad/ProdProdgradients_2/Mean_5_grad/Shape_1gradients_2/Mean_5_grad/Const*

Tidx0*
	keep_dims( *
T0
^
gradients_2/Mean_5_grad/Const_1Const^sac_policy_opt*
valueB: *
dtype0
�
gradients_2/Mean_5_grad/Prod_1Prodgradients_2/Mean_5_grad/Shape_2gradients_2/Mean_5_grad/Const_1*

Tidx0*
	keep_dims( *
T0
\
!gradients_2/Mean_5_grad/Maximum/yConst^sac_policy_opt*
value	B :*
dtype0
v
gradients_2/Mean_5_grad/MaximumMaximumgradients_2/Mean_5_grad/Prod_1!gradients_2/Mean_5_grad/Maximum/y*
T0
t
 gradients_2/Mean_5_grad/floordivFloorDivgradients_2/Mean_5_grad/Prodgradients_2/Mean_5_grad/Maximum*
T0
n
gradients_2/Mean_5_grad/CastCast gradients_2/Mean_5_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_2/Mean_5_grad/truedivRealDivgradients_2/Mean_5_grad/Tilegradients_2/Mean_5_grad/Cast*
T0
[
gradients_2/mul_24_grad/ShapeShape	ToFloat_6^sac_policy_opt*
T0*
out_type0
g
gradients_2/mul_24_grad/Shape_1ShapeSquaredDifference_6^sac_policy_opt*
T0*
out_type0
�
-gradients_2/mul_24_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_24_grad/Shapegradients_2/mul_24_grad/Shape_1*
T0
b
gradients_2/mul_24_grad/MulMul gradients_2/Mean_11_grad/truedivSquaredDifference_6*
T0
�
gradients_2/mul_24_grad/SumSumgradients_2/mul_24_grad/Mul-gradients_2/mul_24_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/mul_24_grad/ReshapeReshapegradients_2/mul_24_grad/Sumgradients_2/mul_24_grad/Shape*
T0*
Tshape0
Z
gradients_2/mul_24_grad/Mul_1Mul	ToFloat_6 gradients_2/Mean_11_grad/truediv*
T0
�
gradients_2/mul_24_grad/Sum_1Sumgradients_2/mul_24_grad/Mul_1/gradients_2/mul_24_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_2/mul_24_grad/Reshape_1Reshapegradients_2/mul_24_grad/Sum_1gradients_2/mul_24_grad/Shape_1*
T0*
Tshape0
�
(gradients_2/mul_24_grad/tuple/group_depsNoOp ^gradients_2/mul_24_grad/Reshape"^gradients_2/mul_24_grad/Reshape_1^sac_policy_opt
�
0gradients_2/mul_24_grad/tuple/control_dependencyIdentitygradients_2/mul_24_grad/Reshape)^gradients_2/mul_24_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/mul_24_grad/Reshape
�
2gradients_2/mul_24_grad/tuple/control_dependency_1Identity!gradients_2/mul_24_grad/Reshape_1)^gradients_2/mul_24_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/mul_24_grad/Reshape_1
[
gradients_2/mul_27_grad/ShapeShape	ToFloat_7^sac_policy_opt*
T0*
out_type0
g
gradients_2/mul_27_grad/Shape_1ShapeSquaredDifference_7^sac_policy_opt*
T0*
out_type0
�
-gradients_2/mul_27_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_27_grad/Shapegradients_2/mul_27_grad/Shape_1*
T0
b
gradients_2/mul_27_grad/MulMul gradients_2/Mean_12_grad/truedivSquaredDifference_7*
T0
�
gradients_2/mul_27_grad/SumSumgradients_2/mul_27_grad/Mul-gradients_2/mul_27_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/mul_27_grad/ReshapeReshapegradients_2/mul_27_grad/Sumgradients_2/mul_27_grad/Shape*
T0*
Tshape0
Z
gradients_2/mul_27_grad/Mul_1Mul	ToFloat_7 gradients_2/Mean_12_grad/truediv*
T0
�
gradients_2/mul_27_grad/Sum_1Sumgradients_2/mul_27_grad/Mul_1/gradients_2/mul_27_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_2/mul_27_grad/Reshape_1Reshapegradients_2/mul_27_grad/Sum_1gradients_2/mul_27_grad/Shape_1*
T0*
Tshape0
�
(gradients_2/mul_27_grad/tuple/group_depsNoOp ^gradients_2/mul_27_grad/Reshape"^gradients_2/mul_27_grad/Reshape_1^sac_policy_opt
�
0gradients_2/mul_27_grad/tuple/control_dependencyIdentitygradients_2/mul_27_grad/Reshape)^gradients_2/mul_27_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/mul_27_grad/Reshape
�
2gradients_2/mul_27_grad/tuple/control_dependency_1Identity!gradients_2/mul_27_grad/Reshape_1)^gradients_2/mul_27_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/mul_27_grad/Reshape_1
X
gradients_2/mul_8_grad/ShapeShapeToFloat^sac_policy_opt*
T0*
out_type0
f
gradients_2/mul_8_grad/Shape_1ShapeSquaredDifference_2^sac_policy_opt*
T0*
out_type0
�
,gradients_2/mul_8_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_8_grad/Shapegradients_2/mul_8_grad/Shape_1*
T0
`
gradients_2/mul_8_grad/MulMulgradients_2/Mean_2_grad/truedivSquaredDifference_2*
T0
�
gradients_2/mul_8_grad/SumSumgradients_2/mul_8_grad/Mul,gradients_2/mul_8_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
z
gradients_2/mul_8_grad/ReshapeReshapegradients_2/mul_8_grad/Sumgradients_2/mul_8_grad/Shape*
T0*
Tshape0
V
gradients_2/mul_8_grad/Mul_1MulToFloatgradients_2/Mean_2_grad/truediv*
T0
�
gradients_2/mul_8_grad/Sum_1Sumgradients_2/mul_8_grad/Mul_1.gradients_2/mul_8_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
 gradients_2/mul_8_grad/Reshape_1Reshapegradients_2/mul_8_grad/Sum_1gradients_2/mul_8_grad/Shape_1*
T0*
Tshape0
�
'gradients_2/mul_8_grad/tuple/group_depsNoOp^gradients_2/mul_8_grad/Reshape!^gradients_2/mul_8_grad/Reshape_1^sac_policy_opt
�
/gradients_2/mul_8_grad/tuple/control_dependencyIdentitygradients_2/mul_8_grad/Reshape(^gradients_2/mul_8_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients_2/mul_8_grad/Reshape
�
1gradients_2/mul_8_grad/tuple/control_dependency_1Identity gradients_2/mul_8_grad/Reshape_1(^gradients_2/mul_8_grad/tuple/group_deps*
T0*3
_class)
'%loc:@gradients_2/mul_8_grad/Reshape_1
[
gradients_2/mul_15_grad/ShapeShape	ToFloat_2^sac_policy_opt*
T0*
out_type0
g
gradients_2/mul_15_grad/Shape_1ShapeSquaredDifference_4^sac_policy_opt*
T0*
out_type0
�
-gradients_2/mul_15_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_15_grad/Shapegradients_2/mul_15_grad/Shape_1*
T0
a
gradients_2/mul_15_grad/MulMulgradients_2/Mean_4_grad/truedivSquaredDifference_4*
T0
�
gradients_2/mul_15_grad/SumSumgradients_2/mul_15_grad/Mul-gradients_2/mul_15_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/mul_15_grad/ReshapeReshapegradients_2/mul_15_grad/Sumgradients_2/mul_15_grad/Shape*
T0*
Tshape0
Y
gradients_2/mul_15_grad/Mul_1Mul	ToFloat_2gradients_2/Mean_4_grad/truediv*
T0
�
gradients_2/mul_15_grad/Sum_1Sumgradients_2/mul_15_grad/Mul_1/gradients_2/mul_15_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_2/mul_15_grad/Reshape_1Reshapegradients_2/mul_15_grad/Sum_1gradients_2/mul_15_grad/Shape_1*
T0*
Tshape0
�
(gradients_2/mul_15_grad/tuple/group_depsNoOp ^gradients_2/mul_15_grad/Reshape"^gradients_2/mul_15_grad/Reshape_1^sac_policy_opt
�
0gradients_2/mul_15_grad/tuple/control_dependencyIdentitygradients_2/mul_15_grad/Reshape)^gradients_2/mul_15_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/mul_15_grad/Reshape
�
2gradients_2/mul_15_grad/tuple/control_dependency_1Identity!gradients_2/mul_15_grad/Reshape_1)^gradients_2/mul_15_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/mul_15_grad/Reshape_1
[
gradients_2/mul_10_grad/ShapeShape	ToFloat_1^sac_policy_opt*
T0*
out_type0
g
gradients_2/mul_10_grad/Shape_1ShapeSquaredDifference_3^sac_policy_opt*
T0*
out_type0
�
-gradients_2/mul_10_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_10_grad/Shapegradients_2/mul_10_grad/Shape_1*
T0
a
gradients_2/mul_10_grad/MulMulgradients_2/Mean_3_grad/truedivSquaredDifference_3*
T0
�
gradients_2/mul_10_grad/SumSumgradients_2/mul_10_grad/Mul-gradients_2/mul_10_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/mul_10_grad/ReshapeReshapegradients_2/mul_10_grad/Sumgradients_2/mul_10_grad/Shape*
T0*
Tshape0
Y
gradients_2/mul_10_grad/Mul_1Mul	ToFloat_1gradients_2/Mean_3_grad/truediv*
T0
�
gradients_2/mul_10_grad/Sum_1Sumgradients_2/mul_10_grad/Mul_1/gradients_2/mul_10_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_2/mul_10_grad/Reshape_1Reshapegradients_2/mul_10_grad/Sum_1gradients_2/mul_10_grad/Shape_1*
T0*
Tshape0
�
(gradients_2/mul_10_grad/tuple/group_depsNoOp ^gradients_2/mul_10_grad/Reshape"^gradients_2/mul_10_grad/Reshape_1^sac_policy_opt
�
0gradients_2/mul_10_grad/tuple/control_dependencyIdentitygradients_2/mul_10_grad/Reshape)^gradients_2/mul_10_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/mul_10_grad/Reshape
�
2gradients_2/mul_10_grad/tuple/control_dependency_1Identity!gradients_2/mul_10_grad/Reshape_1)^gradients_2/mul_10_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/mul_10_grad/Reshape_1
[
gradients_2/mul_17_grad/ShapeShape	ToFloat_3^sac_policy_opt*
T0*
out_type0
g
gradients_2/mul_17_grad/Shape_1ShapeSquaredDifference_5^sac_policy_opt*
T0*
out_type0
�
-gradients_2/mul_17_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_2/mul_17_grad/Shapegradients_2/mul_17_grad/Shape_1*
T0
a
gradients_2/mul_17_grad/MulMulgradients_2/Mean_5_grad/truedivSquaredDifference_5*
T0
�
gradients_2/mul_17_grad/SumSumgradients_2/mul_17_grad/Mul-gradients_2/mul_17_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_2/mul_17_grad/ReshapeReshapegradients_2/mul_17_grad/Sumgradients_2/mul_17_grad/Shape*
T0*
Tshape0
Y
gradients_2/mul_17_grad/Mul_1Mul	ToFloat_3gradients_2/Mean_5_grad/truediv*
T0
�
gradients_2/mul_17_grad/Sum_1Sumgradients_2/mul_17_grad/Mul_1/gradients_2/mul_17_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_2/mul_17_grad/Reshape_1Reshapegradients_2/mul_17_grad/Sum_1gradients_2/mul_17_grad/Shape_1*
T0*
Tshape0
�
(gradients_2/mul_17_grad/tuple/group_depsNoOp ^gradients_2/mul_17_grad/Reshape"^gradients_2/mul_17_grad/Reshape_1^sac_policy_opt
�
0gradients_2/mul_17_grad/tuple/control_dependencyIdentitygradients_2/mul_17_grad/Reshape)^gradients_2/mul_17_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_2/mul_17_grad/Reshape
�
2gradients_2/mul_17_grad/tuple/control_dependency_1Identity!gradients_2/mul_17_grad/Reshape_1)^gradients_2/mul_17_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_2/mul_17_grad/Reshape_1
�
+gradients_2/SquaredDifference_6_grad/scalarConst3^gradients_2/mul_24_grad/tuple/control_dependency_1^sac_policy_opt*
valueB
 *   @*
dtype0
�
(gradients_2/SquaredDifference_6_grad/MulMul+gradients_2/SquaredDifference_6_grad/scalar2gradients_2/mul_24_grad/tuple/control_dependency_1*
T0
�
(gradients_2/SquaredDifference_6_grad/subSub$critic/value/extrinsic_value/BiasAddStopGradient_43^gradients_2/mul_24_grad/tuple/control_dependency_1^sac_policy_opt*
T0
�
*gradients_2/SquaredDifference_6_grad/mul_1Mul(gradients_2/SquaredDifference_6_grad/Mul(gradients_2/SquaredDifference_6_grad/sub*
T0
�
*gradients_2/SquaredDifference_6_grad/ShapeShape$critic/value/extrinsic_value/BiasAdd^sac_policy_opt*
T0*
out_type0
o
,gradients_2/SquaredDifference_6_grad/Shape_1ShapeStopGradient_4^sac_policy_opt*
T0*
out_type0
�
:gradients_2/SquaredDifference_6_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_6_grad/Shape,gradients_2/SquaredDifference_6_grad/Shape_1*
T0
�
(gradients_2/SquaredDifference_6_grad/SumSum*gradients_2/SquaredDifference_6_grad/mul_1:gradients_2/SquaredDifference_6_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_2/SquaredDifference_6_grad/ReshapeReshape(gradients_2/SquaredDifference_6_grad/Sum*gradients_2/SquaredDifference_6_grad/Shape*
T0*
Tshape0
�
*gradients_2/SquaredDifference_6_grad/Sum_1Sum*gradients_2/SquaredDifference_6_grad/mul_1<gradients_2/SquaredDifference_6_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_2/SquaredDifference_6_grad/Reshape_1Reshape*gradients_2/SquaredDifference_6_grad/Sum_1,gradients_2/SquaredDifference_6_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_6_grad/NegNeg.gradients_2/SquaredDifference_6_grad/Reshape_1*
T0
�
5gradients_2/SquaredDifference_6_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_6_grad/Neg-^gradients_2/SquaredDifference_6_grad/Reshape^sac_policy_opt
�
=gradients_2/SquaredDifference_6_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_6_grad/Reshape6^gradients_2/SquaredDifference_6_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_6_grad/Reshape
�
?gradients_2/SquaredDifference_6_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_6_grad/Neg6^gradients_2/SquaredDifference_6_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_6_grad/Neg
�
+gradients_2/SquaredDifference_7_grad/scalarConst3^gradients_2/mul_27_grad/tuple/control_dependency_1^sac_policy_opt*
valueB
 *   @*
dtype0
�
(gradients_2/SquaredDifference_7_grad/MulMul+gradients_2/SquaredDifference_7_grad/scalar2gradients_2/mul_27_grad/tuple/control_dependency_1*
T0
�
(gradients_2/SquaredDifference_7_grad/subSub$critic/value/curiosity_value/BiasAddStopGradient_53^gradients_2/mul_27_grad/tuple/control_dependency_1^sac_policy_opt*
T0
�
*gradients_2/SquaredDifference_7_grad/mul_1Mul(gradients_2/SquaredDifference_7_grad/Mul(gradients_2/SquaredDifference_7_grad/sub*
T0
�
*gradients_2/SquaredDifference_7_grad/ShapeShape$critic/value/curiosity_value/BiasAdd^sac_policy_opt*
T0*
out_type0
o
,gradients_2/SquaredDifference_7_grad/Shape_1ShapeStopGradient_5^sac_policy_opt*
T0*
out_type0
�
:gradients_2/SquaredDifference_7_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_7_grad/Shape,gradients_2/SquaredDifference_7_grad/Shape_1*
T0
�
(gradients_2/SquaredDifference_7_grad/SumSum*gradients_2/SquaredDifference_7_grad/mul_1:gradients_2/SquaredDifference_7_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_2/SquaredDifference_7_grad/ReshapeReshape(gradients_2/SquaredDifference_7_grad/Sum*gradients_2/SquaredDifference_7_grad/Shape*
T0*
Tshape0
�
*gradients_2/SquaredDifference_7_grad/Sum_1Sum*gradients_2/SquaredDifference_7_grad/mul_1<gradients_2/SquaredDifference_7_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_2/SquaredDifference_7_grad/Reshape_1Reshape*gradients_2/SquaredDifference_7_grad/Sum_1,gradients_2/SquaredDifference_7_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_7_grad/NegNeg.gradients_2/SquaredDifference_7_grad/Reshape_1*
T0
�
5gradients_2/SquaredDifference_7_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_7_grad/Neg-^gradients_2/SquaredDifference_7_grad/Reshape^sac_policy_opt
�
=gradients_2/SquaredDifference_7_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_7_grad/Reshape6^gradients_2/SquaredDifference_7_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_7_grad/Reshape
�
?gradients_2/SquaredDifference_7_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_7_grad/Neg6^gradients_2/SquaredDifference_7_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_7_grad/Neg
�
+gradients_2/SquaredDifference_2_grad/scalarConst2^gradients_2/mul_8_grad/tuple/control_dependency_1^sac_policy_opt*
valueB
 *   @*
dtype0
�
(gradients_2/SquaredDifference_2_grad/MulMul+gradients_2/SquaredDifference_2_grad/scalar1gradients_2/mul_8_grad/tuple/control_dependency_1*
T0
�
(gradients_2/SquaredDifference_2_grad/subSubStopGradient_1)critic/q/q1_encoding/extrinsic_q1/BiasAdd2^gradients_2/mul_8_grad/tuple/control_dependency_1^sac_policy_opt*
T0
�
*gradients_2/SquaredDifference_2_grad/mul_1Mul(gradients_2/SquaredDifference_2_grad/Mul(gradients_2/SquaredDifference_2_grad/sub*
T0
m
*gradients_2/SquaredDifference_2_grad/ShapeShapeStopGradient_1^sac_policy_opt*
T0*
out_type0
�
,gradients_2/SquaredDifference_2_grad/Shape_1Shape)critic/q/q1_encoding/extrinsic_q1/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/SquaredDifference_2_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_2_grad/Shape,gradients_2/SquaredDifference_2_grad/Shape_1*
T0
�
(gradients_2/SquaredDifference_2_grad/SumSum*gradients_2/SquaredDifference_2_grad/mul_1:gradients_2/SquaredDifference_2_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_2/SquaredDifference_2_grad/ReshapeReshape(gradients_2/SquaredDifference_2_grad/Sum*gradients_2/SquaredDifference_2_grad/Shape*
T0*
Tshape0
�
*gradients_2/SquaredDifference_2_grad/Sum_1Sum*gradients_2/SquaredDifference_2_grad/mul_1<gradients_2/SquaredDifference_2_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_2/SquaredDifference_2_grad/Reshape_1Reshape*gradients_2/SquaredDifference_2_grad/Sum_1,gradients_2/SquaredDifference_2_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_2_grad/NegNeg.gradients_2/SquaredDifference_2_grad/Reshape_1*
T0
�
5gradients_2/SquaredDifference_2_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_2_grad/Neg-^gradients_2/SquaredDifference_2_grad/Reshape^sac_policy_opt
�
=gradients_2/SquaredDifference_2_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_2_grad/Reshape6^gradients_2/SquaredDifference_2_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_2_grad/Reshape
�
?gradients_2/SquaredDifference_2_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_2_grad/Neg6^gradients_2/SquaredDifference_2_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_2_grad/Neg
�
+gradients_2/SquaredDifference_4_grad/scalarConst3^gradients_2/mul_15_grad/tuple/control_dependency_1^sac_policy_opt*
valueB
 *   @*
dtype0
�
(gradients_2/SquaredDifference_4_grad/MulMul+gradients_2/SquaredDifference_4_grad/scalar2gradients_2/mul_15_grad/tuple/control_dependency_1*
T0
�
(gradients_2/SquaredDifference_4_grad/subSubStopGradient_2)critic/q/q1_encoding/curiosity_q1/BiasAdd3^gradients_2/mul_15_grad/tuple/control_dependency_1^sac_policy_opt*
T0
�
*gradients_2/SquaredDifference_4_grad/mul_1Mul(gradients_2/SquaredDifference_4_grad/Mul(gradients_2/SquaredDifference_4_grad/sub*
T0
m
*gradients_2/SquaredDifference_4_grad/ShapeShapeStopGradient_2^sac_policy_opt*
T0*
out_type0
�
,gradients_2/SquaredDifference_4_grad/Shape_1Shape)critic/q/q1_encoding/curiosity_q1/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/SquaredDifference_4_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_4_grad/Shape,gradients_2/SquaredDifference_4_grad/Shape_1*
T0
�
(gradients_2/SquaredDifference_4_grad/SumSum*gradients_2/SquaredDifference_4_grad/mul_1:gradients_2/SquaredDifference_4_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_2/SquaredDifference_4_grad/ReshapeReshape(gradients_2/SquaredDifference_4_grad/Sum*gradients_2/SquaredDifference_4_grad/Shape*
T0*
Tshape0
�
*gradients_2/SquaredDifference_4_grad/Sum_1Sum*gradients_2/SquaredDifference_4_grad/mul_1<gradients_2/SquaredDifference_4_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_2/SquaredDifference_4_grad/Reshape_1Reshape*gradients_2/SquaredDifference_4_grad/Sum_1,gradients_2/SquaredDifference_4_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_4_grad/NegNeg.gradients_2/SquaredDifference_4_grad/Reshape_1*
T0
�
5gradients_2/SquaredDifference_4_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_4_grad/Neg-^gradients_2/SquaredDifference_4_grad/Reshape^sac_policy_opt
�
=gradients_2/SquaredDifference_4_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_4_grad/Reshape6^gradients_2/SquaredDifference_4_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_4_grad/Reshape
�
?gradients_2/SquaredDifference_4_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_4_grad/Neg6^gradients_2/SquaredDifference_4_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_4_grad/Neg
�
+gradients_2/SquaredDifference_3_grad/scalarConst3^gradients_2/mul_10_grad/tuple/control_dependency_1^sac_policy_opt*
valueB
 *   @*
dtype0
�
(gradients_2/SquaredDifference_3_grad/MulMul+gradients_2/SquaredDifference_3_grad/scalar2gradients_2/mul_10_grad/tuple/control_dependency_1*
T0
�
(gradients_2/SquaredDifference_3_grad/subSubStopGradient_1)critic/q/q2_encoding/extrinsic_q2/BiasAdd3^gradients_2/mul_10_grad/tuple/control_dependency_1^sac_policy_opt*
T0
�
*gradients_2/SquaredDifference_3_grad/mul_1Mul(gradients_2/SquaredDifference_3_grad/Mul(gradients_2/SquaredDifference_3_grad/sub*
T0
m
*gradients_2/SquaredDifference_3_grad/ShapeShapeStopGradient_1^sac_policy_opt*
T0*
out_type0
�
,gradients_2/SquaredDifference_3_grad/Shape_1Shape)critic/q/q2_encoding/extrinsic_q2/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/SquaredDifference_3_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_3_grad/Shape,gradients_2/SquaredDifference_3_grad/Shape_1*
T0
�
(gradients_2/SquaredDifference_3_grad/SumSum*gradients_2/SquaredDifference_3_grad/mul_1:gradients_2/SquaredDifference_3_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_2/SquaredDifference_3_grad/ReshapeReshape(gradients_2/SquaredDifference_3_grad/Sum*gradients_2/SquaredDifference_3_grad/Shape*
T0*
Tshape0
�
*gradients_2/SquaredDifference_3_grad/Sum_1Sum*gradients_2/SquaredDifference_3_grad/mul_1<gradients_2/SquaredDifference_3_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_2/SquaredDifference_3_grad/Reshape_1Reshape*gradients_2/SquaredDifference_3_grad/Sum_1,gradients_2/SquaredDifference_3_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_3_grad/NegNeg.gradients_2/SquaredDifference_3_grad/Reshape_1*
T0
�
5gradients_2/SquaredDifference_3_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_3_grad/Neg-^gradients_2/SquaredDifference_3_grad/Reshape^sac_policy_opt
�
=gradients_2/SquaredDifference_3_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_3_grad/Reshape6^gradients_2/SquaredDifference_3_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_3_grad/Reshape
�
?gradients_2/SquaredDifference_3_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_3_grad/Neg6^gradients_2/SquaredDifference_3_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_3_grad/Neg
�
+gradients_2/SquaredDifference_5_grad/scalarConst3^gradients_2/mul_17_grad/tuple/control_dependency_1^sac_policy_opt*
valueB
 *   @*
dtype0
�
(gradients_2/SquaredDifference_5_grad/MulMul+gradients_2/SquaredDifference_5_grad/scalar2gradients_2/mul_17_grad/tuple/control_dependency_1*
T0
�
(gradients_2/SquaredDifference_5_grad/subSubStopGradient_2)critic/q/q2_encoding/curiosity_q2/BiasAdd3^gradients_2/mul_17_grad/tuple/control_dependency_1^sac_policy_opt*
T0
�
*gradients_2/SquaredDifference_5_grad/mul_1Mul(gradients_2/SquaredDifference_5_grad/Mul(gradients_2/SquaredDifference_5_grad/sub*
T0
m
*gradients_2/SquaredDifference_5_grad/ShapeShapeStopGradient_2^sac_policy_opt*
T0*
out_type0
�
,gradients_2/SquaredDifference_5_grad/Shape_1Shape)critic/q/q2_encoding/curiosity_q2/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/SquaredDifference_5_grad/BroadcastGradientArgsBroadcastGradientArgs*gradients_2/SquaredDifference_5_grad/Shape,gradients_2/SquaredDifference_5_grad/Shape_1*
T0
�
(gradients_2/SquaredDifference_5_grad/SumSum*gradients_2/SquaredDifference_5_grad/mul_1:gradients_2/SquaredDifference_5_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
,gradients_2/SquaredDifference_5_grad/ReshapeReshape(gradients_2/SquaredDifference_5_grad/Sum*gradients_2/SquaredDifference_5_grad/Shape*
T0*
Tshape0
�
*gradients_2/SquaredDifference_5_grad/Sum_1Sum*gradients_2/SquaredDifference_5_grad/mul_1<gradients_2/SquaredDifference_5_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
.gradients_2/SquaredDifference_5_grad/Reshape_1Reshape*gradients_2/SquaredDifference_5_grad/Sum_1,gradients_2/SquaredDifference_5_grad/Shape_1*
T0*
Tshape0
h
(gradients_2/SquaredDifference_5_grad/NegNeg.gradients_2/SquaredDifference_5_grad/Reshape_1*
T0
�
5gradients_2/SquaredDifference_5_grad/tuple/group_depsNoOp)^gradients_2/SquaredDifference_5_grad/Neg-^gradients_2/SquaredDifference_5_grad/Reshape^sac_policy_opt
�
=gradients_2/SquaredDifference_5_grad/tuple/control_dependencyIdentity,gradients_2/SquaredDifference_5_grad/Reshape6^gradients_2/SquaredDifference_5_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_5_grad/Reshape
�
?gradients_2/SquaredDifference_5_grad/tuple/control_dependency_1Identity(gradients_2/SquaredDifference_5_grad/Neg6^gradients_2/SquaredDifference_5_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_5_grad/Neg
�
Agradients_2/critic/value/extrinsic_value/BiasAdd_grad/BiasAddGradBiasAddGrad=gradients_2/SquaredDifference_6_grad/tuple/control_dependency*
T0*
data_formatNHWC
�
Fgradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/group_depsNoOp>^gradients_2/SquaredDifference_6_grad/tuple/control_dependencyB^gradients_2/critic/value/extrinsic_value/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Ngradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/control_dependencyIdentity=gradients_2/SquaredDifference_6_grad/tuple/control_dependencyG^gradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_6_grad/Reshape
�
Pgradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1IdentityAgradients_2/critic/value/extrinsic_value/BiasAdd_grad/BiasAddGradG^gradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients_2/critic/value/extrinsic_value/BiasAdd_grad/BiasAddGrad
�
Agradients_2/critic/value/curiosity_value/BiasAdd_grad/BiasAddGradBiasAddGrad=gradients_2/SquaredDifference_7_grad/tuple/control_dependency*
T0*
data_formatNHWC
�
Fgradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/group_depsNoOp>^gradients_2/SquaredDifference_7_grad/tuple/control_dependencyB^gradients_2/critic/value/curiosity_value/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Ngradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/control_dependencyIdentity=gradients_2/SquaredDifference_7_grad/tuple/control_dependencyG^gradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*?
_class5
31loc:@gradients_2/SquaredDifference_7_grad/Reshape
�
Pgradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/control_dependency_1IdentityAgradients_2/critic/value/curiosity_value/BiasAdd_grad/BiasAddGradG^gradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/group_deps*
T0*T
_classJ
HFloc:@gradients_2/critic/value/curiosity_value/BiasAdd_grad/BiasAddGrad
�
Fgradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/BiasAddGradBiasAddGrad?gradients_2/SquaredDifference_2_grad/tuple/control_dependency_1*
T0*
data_formatNHWC
�
Kgradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/group_depsNoOp@^gradients_2/SquaredDifference_2_grad/tuple/control_dependency_1G^gradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Sgradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/control_dependencyIdentity?gradients_2/SquaredDifference_2_grad/tuple/control_dependency_1L^gradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_2_grad/Neg
�
Ugradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/control_dependency_1IdentityFgradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/BiasAddGradL^gradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/BiasAddGrad
�
Fgradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/BiasAddGradBiasAddGrad?gradients_2/SquaredDifference_4_grad/tuple/control_dependency_1*
T0*
data_formatNHWC
�
Kgradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/group_depsNoOp@^gradients_2/SquaredDifference_4_grad/tuple/control_dependency_1G^gradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Sgradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/control_dependencyIdentity?gradients_2/SquaredDifference_4_grad/tuple/control_dependency_1L^gradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_4_grad/Neg
�
Ugradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/control_dependency_1IdentityFgradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/BiasAddGradL^gradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/BiasAddGrad
�
Fgradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/BiasAddGradBiasAddGrad?gradients_2/SquaredDifference_3_grad/tuple/control_dependency_1*
T0*
data_formatNHWC
�
Kgradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/group_depsNoOp@^gradients_2/SquaredDifference_3_grad/tuple/control_dependency_1G^gradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Sgradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/control_dependencyIdentity?gradients_2/SquaredDifference_3_grad/tuple/control_dependency_1L^gradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_3_grad/Neg
�
Ugradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/control_dependency_1IdentityFgradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/BiasAddGradL^gradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/BiasAddGrad
�
Fgradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/BiasAddGradBiasAddGrad?gradients_2/SquaredDifference_5_grad/tuple/control_dependency_1*
T0*
data_formatNHWC
�
Kgradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/group_depsNoOp@^gradients_2/SquaredDifference_5_grad/tuple/control_dependency_1G^gradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Sgradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/control_dependencyIdentity?gradients_2/SquaredDifference_5_grad/tuple/control_dependency_1L^gradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/group_deps*
T0*;
_class1
/-loc:@gradients_2/SquaredDifference_5_grad/Neg
�
Ugradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/control_dependency_1IdentityFgradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/BiasAddGradL^gradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/group_deps*
T0*Y
_classO
MKloc:@gradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/BiasAddGrad
�
;gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMulMatMulNgradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/control_dependency(critic/value/extrinsic_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
=gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMul_1MatMul!critic/value/encoder/hidden_3/MulNgradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Egradients_2/critic/value/extrinsic_value/MatMul_grad/tuple/group_depsNoOp<^gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMul>^gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMul_1^sac_policy_opt
�
Mgradients_2/critic/value/extrinsic_value/MatMul_grad/tuple/control_dependencyIdentity;gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMulF^gradients_2/critic/value/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMul
�
Ogradients_2/critic/value/extrinsic_value/MatMul_grad/tuple/control_dependency_1Identity=gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMul_1F^gradients_2/critic/value/extrinsic_value/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMul_1
�
;gradients_2/critic/value/curiosity_value/MatMul_grad/MatMulMatMulNgradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/control_dependency(critic/value/curiosity_value/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
=gradients_2/critic/value/curiosity_value/MatMul_grad/MatMul_1MatMul!critic/value/encoder/hidden_3/MulNgradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Egradients_2/critic/value/curiosity_value/MatMul_grad/tuple/group_depsNoOp<^gradients_2/critic/value/curiosity_value/MatMul_grad/MatMul>^gradients_2/critic/value/curiosity_value/MatMul_grad/MatMul_1^sac_policy_opt
�
Mgradients_2/critic/value/curiosity_value/MatMul_grad/tuple/control_dependencyIdentity;gradients_2/critic/value/curiosity_value/MatMul_grad/MatMulF^gradients_2/critic/value/curiosity_value/MatMul_grad/tuple/group_deps*
T0*N
_classD
B@loc:@gradients_2/critic/value/curiosity_value/MatMul_grad/MatMul
�
Ogradients_2/critic/value/curiosity_value/MatMul_grad/tuple/control_dependency_1Identity=gradients_2/critic/value/curiosity_value/MatMul_grad/MatMul_1F^gradients_2/critic/value/curiosity_value/MatMul_grad/tuple/group_deps*
T0*P
_classF
DBloc:@gradients_2/critic/value/curiosity_value/MatMul_grad/MatMul_1
�
@gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMulMatMulSgradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/control_dependency-critic/q/q1_encoding/extrinsic_q1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Bgradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMul_1MatMul,critic/q/q1_encoding/q1_encoder/hidden_3/MulSgradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Jgradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/tuple/group_depsNoOpA^gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMulC^gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMul_1^sac_policy_opt
�
Rgradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/tuple/control_dependencyIdentity@gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMulK^gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMul
�
Tgradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/tuple/control_dependency_1IdentityBgradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMul_1K^gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMul_1
�
@gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMulMatMulSgradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/control_dependency-critic/q/q1_encoding/curiosity_q1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Bgradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMul_1MatMul,critic/q/q1_encoding/q1_encoder/hidden_3/MulSgradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Jgradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/tuple/group_depsNoOpA^gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMulC^gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMul_1^sac_policy_opt
�
Rgradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/tuple/control_dependencyIdentity@gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMulK^gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMul
�
Tgradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/tuple/control_dependency_1IdentityBgradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMul_1K^gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/MatMul_1
�
@gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMulMatMulSgradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/control_dependency-critic/q/q2_encoding/extrinsic_q2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Bgradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMul_1MatMul,critic/q/q2_encoding/q2_encoder/hidden_3/MulSgradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Jgradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/tuple/group_depsNoOpA^gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMulC^gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMul_1^sac_policy_opt
�
Rgradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/tuple/control_dependencyIdentity@gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMulK^gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMul
�
Tgradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/tuple/control_dependency_1IdentityBgradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMul_1K^gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMul_1
�
@gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMulMatMulSgradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/control_dependency-critic/q/q2_encoding/curiosity_q2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Bgradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMul_1MatMul,critic/q/q2_encoding/q2_encoder/hidden_3/MulSgradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Jgradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/tuple/group_depsNoOpA^gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMulC^gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMul_1^sac_policy_opt
�
Rgradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/tuple/control_dependencyIdentity@gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMulK^gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/tuple/group_deps*
T0*S
_classI
GEloc:@gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMul
�
Tgradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/tuple/control_dependency_1IdentityBgradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMul_1K^gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/MatMul_1
�
gradients_2/AddNAddNMgradients_2/critic/value/extrinsic_value/MatMul_grad/tuple/control_dependencyMgradients_2/critic/value/curiosity_value/MatMul_grad/tuple/control_dependency*
T0*N
_classD
B@loc:@gradients_2/critic/value/extrinsic_value/MatMul_grad/MatMul*
N
�
8gradients_2/critic/value/encoder/hidden_3/Mul_grad/ShapeShape%critic/value/encoder/hidden_3/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/critic/value/encoder/hidden_3/Mul_grad/Shape_1Shape%critic/value/encoder/hidden_3/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Hgradients_2/critic/value/encoder/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs8gradients_2/critic/value/encoder/hidden_3/Mul_grad/Shape:gradients_2/critic/value/encoder/hidden_3/Mul_grad/Shape_1*
T0

6gradients_2/critic/value/encoder/hidden_3/Mul_grad/MulMulgradients_2/AddN%critic/value/encoder/hidden_3/Sigmoid*
T0
�
6gradients_2/critic/value/encoder/hidden_3/Mul_grad/SumSum6gradients_2/critic/value/encoder/hidden_3/Mul_grad/MulHgradients_2/critic/value/encoder/hidden_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
:gradients_2/critic/value/encoder/hidden_3/Mul_grad/ReshapeReshape6gradients_2/critic/value/encoder/hidden_3/Mul_grad/Sum8gradients_2/critic/value/encoder/hidden_3/Mul_grad/Shape*
T0*
Tshape0
�
8gradients_2/critic/value/encoder/hidden_3/Mul_grad/Mul_1Mul%critic/value/encoder/hidden_3/BiasAddgradients_2/AddN*
T0
�
8gradients_2/critic/value/encoder/hidden_3/Mul_grad/Sum_1Sum8gradients_2/critic/value/encoder/hidden_3/Mul_grad/Mul_1Jgradients_2/critic/value/encoder/hidden_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
<gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape_1Reshape8gradients_2/critic/value/encoder/hidden_3/Mul_grad/Sum_1:gradients_2/critic/value/encoder/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
�
Cgradients_2/critic/value/encoder/hidden_3/Mul_grad/tuple/group_depsNoOp;^gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape=^gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape_1^sac_policy_opt
�
Kgradients_2/critic/value/encoder/hidden_3/Mul_grad/tuple/control_dependencyIdentity:gradients_2/critic/value/encoder/hidden_3/Mul_grad/ReshapeD^gradients_2/critic/value/encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape
�
Mgradients_2/critic/value/encoder/hidden_3/Mul_grad/tuple/control_dependency_1Identity<gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape_1D^gradients_2/critic/value/encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape_1
�
gradients_2/AddN_1AddNRgradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/tuple/control_dependencyRgradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/tuple/control_dependency*
T0*S
_classI
GEloc:@gradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/MatMul*
N
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/ShapeShape0critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Shape_1Shape0critic/q/q1_encoding/q1_encoder/hidden_3/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/ShapeEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/MulMulgradients_2/AddN_10critic/q/q1_encoding/q1_encoder/hidden_3/Sigmoid*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/SumSumAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/MulSgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Mul_1Mul0critic/q/q1_encoding/q1_encoder/hidden_3/BiasAddgradients_2/AddN_1*
T0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Sum_1SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Mul_1Ugradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Sum_1Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/ReshapeH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/ReshapeO^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Reshape
�
Xgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Reshape_1O^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Reshape_1
�
gradients_2/AddN_2AddNRgradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/tuple/control_dependencyRgradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/tuple/control_dependency*
T0*S
_classI
GEloc:@gradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/MatMul*
N
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/ShapeShape0critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Shape_1Shape0critic/q/q2_encoding/q2_encoder/hidden_3/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/ShapeEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/MulMulgradients_2/AddN_20critic/q/q2_encoding/q2_encoder/hidden_3/Sigmoid*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/SumSumAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/MulSgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Mul_1Mul0critic/q/q2_encoding/q2_encoder/hidden_3/BiasAddgradients_2/AddN_2*
T0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Sum_1SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Mul_1Ugradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Sum_1Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/ReshapeH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/ReshapeO^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Reshape
�
Xgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Reshape_1O^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Reshape_1
�
Bgradients_2/critic/value/encoder/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGrad%critic/value/encoder/hidden_3/SigmoidMgradients_2/critic/value/encoder/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q1_encoding/q1_encoder/hidden_3/SigmoidXgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q2_encoding/q2_encoder/hidden_3/SigmoidXgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_2/AddN_3AddNKgradients_2/critic/value/encoder/hidden_3/Mul_grad/tuple/control_dependencyBgradients_2/critic/value/encoder/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape*
N
�
Bgradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_3*
T0*
data_formatNHWC
�
Ggradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_3C^gradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Ogradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_3H^gradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_3/Mul_grad/Reshape
�
Qgradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/control_dependency_1IdentityBgradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/BiasAddGradH^gradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_4AddNVgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_4*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_4N^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_4S^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/Mul_grad/Reshape
�
\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_5AddNVgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_5*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_5N^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_5S^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/Mul_grad/Reshape
�
\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/BiasAddGrad
�
<gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMulMatMulOgradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/control_dependency)critic/value/encoder/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
>gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMul_1MatMul!critic/value/encoder/hidden_2/MulOgradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Fgradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/group_depsNoOp=^gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMul?^gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMul_1^sac_policy_opt
�
Ngradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/control_dependencyIdentity<gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMulG^gradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMul
�
Pgradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/control_dependency_1Identity>gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMul_1G^gradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@gradients_2/critic/value/encoder/hidden_3/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMul_1MatMul,critic/q/q1_encoding/q1_encoder/hidden_2/MulZgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMulJ^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMulR^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMul
�
[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMul_1R^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency4critic/q/q2_encoding/q2_encoder/hidden_3/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMul_1MatMul,critic/q/q2_encoding/q2_encoder/hidden_2/MulZgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMulJ^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMulR^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMul
�
[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMul_1R^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/MatMul_1
�
8gradients_2/critic/value/encoder/hidden_2/Mul_grad/ShapeShape%critic/value/encoder/hidden_2/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/critic/value/encoder/hidden_2/Mul_grad/Shape_1Shape%critic/value/encoder/hidden_2/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Hgradients_2/critic/value/encoder/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs8gradients_2/critic/value/encoder/hidden_2/Mul_grad/Shape:gradients_2/critic/value/encoder/hidden_2/Mul_grad/Shape_1*
T0
�
6gradients_2/critic/value/encoder/hidden_2/Mul_grad/MulMulNgradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/control_dependency%critic/value/encoder/hidden_2/Sigmoid*
T0
�
6gradients_2/critic/value/encoder/hidden_2/Mul_grad/SumSum6gradients_2/critic/value/encoder/hidden_2/Mul_grad/MulHgradients_2/critic/value/encoder/hidden_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
:gradients_2/critic/value/encoder/hidden_2/Mul_grad/ReshapeReshape6gradients_2/critic/value/encoder/hidden_2/Mul_grad/Sum8gradients_2/critic/value/encoder/hidden_2/Mul_grad/Shape*
T0*
Tshape0
�
8gradients_2/critic/value/encoder/hidden_2/Mul_grad/Mul_1Mul%critic/value/encoder/hidden_2/BiasAddNgradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/control_dependency*
T0
�
8gradients_2/critic/value/encoder/hidden_2/Mul_grad/Sum_1Sum8gradients_2/critic/value/encoder/hidden_2/Mul_grad/Mul_1Jgradients_2/critic/value/encoder/hidden_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
<gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape_1Reshape8gradients_2/critic/value/encoder/hidden_2/Mul_grad/Sum_1:gradients_2/critic/value/encoder/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
�
Cgradients_2/critic/value/encoder/hidden_2/Mul_grad/tuple/group_depsNoOp;^gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape=^gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape_1^sac_policy_opt
�
Kgradients_2/critic/value/encoder/hidden_2/Mul_grad/tuple/control_dependencyIdentity:gradients_2/critic/value/encoder/hidden_2/Mul_grad/ReshapeD^gradients_2/critic/value/encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape
�
Mgradients_2/critic/value/encoder/hidden_2/Mul_grad/tuple/control_dependency_1Identity<gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape_1D^gradients_2/critic/value/encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape_1
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/ShapeShape0critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Shape_1Shape0critic/q/q1_encoding/q1_encoder/hidden_2/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/ShapeEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/MulMulYgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependency0critic/q/q1_encoding/q1_encoder/hidden_2/Sigmoid*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/SumSumAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/MulSgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Mul_1Mul0critic/q/q1_encoding/q1_encoder/hidden_2/BiasAddYgradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependency*
T0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Sum_1SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Mul_1Ugradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Sum_1Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/ReshapeH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/ReshapeO^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Reshape
�
Xgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Reshape_1O^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Reshape_1
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/ShapeShape0critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Shape_1Shape0critic/q/q2_encoding/q2_encoder/hidden_2/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/ShapeEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/MulMulYgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/control_dependency0critic/q/q2_encoding/q2_encoder/hidden_2/Sigmoid*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/SumSumAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/MulSgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Mul_1Mul0critic/q/q2_encoding/q2_encoder/hidden_2/BiasAddYgradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/control_dependency*
T0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Sum_1SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Mul_1Ugradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Sum_1Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/ReshapeH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/ReshapeO^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Reshape
�
Xgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Reshape_1O^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Reshape_1
�
Bgradients_2/critic/value/encoder/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGrad%critic/value/encoder/hidden_2/SigmoidMgradients_2/critic/value/encoder/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q1_encoding/q1_encoder/hidden_2/SigmoidXgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q2_encoding/q2_encoder/hidden_2/SigmoidXgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_2/AddN_6AddNKgradients_2/critic/value/encoder/hidden_2/Mul_grad/tuple/control_dependencyBgradients_2/critic/value/encoder/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape*
N
�
Bgradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_6*
T0*
data_formatNHWC
�
Ggradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_6C^gradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Ogradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_6H^gradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_2/Mul_grad/Reshape
�
Qgradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/control_dependency_1IdentityBgradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/BiasAddGradH^gradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_7AddNVgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_7*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_7N^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_7S^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/Mul_grad/Reshape
�
\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_8AddNVgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_8*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_8N^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_8S^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/Mul_grad/Reshape
�
\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/BiasAddGrad
�
<gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMulMatMulOgradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/control_dependency)critic/value/encoder/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
>gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMul_1MatMul!critic/value/encoder/hidden_1/MulOgradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Fgradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/group_depsNoOp=^gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMul?^gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMul_1^sac_policy_opt
�
Ngradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/control_dependencyIdentity<gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMulG^gradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMul
�
Pgradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/control_dependency_1Identity>gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMul_1G^gradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@gradients_2/critic/value/encoder/hidden_2/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMul_1MatMul,critic/q/q1_encoding/q1_encoder/hidden_1/MulZgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMulJ^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMulR^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMul
�
[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMul_1R^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency4critic/q/q2_encoding/q2_encoder/hidden_2/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMul_1MatMul,critic/q/q2_encoding/q2_encoder/hidden_1/MulZgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMulJ^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMulR^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMul
�
[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMul_1R^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/MatMul_1
�
8gradients_2/critic/value/encoder/hidden_1/Mul_grad/ShapeShape%critic/value/encoder/hidden_1/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/critic/value/encoder/hidden_1/Mul_grad/Shape_1Shape%critic/value/encoder/hidden_1/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Hgradients_2/critic/value/encoder/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs8gradients_2/critic/value/encoder/hidden_1/Mul_grad/Shape:gradients_2/critic/value/encoder/hidden_1/Mul_grad/Shape_1*
T0
�
6gradients_2/critic/value/encoder/hidden_1/Mul_grad/MulMulNgradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/control_dependency%critic/value/encoder/hidden_1/Sigmoid*
T0
�
6gradients_2/critic/value/encoder/hidden_1/Mul_grad/SumSum6gradients_2/critic/value/encoder/hidden_1/Mul_grad/MulHgradients_2/critic/value/encoder/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
:gradients_2/critic/value/encoder/hidden_1/Mul_grad/ReshapeReshape6gradients_2/critic/value/encoder/hidden_1/Mul_grad/Sum8gradients_2/critic/value/encoder/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
8gradients_2/critic/value/encoder/hidden_1/Mul_grad/Mul_1Mul%critic/value/encoder/hidden_1/BiasAddNgradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/control_dependency*
T0
�
8gradients_2/critic/value/encoder/hidden_1/Mul_grad/Sum_1Sum8gradients_2/critic/value/encoder/hidden_1/Mul_grad/Mul_1Jgradients_2/critic/value/encoder/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
<gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape_1Reshape8gradients_2/critic/value/encoder/hidden_1/Mul_grad/Sum_1:gradients_2/critic/value/encoder/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Cgradients_2/critic/value/encoder/hidden_1/Mul_grad/tuple/group_depsNoOp;^gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape=^gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape_1^sac_policy_opt
�
Kgradients_2/critic/value/encoder/hidden_1/Mul_grad/tuple/control_dependencyIdentity:gradients_2/critic/value/encoder/hidden_1/Mul_grad/ReshapeD^gradients_2/critic/value/encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape
�
Mgradients_2/critic/value/encoder/hidden_1/Mul_grad/tuple/control_dependency_1Identity<gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape_1D^gradients_2/critic/value/encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape_1
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/ShapeShape0critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Shape_1Shape0critic/q/q1_encoding/q1_encoder/hidden_1/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/ShapeEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/MulMulYgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependency0critic/q/q1_encoding/q1_encoder/hidden_1/Sigmoid*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/SumSumAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/MulSgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Mul_1Mul0critic/q/q1_encoding/q1_encoder/hidden_1/BiasAddYgradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependency*
T0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Sum_1SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Mul_1Ugradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Sum_1Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/ReshapeH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/ReshapeO^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Reshape
�
Xgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Reshape_1O^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Reshape_1
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/ShapeShape0critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Shape_1Shape0critic/q/q2_encoding/q2_encoder/hidden_1/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/ShapeEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/MulMulYgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/control_dependency0critic/q/q2_encoding/q2_encoder/hidden_1/Sigmoid*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/SumSumAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/MulSgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Mul_1Mul0critic/q/q2_encoding/q2_encoder/hidden_1/BiasAddYgradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/control_dependency*
T0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Sum_1SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Mul_1Ugradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Sum_1Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/ReshapeH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/ReshapeO^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Reshape
�
Xgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Reshape_1O^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Reshape_1
�
Bgradients_2/critic/value/encoder/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad%critic/value/encoder/hidden_1/SigmoidMgradients_2/critic/value/encoder/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q1_encoding/q1_encoder/hidden_1/SigmoidXgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q2_encoding/q2_encoder/hidden_1/SigmoidXgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_2/AddN_9AddNKgradients_2/critic/value/encoder/hidden_1/Mul_grad/tuple/control_dependencyBgradients_2/critic/value/encoder/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape*
N
�
Bgradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_9*
T0*
data_formatNHWC
�
Ggradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_9C^gradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Ogradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_9H^gradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_1/Mul_grad/Reshape
�
Qgradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityBgradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/BiasAddGradH^gradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_10AddNVgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_10*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_10N^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_10S^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/Mul_grad/Reshape
�
\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_11AddNVgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_11*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_11N^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_11S^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/Mul_grad/Reshape
�
\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/BiasAddGrad
�
<gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMulMatMulOgradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/control_dependency)critic/value/encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
>gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMul_1MatMul!critic/value/encoder/hidden_0/MulOgradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Fgradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/group_depsNoOp=^gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMul?^gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMul_1^sac_policy_opt
�
Ngradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/control_dependencyIdentity<gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMulG^gradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMul
�
Pgradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/control_dependency_1Identity>gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMul_1G^gradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@gradients_2/critic/value/encoder/hidden_1/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMul_1MatMul,critic/q/q1_encoding/q1_encoder/hidden_0/MulZgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMulJ^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMulR^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMul
�
[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMul_1R^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency4critic/q/q2_encoding/q2_encoder/hidden_1/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMul_1MatMul,critic/q/q2_encoding/q2_encoder/hidden_0/MulZgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMulJ^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMulR^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMul
�
[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMul_1R^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/MatMul_1
�
8gradients_2/critic/value/encoder/hidden_0/Mul_grad/ShapeShape%critic/value/encoder/hidden_0/BiasAdd^sac_policy_opt*
T0*
out_type0
�
:gradients_2/critic/value/encoder/hidden_0/Mul_grad/Shape_1Shape%critic/value/encoder/hidden_0/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Hgradients_2/critic/value/encoder/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgs8gradients_2/critic/value/encoder/hidden_0/Mul_grad/Shape:gradients_2/critic/value/encoder/hidden_0/Mul_grad/Shape_1*
T0
�
6gradients_2/critic/value/encoder/hidden_0/Mul_grad/MulMulNgradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/control_dependency%critic/value/encoder/hidden_0/Sigmoid*
T0
�
6gradients_2/critic/value/encoder/hidden_0/Mul_grad/SumSum6gradients_2/critic/value/encoder/hidden_0/Mul_grad/MulHgradients_2/critic/value/encoder/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
:gradients_2/critic/value/encoder/hidden_0/Mul_grad/ReshapeReshape6gradients_2/critic/value/encoder/hidden_0/Mul_grad/Sum8gradients_2/critic/value/encoder/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
8gradients_2/critic/value/encoder/hidden_0/Mul_grad/Mul_1Mul%critic/value/encoder/hidden_0/BiasAddNgradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
8gradients_2/critic/value/encoder/hidden_0/Mul_grad/Sum_1Sum8gradients_2/critic/value/encoder/hidden_0/Mul_grad/Mul_1Jgradients_2/critic/value/encoder/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
<gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape_1Reshape8gradients_2/critic/value/encoder/hidden_0/Mul_grad/Sum_1:gradients_2/critic/value/encoder/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Cgradients_2/critic/value/encoder/hidden_0/Mul_grad/tuple/group_depsNoOp;^gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape=^gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape_1^sac_policy_opt
�
Kgradients_2/critic/value/encoder/hidden_0/Mul_grad/tuple/control_dependencyIdentity:gradients_2/critic/value/encoder/hidden_0/Mul_grad/ReshapeD^gradients_2/critic/value/encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape
�
Mgradients_2/critic/value/encoder/hidden_0/Mul_grad/tuple/control_dependency_1Identity<gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape_1D^gradients_2/critic/value/encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape_1
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/ShapeShape0critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Shape_1Shape0critic/q/q1_encoding/q1_encoder/hidden_0/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/ShapeEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/MulMulYgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependency0critic/q/q1_encoding/q1_encoder/hidden_0/Sigmoid*
T0
�
Agradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/SumSumAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/MulSgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Mul_1Mul0critic/q/q1_encoding/q1_encoder/hidden_0/BiasAddYgradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
Cgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Sum_1SumCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Mul_1Ugradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Sum_1Egradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/ReshapeH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/ReshapeO^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Reshape
�
Xgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Reshape_1O^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Reshape_1
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/ShapeShape0critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd^sac_policy_opt*
T0*
out_type0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Shape_1Shape0critic/q/q2_encoding/q2_encoder/hidden_0/Sigmoid^sac_policy_opt*
T0*
out_type0
�
Sgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/BroadcastGradientArgsBroadcastGradientArgsCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/ShapeEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Shape_1*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/MulMulYgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/control_dependency0critic/q/q2_encoding/q2_encoder/hidden_0/Sigmoid*
T0
�
Agradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/SumSumAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/MulSgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
�
Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/ReshapeReshapeAgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Shape*
T0*
Tshape0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Mul_1Mul0critic/q/q2_encoding/q2_encoder/hidden_0/BiasAddYgradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/control_dependency*
T0
�
Cgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Sum_1SumCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Mul_1Ugradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Reshape_1ReshapeCgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Sum_1Egradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Shape_1*
T0*
Tshape0
�
Ngradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/tuple/group_depsNoOpF^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/ReshapeH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Reshape_1^sac_policy_opt
�
Vgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/tuple/control_dependencyIdentityEgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/ReshapeO^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Reshape
�
Xgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/tuple/control_dependency_1IdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Reshape_1O^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Reshape_1
�
Bgradients_2/critic/value/encoder/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad%critic/value/encoder/hidden_0/SigmoidMgradients_2/critic/value/encoder/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q1_encoding/q1_encoder/hidden_0/SigmoidXgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Sigmoid_grad/SigmoidGradSigmoidGrad0critic/q/q2_encoding/q2_encoder/hidden_0/SigmoidXgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/tuple/control_dependency_1*
T0
�
gradients_2/AddN_12AddNKgradients_2/critic/value/encoder/hidden_0/Mul_grad/tuple/control_dependencyBgradients_2/critic/value/encoder/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape*
N
�
Bgradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_12*
T0*
data_formatNHWC
�
Ggradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_12C^gradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Ogradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_12H^gradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*M
_classC
A?loc:@gradients_2/critic/value/encoder/hidden_0/Mul_grad/Reshape
�
Qgradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityBgradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/BiasAddGradH^gradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*U
_classK
IGloc:@gradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_13AddNVgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_13*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_13N^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_13S^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/Mul_grad/Reshape
�
\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
gradients_2/AddN_14AddNVgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/tuple/control_dependencyMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Sigmoid_grad/SigmoidGrad*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Reshape*
N
�
Mgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/BiasAddGradBiasAddGradgradients_2/AddN_14*
T0*
data_formatNHWC
�
Rgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/group_depsNoOp^gradients_2/AddN_14N^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/BiasAddGrad^sac_policy_opt
�
Zgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/control_dependencyIdentitygradients_2/AddN_14S^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*X
_classN
LJloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/Mul_grad/Reshape
�
\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1IdentityMgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/BiasAddGradS^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/group_deps*
T0*`
_classV
TRloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/BiasAddGrad
�
<gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMulMatMulOgradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/control_dependency)critic/value/encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
>gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMul_1MatMulnormalized_stateOgradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Fgradients_2/critic/value/encoder/hidden_0/MatMul_grad/tuple/group_depsNoOp=^gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMul?^gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMul_1^sac_policy_opt
�
Ngradients_2/critic/value/encoder/hidden_0/MatMul_grad/tuple/control_dependencyIdentity<gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMulG^gradients_2/critic/value/encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*O
_classE
CAloc:@gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMul
�
Pgradients_2/critic/value/encoder/hidden_0/MatMul_grad/tuple/control_dependency_1Identity>gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMul_1G^gradients_2/critic/value/encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*Q
_classG
ECloc:@gradients_2/critic/value/encoder/hidden_0/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency4critic/q/q1_encoding/q1_encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMul_1MatMulconcat_4Zgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMulJ^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMulR^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMul
�
[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMul_1R^gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/MatMul_1
�
Ggradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMulMatMulZgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency4critic/q/q2_encoding/q2_encoder/hidden_0/kernel/read*
transpose_b(*
T0*
transpose_a( 
�
Igradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMul_1MatMulconcat_4Zgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency*
transpose_b( *
T0*
transpose_a(
�
Qgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/tuple/group_depsNoOpH^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMulJ^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMul_1^sac_policy_opt
�
Ygradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/tuple/control_dependencyIdentityGgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMulR^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*Z
_classP
NLloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMul
�
[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1IdentityIgradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMul_1R^gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/tuple/group_deps*
T0*\
_classR
PNloc:@gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/MatMul_1
�
beta1_power_2/initial_valueConst*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
valueB
 *fff?*
dtype0
�
beta1_power_2
VariableV2*
shape: *
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
dtype0*
	container 
�
beta1_power_2/AssignAssignbeta1_power_2beta1_power_2/initial_value*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
q
beta1_power_2/readIdentitybeta1_power_2*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias
�
beta2_power_2/initial_valueConst*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
valueB
 *w�?*
dtype0
�
beta2_power_2
VariableV2*
shape: *
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
dtype0*
	container 
�
beta2_power_2/AssignAssignbeta2_power_2beta2_power_2/initial_value*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
q
beta2_power_2/readIdentitybeta2_power_2*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias
�
Tcritic/value/encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"N      *7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0
�
Jcritic/value/encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0
�
Dcritic/value/encoder/hidden_0/kernel/sac_value_opt/Initializer/zerosFillTcritic/value/encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorJcritic/value/encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel
�
2critic/value/encoder/hidden_0/kernel/sac_value_opt
VariableV2*
shape:	N�*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0*
	container 
�
9critic/value/encoder/hidden_0/kernel/sac_value_opt/AssignAssign2critic/value/encoder/hidden_0/kernel/sac_value_optDcritic/value/encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
validate_shape(
�
7critic/value/encoder/hidden_0/kernel/sac_value_opt/readIdentity2critic/value/encoder/hidden_0/kernel/sac_value_opt*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel
�
Vcritic/value/encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"N      *7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0
�
Lcritic/value/encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0
�
Fcritic/value/encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zerosFillVcritic/value/encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorLcritic/value/encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel
�
4critic/value/encoder/hidden_0/kernel/sac_value_opt_1
VariableV2*
shape:	N�*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
dtype0*
	container 
�
;critic/value/encoder/hidden_0/kernel/sac_value_opt_1/AssignAssign4critic/value/encoder/hidden_0/kernel/sac_value_opt_1Fcritic/value/encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
validate_shape(
�
9critic/value/encoder/hidden_0/kernel/sac_value_opt_1/readIdentity4critic/value/encoder/hidden_0/kernel/sac_value_opt_1*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel
�
Bcritic/value/encoder/hidden_0/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
dtype0
�
0critic/value/encoder/hidden_0/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
dtype0*
	container 
�
7critic/value/encoder/hidden_0/bias/sac_value_opt/AssignAssign0critic/value/encoder/hidden_0/bias/sac_value_optBcritic/value/encoder/hidden_0/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
validate_shape(
�
5critic/value/encoder/hidden_0/bias/sac_value_opt/readIdentity0critic/value/encoder/hidden_0/bias/sac_value_opt*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias
�
Dcritic/value/encoder/hidden_0/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
dtype0
�
2critic/value/encoder/hidden_0/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
dtype0*
	container 
�
9critic/value/encoder/hidden_0/bias/sac_value_opt_1/AssignAssign2critic/value/encoder/hidden_0/bias/sac_value_opt_1Dcritic/value/encoder/hidden_0/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
validate_shape(
�
7critic/value/encoder/hidden_0/bias/sac_value_opt_1/readIdentity2critic/value/encoder/hidden_0/bias/sac_value_opt_1*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias
�
Tcritic/value/encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0
�
Jcritic/value/encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0
�
Dcritic/value/encoder/hidden_1/kernel/sac_value_opt/Initializer/zerosFillTcritic/value/encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorJcritic/value/encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel
�
2critic/value/encoder/hidden_1/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0*
	container 
�
9critic/value/encoder/hidden_1/kernel/sac_value_opt/AssignAssign2critic/value/encoder/hidden_1/kernel/sac_value_optDcritic/value/encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
validate_shape(
�
7critic/value/encoder/hidden_1/kernel/sac_value_opt/readIdentity2critic/value/encoder/hidden_1/kernel/sac_value_opt*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel
�
Vcritic/value/encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0
�
Lcritic/value/encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0
�
Fcritic/value/encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zerosFillVcritic/value/encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorLcritic/value/encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel
�
4critic/value/encoder/hidden_1/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
dtype0*
	container 
�
;critic/value/encoder/hidden_1/kernel/sac_value_opt_1/AssignAssign4critic/value/encoder/hidden_1/kernel/sac_value_opt_1Fcritic/value/encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
validate_shape(
�
9critic/value/encoder/hidden_1/kernel/sac_value_opt_1/readIdentity4critic/value/encoder/hidden_1/kernel/sac_value_opt_1*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel
�
Bcritic/value/encoder/hidden_1/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
dtype0
�
0critic/value/encoder/hidden_1/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
dtype0*
	container 
�
7critic/value/encoder/hidden_1/bias/sac_value_opt/AssignAssign0critic/value/encoder/hidden_1/bias/sac_value_optBcritic/value/encoder/hidden_1/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
validate_shape(
�
5critic/value/encoder/hidden_1/bias/sac_value_opt/readIdentity0critic/value/encoder/hidden_1/bias/sac_value_opt*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias
�
Dcritic/value/encoder/hidden_1/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
dtype0
�
2critic/value/encoder/hidden_1/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
dtype0*
	container 
�
9critic/value/encoder/hidden_1/bias/sac_value_opt_1/AssignAssign2critic/value/encoder/hidden_1/bias/sac_value_opt_1Dcritic/value/encoder/hidden_1/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
validate_shape(
�
7critic/value/encoder/hidden_1/bias/sac_value_opt_1/readIdentity2critic/value/encoder/hidden_1/bias/sac_value_opt_1*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias
�
Tcritic/value/encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0
�
Jcritic/value/encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0
�
Dcritic/value/encoder/hidden_2/kernel/sac_value_opt/Initializer/zerosFillTcritic/value/encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorJcritic/value/encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel
�
2critic/value/encoder/hidden_2/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0*
	container 
�
9critic/value/encoder/hidden_2/kernel/sac_value_opt/AssignAssign2critic/value/encoder/hidden_2/kernel/sac_value_optDcritic/value/encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
validate_shape(
�
7critic/value/encoder/hidden_2/kernel/sac_value_opt/readIdentity2critic/value/encoder/hidden_2/kernel/sac_value_opt*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel
�
Vcritic/value/encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0
�
Lcritic/value/encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0
�
Fcritic/value/encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zerosFillVcritic/value/encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorLcritic/value/encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel
�
4critic/value/encoder/hidden_2/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
dtype0*
	container 
�
;critic/value/encoder/hidden_2/kernel/sac_value_opt_1/AssignAssign4critic/value/encoder/hidden_2/kernel/sac_value_opt_1Fcritic/value/encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
validate_shape(
�
9critic/value/encoder/hidden_2/kernel/sac_value_opt_1/readIdentity4critic/value/encoder/hidden_2/kernel/sac_value_opt_1*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel
�
Bcritic/value/encoder/hidden_2/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
dtype0
�
0critic/value/encoder/hidden_2/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
dtype0*
	container 
�
7critic/value/encoder/hidden_2/bias/sac_value_opt/AssignAssign0critic/value/encoder/hidden_2/bias/sac_value_optBcritic/value/encoder/hidden_2/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
validate_shape(
�
5critic/value/encoder/hidden_2/bias/sac_value_opt/readIdentity0critic/value/encoder/hidden_2/bias/sac_value_opt*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias
�
Dcritic/value/encoder/hidden_2/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
dtype0
�
2critic/value/encoder/hidden_2/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
dtype0*
	container 
�
9critic/value/encoder/hidden_2/bias/sac_value_opt_1/AssignAssign2critic/value/encoder/hidden_2/bias/sac_value_opt_1Dcritic/value/encoder/hidden_2/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
validate_shape(
�
7critic/value/encoder/hidden_2/bias/sac_value_opt_1/readIdentity2critic/value/encoder/hidden_2/bias/sac_value_opt_1*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias
�
Tcritic/value/encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0
�
Jcritic/value/encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0
�
Dcritic/value/encoder/hidden_3/kernel/sac_value_opt/Initializer/zerosFillTcritic/value/encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorJcritic/value/encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel
�
2critic/value/encoder/hidden_3/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0*
	container 
�
9critic/value/encoder/hidden_3/kernel/sac_value_opt/AssignAssign2critic/value/encoder/hidden_3/kernel/sac_value_optDcritic/value/encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
validate_shape(
�
7critic/value/encoder/hidden_3/kernel/sac_value_opt/readIdentity2critic/value/encoder/hidden_3/kernel/sac_value_opt*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel
�
Vcritic/value/encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0
�
Lcritic/value/encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0
�
Fcritic/value/encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zerosFillVcritic/value/encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorLcritic/value/encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel
�
4critic/value/encoder/hidden_3/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
dtype0*
	container 
�
;critic/value/encoder/hidden_3/kernel/sac_value_opt_1/AssignAssign4critic/value/encoder/hidden_3/kernel/sac_value_opt_1Fcritic/value/encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
validate_shape(
�
9critic/value/encoder/hidden_3/kernel/sac_value_opt_1/readIdentity4critic/value/encoder/hidden_3/kernel/sac_value_opt_1*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel
�
Bcritic/value/encoder/hidden_3/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
dtype0
�
0critic/value/encoder/hidden_3/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
dtype0*
	container 
�
7critic/value/encoder/hidden_3/bias/sac_value_opt/AssignAssign0critic/value/encoder/hidden_3/bias/sac_value_optBcritic/value/encoder/hidden_3/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
validate_shape(
�
5critic/value/encoder/hidden_3/bias/sac_value_opt/readIdentity0critic/value/encoder/hidden_3/bias/sac_value_opt*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias
�
Dcritic/value/encoder/hidden_3/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
dtype0
�
2critic/value/encoder/hidden_3/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
dtype0*
	container 
�
9critic/value/encoder/hidden_3/bias/sac_value_opt_1/AssignAssign2critic/value/encoder/hidden_3/bias/sac_value_opt_1Dcritic/value/encoder/hidden_3/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
validate_shape(
�
7critic/value/encoder/hidden_3/bias/sac_value_opt_1/readIdentity2critic/value/encoder/hidden_3/bias/sac_value_opt_1*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias
�
Ccritic/value/extrinsic_value/kernel/sac_value_opt/Initializer/zerosConst*
valueB	�*    *6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
dtype0
�
1critic/value/extrinsic_value/kernel/sac_value_opt
VariableV2*
shape:	�*
shared_name *6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
dtype0*
	container 
�
8critic/value/extrinsic_value/kernel/sac_value_opt/AssignAssign1critic/value/extrinsic_value/kernel/sac_value_optCcritic/value/extrinsic_value/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
validate_shape(
�
6critic/value/extrinsic_value/kernel/sac_value_opt/readIdentity1critic/value/extrinsic_value/kernel/sac_value_opt*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel
�
Ecritic/value/extrinsic_value/kernel/sac_value_opt_1/Initializer/zerosConst*
valueB	�*    *6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
dtype0
�
3critic/value/extrinsic_value/kernel/sac_value_opt_1
VariableV2*
shape:	�*
shared_name *6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
dtype0*
	container 
�
:critic/value/extrinsic_value/kernel/sac_value_opt_1/AssignAssign3critic/value/extrinsic_value/kernel/sac_value_opt_1Ecritic/value/extrinsic_value/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
validate_shape(
�
8critic/value/extrinsic_value/kernel/sac_value_opt_1/readIdentity3critic/value/extrinsic_value/kernel/sac_value_opt_1*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel
�
Acritic/value/extrinsic_value/bias/sac_value_opt/Initializer/zerosConst*
valueB*    *4
_class*
(&loc:@critic/value/extrinsic_value/bias*
dtype0
�
/critic/value/extrinsic_value/bias/sac_value_opt
VariableV2*
shape:*
shared_name *4
_class*
(&loc:@critic/value/extrinsic_value/bias*
dtype0*
	container 
�
6critic/value/extrinsic_value/bias/sac_value_opt/AssignAssign/critic/value/extrinsic_value/bias/sac_value_optAcritic/value/extrinsic_value/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
validate_shape(
�
4critic/value/extrinsic_value/bias/sac_value_opt/readIdentity/critic/value/extrinsic_value/bias/sac_value_opt*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias
�
Ccritic/value/extrinsic_value/bias/sac_value_opt_1/Initializer/zerosConst*
valueB*    *4
_class*
(&loc:@critic/value/extrinsic_value/bias*
dtype0
�
1critic/value/extrinsic_value/bias/sac_value_opt_1
VariableV2*
shape:*
shared_name *4
_class*
(&loc:@critic/value/extrinsic_value/bias*
dtype0*
	container 
�
8critic/value/extrinsic_value/bias/sac_value_opt_1/AssignAssign1critic/value/extrinsic_value/bias/sac_value_opt_1Ccritic/value/extrinsic_value/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
validate_shape(
�
6critic/value/extrinsic_value/bias/sac_value_opt_1/readIdentity1critic/value/extrinsic_value/bias/sac_value_opt_1*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias
�
Ccritic/value/curiosity_value/kernel/sac_value_opt/Initializer/zerosConst*
valueB	�*    *6
_class,
*(loc:@critic/value/curiosity_value/kernel*
dtype0
�
1critic/value/curiosity_value/kernel/sac_value_opt
VariableV2*
shape:	�*
shared_name *6
_class,
*(loc:@critic/value/curiosity_value/kernel*
dtype0*
	container 
�
8critic/value/curiosity_value/kernel/sac_value_opt/AssignAssign1critic/value/curiosity_value/kernel/sac_value_optCcritic/value/curiosity_value/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
validate_shape(
�
6critic/value/curiosity_value/kernel/sac_value_opt/readIdentity1critic/value/curiosity_value/kernel/sac_value_opt*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel
�
Ecritic/value/curiosity_value/kernel/sac_value_opt_1/Initializer/zerosConst*
valueB	�*    *6
_class,
*(loc:@critic/value/curiosity_value/kernel*
dtype0
�
3critic/value/curiosity_value/kernel/sac_value_opt_1
VariableV2*
shape:	�*
shared_name *6
_class,
*(loc:@critic/value/curiosity_value/kernel*
dtype0*
	container 
�
:critic/value/curiosity_value/kernel/sac_value_opt_1/AssignAssign3critic/value/curiosity_value/kernel/sac_value_opt_1Ecritic/value/curiosity_value/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
validate_shape(
�
8critic/value/curiosity_value/kernel/sac_value_opt_1/readIdentity3critic/value/curiosity_value/kernel/sac_value_opt_1*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel
�
Acritic/value/curiosity_value/bias/sac_value_opt/Initializer/zerosConst*
valueB*    *4
_class*
(&loc:@critic/value/curiosity_value/bias*
dtype0
�
/critic/value/curiosity_value/bias/sac_value_opt
VariableV2*
shape:*
shared_name *4
_class*
(&loc:@critic/value/curiosity_value/bias*
dtype0*
	container 
�
6critic/value/curiosity_value/bias/sac_value_opt/AssignAssign/critic/value/curiosity_value/bias/sac_value_optAcritic/value/curiosity_value/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias*
validate_shape(
�
4critic/value/curiosity_value/bias/sac_value_opt/readIdentity/critic/value/curiosity_value/bias/sac_value_opt*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias
�
Ccritic/value/curiosity_value/bias/sac_value_opt_1/Initializer/zerosConst*
valueB*    *4
_class*
(&loc:@critic/value/curiosity_value/bias*
dtype0
�
1critic/value/curiosity_value/bias/sac_value_opt_1
VariableV2*
shape:*
shared_name *4
_class*
(&loc:@critic/value/curiosity_value/bias*
dtype0*
	container 
�
8critic/value/curiosity_value/bias/sac_value_opt_1/AssignAssign1critic/value/curiosity_value/bias/sac_value_opt_1Ccritic/value/curiosity_value/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias*
validate_shape(
�
6critic/value/curiosity_value/bias/sac_value_opt_1/readIdentity1critic/value/curiosity_value/bias/sac_value_opt_1*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias
�
_critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"X      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0
�
Ucritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0
�
Ocritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel
�
=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt
VariableV2*
shape:	X�*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_optOcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel
�
acritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"X      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0
�
Wcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1
VariableV2*
shape:	X�*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
dtype0*
	container 
�
Fcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/AssignAssign?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1Qcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
validate_shape(
�
Dcritic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/readIdentity?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel
�
Mcritic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
dtype0
�
;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
dtype0*
	container 
�
Bcritic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt/AssignAssign;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_optMcritic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
validate_shape(
�
@critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt/readIdentity;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias
�
Ocritic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
dtype0
�
=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1Ocritic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias
�
_critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0
�
Ucritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0
�
Ocritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel
�
=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_optOcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel
�
acritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0
�
Wcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
dtype0*
	container 
�
Fcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/AssignAssign?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1Qcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
validate_shape(
�
Dcritic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/readIdentity?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel
�
Mcritic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
dtype0
�
;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
dtype0*
	container 
�
Bcritic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt/AssignAssign;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_optMcritic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
validate_shape(
�
@critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt/readIdentity;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias
�
Ocritic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
dtype0
�
=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1Ocritic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias
�
_critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0
�
Ucritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0
�
Ocritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel
�
=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_optOcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel
�
acritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0
�
Wcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
dtype0*
	container 
�
Fcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/AssignAssign?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1Qcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
validate_shape(
�
Dcritic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/readIdentity?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel
�
Mcritic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
dtype0
�
;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
dtype0*
	container 
�
Bcritic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt/AssignAssign;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_optMcritic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
validate_shape(
�
@critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt/readIdentity;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias
�
Ocritic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
dtype0
�
=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1Ocritic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias
�
_critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0
�
Ucritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0
�
Ocritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel
�
=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_optOcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel
�
acritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0
�
Wcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0
�
Qcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel
�
?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
dtype0*
	container 
�
Fcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/AssignAssign?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1Qcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
validate_shape(
�
Dcritic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/readIdentity?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel
�
Mcritic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
dtype0
�
;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
dtype0*
	container 
�
Bcritic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt/AssignAssign;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_optMcritic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
validate_shape(
�
@critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt/readIdentity;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias
�
Ocritic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
dtype0
�
=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
dtype0*
	container 
�
Dcritic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1/AssignAssign=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1Ocritic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
validate_shape(
�
Bcritic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1/readIdentity=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias
�
Hcritic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
dtype0
�
6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
dtype0*
	container 
�
=critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt/AssignAssign6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_optHcritic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
validate_shape(
�
;critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt/readIdentity6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel
�
Jcritic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
dtype0
�
8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
dtype0*
	container 
�
?critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1/AssignAssign8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1Jcritic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
validate_shape(
�
=critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1/readIdentity8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel
�
Fcritic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
dtype0
�
4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
dtype0*
	container 
�
;critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt/AssignAssign4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_optFcritic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
validate_shape(
�
9critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt/readIdentity4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias
�
Hcritic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
dtype0
�
6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
dtype0*
	container 
�
=critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1/AssignAssign6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1Hcritic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
validate_shape(
�
;critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1/readIdentity6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias
�
Hcritic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
dtype0
�
6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
dtype0*
	container 
�
=critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt/AssignAssign6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_optHcritic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
validate_shape(
�
;critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt/readIdentity6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel
�
Jcritic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
dtype0
�
8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
dtype0*
	container 
�
?critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1/AssignAssign8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1Jcritic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
validate_shape(
�
=critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1/readIdentity8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel
�
Fcritic/q/q1_encoding/curiosity_q1/bias/sac_value_opt/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
dtype0
�
4critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
dtype0*
	container 
�
;critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt/AssignAssign4critic/q/q1_encoding/curiosity_q1/bias/sac_value_optFcritic/q/q1_encoding/curiosity_q1/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
9critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt/readIdentity4critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias
�
Hcritic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
dtype0
�
6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
dtype0*
	container 
�
=critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1/AssignAssign6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1Hcritic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
;critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1/readIdentity6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias
�
_critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"X      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0
�
Ucritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0
�
Ocritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel
�
=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt
VariableV2*
shape:	X�*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_optOcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel
�
acritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"X      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0
�
Wcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1
VariableV2*
shape:	X�*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
dtype0*
	container 
�
Fcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/AssignAssign?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1Qcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
validate_shape(
�
Dcritic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/readIdentity?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel
�
Mcritic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
dtype0
�
;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
dtype0*
	container 
�
Bcritic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt/AssignAssign;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_optMcritic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
validate_shape(
�
@critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt/readIdentity;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias
�
Ocritic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
dtype0
�
=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1Ocritic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias
�
_critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0
�
Ucritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0
�
Ocritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel
�
=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_optOcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel
�
acritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0
�
Wcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
dtype0*
	container 
�
Fcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/AssignAssign?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1Qcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
validate_shape(
�
Dcritic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/readIdentity?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel
�
Mcritic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
dtype0
�
;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
dtype0*
	container 
�
Bcritic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt/AssignAssign;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_optMcritic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
validate_shape(
�
@critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt/readIdentity;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias
�
Ocritic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
dtype0
�
=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1Ocritic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias
�
_critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0
�
Ucritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0
�
Ocritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel
�
=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_optOcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel
�
acritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0
�
Wcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
dtype0*
	container 
�
Fcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/AssignAssign?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1Qcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
validate_shape(
�
Dcritic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/readIdentity?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel
�
Mcritic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
dtype0
�
;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
dtype0*
	container 
�
Bcritic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt/AssignAssign;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_optMcritic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
validate_shape(
�
@critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt/readIdentity;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias
�
Ocritic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
dtype0
�
=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1Ocritic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias
�
_critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0
�
Ucritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0
�
Ocritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/Initializer/zerosFill_critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/shape_as_tensorUcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel
�
=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_optOcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel
�
acritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorConst*
valueB"      *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0
�
Wcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/ConstConst*
valueB
 *    *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0
�
Qcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zerosFillacritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/shape_as_tensorWcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros/Const*
T0*

index_type0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel
�
?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1
VariableV2*
shape:
��*
shared_name *B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
dtype0*
	container 
�
Fcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/AssignAssign?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1Qcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
validate_shape(
�
Dcritic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/readIdentity?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel
�
Mcritic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
dtype0
�
;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
dtype0*
	container 
�
Bcritic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt/AssignAssign;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_optMcritic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
validate_shape(
�
@critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt/readIdentity;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias
�
Ocritic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1/Initializer/zerosConst*
valueB�*    *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
dtype0
�
=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1
VariableV2*
shape:�*
shared_name *@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
dtype0*
	container 
�
Dcritic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1/AssignAssign=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1Ocritic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
validate_shape(
�
Bcritic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1/readIdentity=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias
�
Hcritic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
dtype0
�
6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
dtype0*
	container 
�
=critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt/AssignAssign6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_optHcritic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
validate_shape(
�
;critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt/readIdentity6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel
�
Jcritic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
dtype0
�
8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
dtype0*
	container 
�
?critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1/AssignAssign8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1Jcritic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
validate_shape(
�
=critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1/readIdentity8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel
�
Fcritic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
dtype0
�
4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
dtype0*
	container 
�
;critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt/AssignAssign4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_optFcritic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
validate_shape(
�
9critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt/readIdentity4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias
�
Hcritic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
dtype0
�
6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
dtype0*
	container 
�
=critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1/AssignAssign6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1Hcritic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
validate_shape(
�
;critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1/readIdentity6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias
�
Hcritic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
dtype0
�
6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
dtype0*
	container 
�
=critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt/AssignAssign6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_optHcritic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
validate_shape(
�
;critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt/readIdentity6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel
�
Jcritic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1/Initializer/zerosConst*
valueB	�*    *;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
dtype0
�
8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1
VariableV2*
shape:	�*
shared_name *;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
dtype0*
	container 
�
?critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1/AssignAssign8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1Jcritic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
validate_shape(
�
=critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1/readIdentity8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel
�
Fcritic/q/q2_encoding/curiosity_q2/bias/sac_value_opt/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
dtype0
�
4critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
dtype0*
	container 
�
;critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt/AssignAssign4critic/q/q2_encoding/curiosity_q2/bias/sac_value_optFcritic/q/q2_encoding/curiosity_q2/bias/sac_value_opt/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
validate_shape(
�
9critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt/readIdentity4critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias
�
Hcritic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1/Initializer/zerosConst*
valueB*    *9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
dtype0
�
6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1
VariableV2*
shape:*
shared_name *9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
dtype0*
	container 
�
=critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1/AssignAssign6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1Hcritic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1/Initializer/zeros*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
validate_shape(
�
;critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1/readIdentity6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias
Q
sac_value_opt/beta1Const^sac_policy_opt*
valueB
 *fff?*
dtype0
Q
sac_value_opt/beta2Const^sac_policy_opt*
valueB
 *w�?*
dtype0
S
sac_value_opt/epsilonConst^sac_policy_opt*
valueB
 *w�+2*
dtype0
�
Csac_value_opt/update_critic/value/encoder/hidden_0/kernel/ApplyAdam	ApplyAdam$critic/value/encoder/hidden_0/kernel2critic/value/encoder/hidden_0/kernel/sac_value_opt4critic/value/encoder/hidden_0/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonPgradients_2/critic/value/encoder/hidden_0/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
use_nesterov( 
�
Asac_value_opt/update_critic/value/encoder/hidden_0/bias/ApplyAdam	ApplyAdam"critic/value/encoder/hidden_0/bias0critic/value/encoder/hidden_0/bias/sac_value_opt2critic/value/encoder/hidden_0/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonQgradients_2/critic/value/encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
use_nesterov( 
�
Csac_value_opt/update_critic/value/encoder/hidden_1/kernel/ApplyAdam	ApplyAdam$critic/value/encoder/hidden_1/kernel2critic/value/encoder/hidden_1/kernel/sac_value_opt4critic/value/encoder/hidden_1/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonPgradients_2/critic/value/encoder/hidden_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
use_nesterov( 
�
Asac_value_opt/update_critic/value/encoder/hidden_1/bias/ApplyAdam	ApplyAdam"critic/value/encoder/hidden_1/bias0critic/value/encoder/hidden_1/bias/sac_value_opt2critic/value/encoder/hidden_1/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonQgradients_2/critic/value/encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
use_nesterov( 
�
Csac_value_opt/update_critic/value/encoder/hidden_2/kernel/ApplyAdam	ApplyAdam$critic/value/encoder/hidden_2/kernel2critic/value/encoder/hidden_2/kernel/sac_value_opt4critic/value/encoder/hidden_2/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonPgradients_2/critic/value/encoder/hidden_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
use_nesterov( 
�
Asac_value_opt/update_critic/value/encoder/hidden_2/bias/ApplyAdam	ApplyAdam"critic/value/encoder/hidden_2/bias0critic/value/encoder/hidden_2/bias/sac_value_opt2critic/value/encoder/hidden_2/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonQgradients_2/critic/value/encoder/hidden_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
use_nesterov( 
�
Csac_value_opt/update_critic/value/encoder/hidden_3/kernel/ApplyAdam	ApplyAdam$critic/value/encoder/hidden_3/kernel2critic/value/encoder/hidden_3/kernel/sac_value_opt4critic/value/encoder/hidden_3/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonPgradients_2/critic/value/encoder/hidden_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
use_nesterov( 
�
Asac_value_opt/update_critic/value/encoder/hidden_3/bias/ApplyAdam	ApplyAdam"critic/value/encoder/hidden_3/bias0critic/value/encoder/hidden_3/bias/sac_value_opt2critic/value/encoder/hidden_3/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonQgradients_2/critic/value/encoder/hidden_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
use_nesterov( 
�
Bsac_value_opt/update_critic/value/extrinsic_value/kernel/ApplyAdam	ApplyAdam#critic/value/extrinsic_value/kernel1critic/value/extrinsic_value/kernel/sac_value_opt3critic/value/extrinsic_value/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonOgradients_2/critic/value/extrinsic_value/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
use_nesterov( 
�
@sac_value_opt/update_critic/value/extrinsic_value/bias/ApplyAdam	ApplyAdam!critic/value/extrinsic_value/bias/critic/value/extrinsic_value/bias/sac_value_opt1critic/value/extrinsic_value/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonPgradients_2/critic/value/extrinsic_value/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
use_nesterov( 
�
Bsac_value_opt/update_critic/value/curiosity_value/kernel/ApplyAdam	ApplyAdam#critic/value/curiosity_value/kernel1critic/value/curiosity_value/kernel/sac_value_opt3critic/value/curiosity_value/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonOgradients_2/critic/value/curiosity_value/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
use_nesterov( 
�
@sac_value_opt/update_critic/value/curiosity_value/bias/ApplyAdam	ApplyAdam!critic/value/curiosity_value/bias/critic/value/curiosity_value/bias/sac_value_opt1critic/value/curiosity_value/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonPgradients_2/critic/value/curiosity_value/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/kernel/ApplyAdam	ApplyAdam/critic/q/q1_encoding/q1_encoder/hidden_0/kernel=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/bias/ApplyAdam	ApplyAdam-critic/q/q1_encoding/q1_encoder/hidden_0/bias;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/kernel/ApplyAdam	ApplyAdam/critic/q/q1_encoding/q1_encoder/hidden_1/kernel=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/bias/ApplyAdam	ApplyAdam-critic/q/q1_encoding/q1_encoder/hidden_1/bias;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/kernel/ApplyAdam	ApplyAdam/critic/q/q1_encoding/q1_encoder/hidden_2/kernel=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/bias/ApplyAdam	ApplyAdam-critic/q/q1_encoding/q1_encoder/hidden_2/bias;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/kernel/ApplyAdam	ApplyAdam/critic/q/q1_encoding/q1_encoder/hidden_3/kernel=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/bias/ApplyAdam	ApplyAdam-critic/q/q1_encoding/q1_encoder/hidden_3/bias;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q1_encoding/q1_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
use_nesterov( 
�
Gsac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/kernel/ApplyAdam	ApplyAdam(critic/q/q1_encoding/extrinsic_q1/kernel6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonTgradients_2/critic/q/q1_encoding/extrinsic_q1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
use_nesterov( 
�
Esac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/bias/ApplyAdam	ApplyAdam&critic/q/q1_encoding/extrinsic_q1/bias4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonUgradients_2/critic/q/q1_encoding/extrinsic_q1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
use_nesterov( 
�
Gsac_value_opt/update_critic/q/q1_encoding/curiosity_q1/kernel/ApplyAdam	ApplyAdam(critic/q/q1_encoding/curiosity_q1/kernel6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonTgradients_2/critic/q/q1_encoding/curiosity_q1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
use_nesterov( 
�
Esac_value_opt/update_critic/q/q1_encoding/curiosity_q1/bias/ApplyAdam	ApplyAdam&critic/q/q1_encoding/curiosity_q1/bias4critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonUgradients_2/critic/q/q1_encoding/curiosity_q1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/kernel/ApplyAdam	ApplyAdam/critic/q/q2_encoding/q2_encoder/hidden_0/kernel=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/bias/ApplyAdam	ApplyAdam-critic/q/q2_encoding/q2_encoder/hidden_0/bias;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_0/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/kernel/ApplyAdam	ApplyAdam/critic/q/q2_encoding/q2_encoder/hidden_1/kernel=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/bias/ApplyAdam	ApplyAdam-critic/q/q2_encoding/q2_encoder/hidden_1/bias;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_1/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/kernel/ApplyAdam	ApplyAdam/critic/q/q2_encoding/q2_encoder/hidden_2/kernel=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/bias/ApplyAdam	ApplyAdam-critic/q/q2_encoding/q2_encoder/hidden_2/bias;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
use_nesterov( 
�
Nsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/kernel/ApplyAdam	ApplyAdam/critic/q/q2_encoding/q2_encoder/hidden_3/kernel=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon[gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
use_nesterov( 
�
Lsac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/bias/ApplyAdam	ApplyAdam-critic/q/q2_encoding/q2_encoder/hidden_3/bias;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilon\gradients_2/critic/q/q2_encoding/q2_encoder/hidden_3/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
use_nesterov( 
�
Gsac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/kernel/ApplyAdam	ApplyAdam(critic/q/q2_encoding/extrinsic_q2/kernel6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonTgradients_2/critic/q/q2_encoding/extrinsic_q2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
use_nesterov( 
�
Esac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/bias/ApplyAdam	ApplyAdam&critic/q/q2_encoding/extrinsic_q2/bias4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonUgradients_2/critic/q/q2_encoding/extrinsic_q2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
use_nesterov( 
�
Gsac_value_opt/update_critic/q/q2_encoding/curiosity_q2/kernel/ApplyAdam	ApplyAdam(critic/q/q2_encoding/curiosity_q2/kernel6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonTgradients_2/critic/q/q2_encoding/curiosity_q2/MatMul_grad/tuple/control_dependency_1*
use_locking( *
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
use_nesterov( 
�
Esac_value_opt/update_critic/q/q2_encoding/curiosity_q2/bias/ApplyAdam	ApplyAdam&critic/q/q2_encoding/curiosity_q2/bias4critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1beta1_power_2/readbeta2_power_2/readVariable_2/readsac_value_opt/beta1sac_value_opt/beta2sac_value_opt/epsilonUgradients_2/critic/q/q2_encoding/curiosity_q2/BiasAdd_grad/tuple/control_dependency_1*
use_locking( *
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
use_nesterov( 
�
sac_value_opt/mulMulbeta1_power_2/readsac_value_opt/beta1F^sac_value_opt/update_critic/q/q1_encoding/curiosity_q1/bias/ApplyAdamH^sac_value_opt/update_critic/q/q1_encoding/curiosity_q1/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/bias/ApplyAdamH^sac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q2_encoding/curiosity_q2/bias/ApplyAdamH^sac_value_opt/update_critic/q/q2_encoding/curiosity_q2/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/bias/ApplyAdamH^sac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/kernel/ApplyAdamA^sac_value_opt/update_critic/value/curiosity_value/bias/ApplyAdamC^sac_value_opt/update_critic/value/curiosity_value/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_0/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_0/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_1/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_1/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_2/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_2/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_3/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_3/kernel/ApplyAdamA^sac_value_opt/update_critic/value/extrinsic_value/bias/ApplyAdamC^sac_value_opt/update_critic/value/extrinsic_value/kernel/ApplyAdam*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias
�
sac_value_opt/AssignAssignbeta1_power_2sac_value_opt/mul*
use_locking( *
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
sac_value_opt/mul_1Mulbeta2_power_2/readsac_value_opt/beta2F^sac_value_opt/update_critic/q/q1_encoding/curiosity_q1/bias/ApplyAdamH^sac_value_opt/update_critic/q/q1_encoding/curiosity_q1/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/bias/ApplyAdamH^sac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q2_encoding/curiosity_q2/bias/ApplyAdamH^sac_value_opt/update_critic/q/q2_encoding/curiosity_q2/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/bias/ApplyAdamH^sac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/kernel/ApplyAdamA^sac_value_opt/update_critic/value/curiosity_value/bias/ApplyAdamC^sac_value_opt/update_critic/value/curiosity_value/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_0/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_0/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_1/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_1/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_2/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_2/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_3/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_3/kernel/ApplyAdamA^sac_value_opt/update_critic/value/extrinsic_value/bias/ApplyAdamC^sac_value_opt/update_critic/value/extrinsic_value/kernel/ApplyAdam*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias
�
sac_value_opt/Assign_1Assignbeta2_power_2sac_value_opt/mul_1*
use_locking( *
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
sac_value_optNoOp^sac_policy_opt^sac_value_opt/Assign^sac_value_opt/Assign_1F^sac_value_opt/update_critic/q/q1_encoding/curiosity_q1/bias/ApplyAdamH^sac_value_opt/update_critic/q/q1_encoding/curiosity_q1/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/bias/ApplyAdamH^sac_value_opt/update_critic/q/q1_encoding/extrinsic_q1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_0/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/bias/ApplyAdamO^sac_value_opt/update_critic/q/q1_encoding/q1_encoder/hidden_3/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q2_encoding/curiosity_q2/bias/ApplyAdamH^sac_value_opt/update_critic/q/q2_encoding/curiosity_q2/kernel/ApplyAdamF^sac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/bias/ApplyAdamH^sac_value_opt/update_critic/q/q2_encoding/extrinsic_q2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_0/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_1/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_2/kernel/ApplyAdamM^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/bias/ApplyAdamO^sac_value_opt/update_critic/q/q2_encoding/q2_encoder/hidden_3/kernel/ApplyAdamA^sac_value_opt/update_critic/value/curiosity_value/bias/ApplyAdamC^sac_value_opt/update_critic/value/curiosity_value/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_0/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_0/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_1/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_1/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_2/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_2/kernel/ApplyAdamB^sac_value_opt/update_critic/value/encoder/hidden_3/bias/ApplyAdamD^sac_value_opt/update_critic/value/encoder/hidden_3/kernel/ApplyAdamA^sac_value_opt/update_critic/value/extrinsic_value/bias/ApplyAdamC^sac_value_opt/update_critic/value/extrinsic_value/kernel/ApplyAdam
[
gradients_3/ShapeConst^sac_policy_opt^sac_value_opt*
valueB *
dtype0
c
gradients_3/grad_ys_0Const^sac_policy_opt^sac_value_opt*
valueB
 *  �?*
dtype0
]
gradients_3/FillFillgradients_3/Shapegradients_3/grad_ys_0*
T0*

index_type0
:
gradients_3/Neg_grad/NegNeggradients_3/Fill*
T0
{
%gradients_3/Mean_8_grad/Reshape/shapeConst^sac_policy_opt^sac_value_opt*
valueB"      *
dtype0
�
gradients_3/Mean_8_grad/ReshapeReshapegradients_3/Neg_grad/Neg%gradients_3/Mean_8_grad/Reshape/shape*
T0*
Tshape0
h
gradients_3/Mean_8_grad/ShapeShapemul_20^sac_policy_opt^sac_value_opt*
T0*
out_type0

gradients_3/Mean_8_grad/TileTilegradients_3/Mean_8_grad/Reshapegradients_3/Mean_8_grad/Shape*

Tmultiples0*
T0
j
gradients_3/Mean_8_grad/Shape_1Shapemul_20^sac_policy_opt^sac_value_opt*
T0*
out_type0
i
gradients_3/Mean_8_grad/Shape_2Const^sac_policy_opt^sac_value_opt*
valueB *
dtype0
l
gradients_3/Mean_8_grad/ConstConst^sac_policy_opt^sac_value_opt*
valueB: *
dtype0
�
gradients_3/Mean_8_grad/ProdProdgradients_3/Mean_8_grad/Shape_1gradients_3/Mean_8_grad/Const*

Tidx0*
	keep_dims( *
T0
n
gradients_3/Mean_8_grad/Const_1Const^sac_policy_opt^sac_value_opt*
valueB: *
dtype0
�
gradients_3/Mean_8_grad/Prod_1Prodgradients_3/Mean_8_grad/Shape_2gradients_3/Mean_8_grad/Const_1*

Tidx0*
	keep_dims( *
T0
l
!gradients_3/Mean_8_grad/Maximum/yConst^sac_policy_opt^sac_value_opt*
value	B :*
dtype0
v
gradients_3/Mean_8_grad/MaximumMaximumgradients_3/Mean_8_grad/Prod_1!gradients_3/Mean_8_grad/Maximum/y*
T0
t
 gradients_3/Mean_8_grad/floordivFloorDivgradients_3/Mean_8_grad/Prodgradients_3/Mean_8_grad/Maximum*
T0
n
gradients_3/Mean_8_grad/CastCast gradients_3/Mean_8_grad/floordiv*

SrcT0*
Truncate( *

DstT0
o
gradients_3/Mean_8_grad/truedivRealDivgradients_3/Mean_8_grad/Tilegradients_3/Mean_8_grad/Cast*
T0
h
gradients_3/mul_20_grad/ShapeShapemul_19^sac_policy_opt^sac_value_opt*
T0*
out_type0
r
gradients_3/mul_20_grad/Shape_1ShapeStopGradient_3^sac_policy_opt^sac_value_opt*
T0*
out_type0
�
-gradients_3/mul_20_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/mul_20_grad/Shapegradients_3/mul_20_grad/Shape_1*
T0
\
gradients_3/mul_20_grad/MulMulgradients_3/Mean_8_grad/truedivStopGradient_3*
T0
�
gradients_3/mul_20_grad/SumSumgradients_3/mul_20_grad/Mul-gradients_3/mul_20_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_3/mul_20_grad/ReshapeReshapegradients_3/mul_20_grad/Sumgradients_3/mul_20_grad/Shape*
T0*
Tshape0
V
gradients_3/mul_20_grad/Mul_1Mulmul_19gradients_3/Mean_8_grad/truediv*
T0
�
gradients_3/mul_20_grad/Sum_1Sumgradients_3/mul_20_grad/Mul_1/gradients_3/mul_20_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_3/mul_20_grad/Reshape_1Reshapegradients_3/mul_20_grad/Sum_1gradients_3/mul_20_grad/Shape_1*
T0*
Tshape0
�
(gradients_3/mul_20_grad/tuple/group_depsNoOp ^gradients_3/mul_20_grad/Reshape"^gradients_3/mul_20_grad/Reshape_1^sac_policy_opt^sac_value_opt
�
0gradients_3/mul_20_grad/tuple/control_dependencyIdentitygradients_3/mul_20_grad/Reshape)^gradients_3/mul_20_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_3/mul_20_grad/Reshape
�
2gradients_3/mul_20_grad/tuple/control_dependency_1Identity!gradients_3/mul_20_grad/Reshape_1)^gradients_3/mul_20_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_3/mul_20_grad/Reshape_1
s
gradients_3/mul_19_grad/ShapeShapelog_ent_coef/read^sac_policy_opt^sac_value_opt*
T0*
out_type0
m
gradients_3/mul_19_grad/Shape_1Shape	ToFloat_4^sac_policy_opt^sac_value_opt*
T0*
out_type0
�
-gradients_3/mul_19_grad/BroadcastGradientArgsBroadcastGradientArgsgradients_3/mul_19_grad/Shapegradients_3/mul_19_grad/Shape_1*
T0
h
gradients_3/mul_19_grad/MulMul0gradients_3/mul_20_grad/tuple/control_dependency	ToFloat_4*
T0
�
gradients_3/mul_19_grad/SumSumgradients_3/mul_19_grad/Mul-gradients_3/mul_19_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
}
gradients_3/mul_19_grad/ReshapeReshapegradients_3/mul_19_grad/Sumgradients_3/mul_19_grad/Shape*
T0*
Tshape0
r
gradients_3/mul_19_grad/Mul_1Mullog_ent_coef/read0gradients_3/mul_20_grad/tuple/control_dependency*
T0
�
gradients_3/mul_19_grad/Sum_1Sumgradients_3/mul_19_grad/Mul_1/gradients_3/mul_19_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
�
!gradients_3/mul_19_grad/Reshape_1Reshapegradients_3/mul_19_grad/Sum_1gradients_3/mul_19_grad/Shape_1*
T0*
Tshape0
�
(gradients_3/mul_19_grad/tuple/group_depsNoOp ^gradients_3/mul_19_grad/Reshape"^gradients_3/mul_19_grad/Reshape_1^sac_policy_opt^sac_value_opt
�
0gradients_3/mul_19_grad/tuple/control_dependencyIdentitygradients_3/mul_19_grad/Reshape)^gradients_3/mul_19_grad/tuple/group_deps*
T0*2
_class(
&$loc:@gradients_3/mul_19_grad/Reshape
�
2gradients_3/mul_19_grad/tuple/control_dependency_1Identity!gradients_3/mul_19_grad/Reshape_1)^gradients_3/mul_19_grad/tuple/group_deps*
T0*4
_class*
(&loc:@gradients_3/mul_19_grad/Reshape_1
i
beta1_power_3/initial_valueConst*
_class
loc:@log_ent_coef*
valueB
 *fff?*
dtype0
z
beta1_power_3
VariableV2*
shape: *
shared_name *
_class
loc:@log_ent_coef*
dtype0*
	container 
�
beta1_power_3/AssignAssignbeta1_power_3beta1_power_3/initial_value*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
W
beta1_power_3/readIdentitybeta1_power_3*
T0*
_class
loc:@log_ent_coef
i
beta2_power_3/initial_valueConst*
_class
loc:@log_ent_coef*
valueB
 *w�?*
dtype0
z
beta2_power_3
VariableV2*
shape: *
shared_name *
_class
loc:@log_ent_coef*
dtype0*
	container 
�
beta2_power_3/AssignAssignbeta2_power_3beta2_power_3/initial_value*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
W
beta2_power_3/readIdentitybeta2_power_3*
T0*
_class
loc:@log_ent_coef
|
.log_ent_coef/sac_entropy_opt/Initializer/zerosConst*
valueB
 *    *
_class
loc:@log_ent_coef*
dtype0
�
log_ent_coef/sac_entropy_opt
VariableV2*
shape: *
shared_name *
_class
loc:@log_ent_coef*
dtype0*
	container 
�
#log_ent_coef/sac_entropy_opt/AssignAssignlog_ent_coef/sac_entropy_opt.log_ent_coef/sac_entropy_opt/Initializer/zeros*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
u
!log_ent_coef/sac_entropy_opt/readIdentitylog_ent_coef/sac_entropy_opt*
T0*
_class
loc:@log_ent_coef
~
0log_ent_coef/sac_entropy_opt_1/Initializer/zerosConst*
valueB
 *    *
_class
loc:@log_ent_coef*
dtype0
�
log_ent_coef/sac_entropy_opt_1
VariableV2*
shape: *
shared_name *
_class
loc:@log_ent_coef*
dtype0*
	container 
�
%log_ent_coef/sac_entropy_opt_1/AssignAssignlog_ent_coef/sac_entropy_opt_10log_ent_coef/sac_entropy_opt_1/Initializer/zeros*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
y
#log_ent_coef/sac_entropy_opt_1/readIdentitylog_ent_coef/sac_entropy_opt_1*
T0*
_class
loc:@log_ent_coef
c
sac_entropy_opt/beta1Const^sac_policy_opt^sac_value_opt*
valueB
 *fff?*
dtype0
c
sac_entropy_opt/beta2Const^sac_policy_opt^sac_value_opt*
valueB
 *w�?*
dtype0
e
sac_entropy_opt/epsilonConst^sac_policy_opt^sac_value_opt*
valueB
 *w�+2*
dtype0
�
-sac_entropy_opt/update_log_ent_coef/ApplyAdam	ApplyAdamlog_ent_coeflog_ent_coef/sac_entropy_optlog_ent_coef/sac_entropy_opt_1beta1_power_3/readbeta2_power_3/readVariable_2/readsac_entropy_opt/beta1sac_entropy_opt/beta2sac_entropy_opt/epsilon0gradients_3/mul_19_grad/tuple/control_dependency*
use_locking( *
T0*
_class
loc:@log_ent_coef*
use_nesterov( 
�
sac_entropy_opt/mulMulbeta1_power_3/readsac_entropy_opt/beta1.^sac_entropy_opt/update_log_ent_coef/ApplyAdam*
T0*
_class
loc:@log_ent_coef
�
sac_entropy_opt/AssignAssignbeta1_power_3sac_entropy_opt/mul*
use_locking( *
T0*
_class
loc:@log_ent_coef*
validate_shape(
�
sac_entropy_opt/mul_1Mulbeta2_power_3/readsac_entropy_opt/beta2.^sac_entropy_opt/update_log_ent_coef/ApplyAdam*
T0*
_class
loc:@log_ent_coef
�
sac_entropy_opt/Assign_1Assignbeta2_power_3sac_entropy_opt/mul_1*
use_locking( *
T0*
_class
loc:@log_ent_coef*
validate_shape(
�
sac_entropy_optNoOp^sac_entropy_opt/Assign^sac_entropy_opt/Assign_1.^sac_entropy_opt/update_log_ent_coef/ApplyAdam^sac_policy_opt^sac_value_opt
�
	Assign_30Assigntarget_network/running_meanrunning_mean/read*
use_locking(*
T0*.
_class$
" loc:@target_network/running_mean*
validate_shape(
�
	Assign_31Assigntarget_network/running_variancerunning_variance/read*
use_locking(*
T0*2
_class(
&$loc:@target_network/running_variance*
validate_shape(
�
	Assign_32Assign"target_network/normalization_stepsnormalization_steps/read*
use_locking(*
T0*5
_class+
)'loc:@target_network/normalization_steps*
validate_shape(
8
group_deps_1NoOp
^Assign_30
^Assign_31
^Assign_32
0
group_deps_2NoOp^group_deps^group_deps_1
C
save_1/filename/inputConst*
valueB Bmodel*
dtype0
Z
save_1/filenamePlaceholderWithDefaultsave_1/filename/input*
shape: *
dtype0
Q
save_1/ConstPlaceholderWithDefaultsave_1/filename*
shape: *
dtype0
�I
save_1/SaveV2/tensor_namesConst*�I
value�IB�I�BVariableB
Variable_1B
Variable_2Baction_output_shapeBbeta1_powerBbeta1_power_1Bbeta1_power_2Bbeta1_power_3Bbeta2_powerBbeta2_power_1Bbeta2_power_2Bbeta2_power_3B&critic/q/q1_encoding/curiosity_q1/biasB4critic/q/q1_encoding/curiosity_q1/bias/sac_value_optB6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1B(critic/q/q1_encoding/curiosity_q1/kernelB6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_optB8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1B&critic/q/q1_encoding/extrinsic_q1/biasB4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_optB6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1B(critic/q/q1_encoding/extrinsic_q1/kernelB6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_optB8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_0/biasB;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_0/kernelB=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_1/biasB;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_1/kernelB=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_2/biasB;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_2/kernelB=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_3/biasB;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_3/kernelB=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1B&critic/q/q2_encoding/curiosity_q2/biasB4critic/q/q2_encoding/curiosity_q2/bias/sac_value_optB6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1B(critic/q/q2_encoding/curiosity_q2/kernelB6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_optB8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1B&critic/q/q2_encoding/extrinsic_q2/biasB4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_optB6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1B(critic/q/q2_encoding/extrinsic_q2/kernelB6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_optB8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_0/biasB;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_0/kernelB=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_1/biasB;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_1/kernelB=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_2/biasB;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_2/kernelB=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_3/biasB;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_3/kernelB=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1B!critic/value/curiosity_value/biasB/critic/value/curiosity_value/bias/sac_value_optB1critic/value/curiosity_value/bias/sac_value_opt_1B#critic/value/curiosity_value/kernelB1critic/value/curiosity_value/kernel/sac_value_optB3critic/value/curiosity_value/kernel/sac_value_opt_1B"critic/value/encoder/hidden_0/biasB0critic/value/encoder/hidden_0/bias/sac_value_optB2critic/value/encoder/hidden_0/bias/sac_value_opt_1B$critic/value/encoder/hidden_0/kernelB2critic/value/encoder/hidden_0/kernel/sac_value_optB4critic/value/encoder/hidden_0/kernel/sac_value_opt_1B"critic/value/encoder/hidden_1/biasB0critic/value/encoder/hidden_1/bias/sac_value_optB2critic/value/encoder/hidden_1/bias/sac_value_opt_1B$critic/value/encoder/hidden_1/kernelB2critic/value/encoder/hidden_1/kernel/sac_value_optB4critic/value/encoder/hidden_1/kernel/sac_value_opt_1B"critic/value/encoder/hidden_2/biasB0critic/value/encoder/hidden_2/bias/sac_value_optB2critic/value/encoder/hidden_2/bias/sac_value_opt_1B$critic/value/encoder/hidden_2/kernelB2critic/value/encoder/hidden_2/kernel/sac_value_optB4critic/value/encoder/hidden_2/kernel/sac_value_opt_1B"critic/value/encoder/hidden_3/biasB0critic/value/encoder/hidden_3/bias/sac_value_optB2critic/value/encoder/hidden_3/bias/sac_value_opt_1B$critic/value/encoder/hidden_3/kernelB2critic/value/encoder/hidden_3/kernel/sac_value_optB4critic/value/encoder/hidden_3/kernel/sac_value_opt_1B!critic/value/extrinsic_value/biasB/critic/value/extrinsic_value/bias/sac_value_optB1critic/value/extrinsic_value/bias/sac_value_opt_1B#critic/value/extrinsic_value/kernelB1critic/value/extrinsic_value/kernel/sac_value_optB3critic/value/extrinsic_value/kernel/sac_value_opt_1B*curiosity_vector_obs_encoder/hidden_0/biasB/curiosity_vector_obs_encoder/hidden_0/bias/AdamB1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_0/kernelB1curiosity_vector_obs_encoder/hidden_0/kernel/AdamB3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_1/biasB/curiosity_vector_obs_encoder/hidden_1/bias/AdamB1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_1/kernelB1curiosity_vector_obs_encoder/hidden_1/kernel/AdamB3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1B
dense/biasBdense/bias/AdamBdense/bias/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bdense_1/biasBdense_1/bias/AdamBdense_1/bias/Adam_1Bdense_1/kernelBdense_1/kernel/AdamBdense_1/kernel/Adam_1Bdense_2/biasBdense_2/bias/AdamBdense_2/bias/Adam_1Bdense_2/kernelBdense_2/kernel/AdamBdense_2/kernel/Adam_1Bdense_3/biasBdense_3/bias/AdamBdense_3/bias/Adam_1Bdense_3/kernelBdense_3/kernel/AdamBdense_3/kernel/Adam_1Bglobal_stepBis_continuous_controlBlog_ent_coefBlog_ent_coef/sac_entropy_optBlog_ent_coef/sac_entropy_opt_1Bmemory_sizeBnormalization_stepsBpolicy/log_std/biasB"policy/log_std/bias/sac_policy_optB$policy/log_std/bias/sac_policy_opt_1Bpolicy/log_std/kernelB$policy/log_std/kernel/sac_policy_optB&policy/log_std/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_0/biasB0policy/main_graph_0/hidden_0/bias/sac_policy_optB2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_0/kernelB2policy/main_graph_0/hidden_0/kernel/sac_policy_optB4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_1/biasB0policy/main_graph_0/hidden_1/bias/sac_policy_optB2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_1/kernelB2policy/main_graph_0/hidden_1/kernel/sac_policy_optB4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_2/biasB0policy/main_graph_0/hidden_2/bias/sac_policy_optB2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_2/kernelB2policy/main_graph_0/hidden_2/kernel/sac_policy_optB4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_3/biasB0policy/main_graph_0/hidden_3/bias/sac_policy_optB2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_3/kernelB2policy/main_graph_0/hidden_3/kernel/sac_policy_optB4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1Bpolicy/mu/biasBpolicy/mu/bias/sac_policy_optBpolicy/mu/bias/sac_policy_opt_1Bpolicy/mu/kernelBpolicy/mu/kernel/sac_policy_optB!policy/mu/kernel/sac_policy_opt_1Brunning_meanBrunning_varianceB0target_network/critic/value/curiosity_value/biasB2target_network/critic/value/curiosity_value/kernelB1target_network/critic/value/encoder/hidden_0/biasB3target_network/critic/value/encoder/hidden_0/kernelB1target_network/critic/value/encoder/hidden_1/biasB3target_network/critic/value/encoder/hidden_1/kernelB1target_network/critic/value/encoder/hidden_2/biasB3target_network/critic/value/encoder/hidden_2/kernelB1target_network/critic/value/encoder/hidden_3/biasB3target_network/critic/value/encoder/hidden_3/kernelB0target_network/critic/value/extrinsic_value/biasB2target_network/critic/value/extrinsic_value/kernelB"target_network/normalization_stepsBtarget_network/running_meanBtarget_network/running_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0
�
save_1/SaveV2/shape_and_slicesConst*�
value�B��B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�K
save_1/SaveV2SaveV2save_1/Constsave_1/SaveV2/tensor_namessave_1/SaveV2/shape_and_slicesVariable
Variable_1
Variable_2action_output_shapebeta1_powerbeta1_power_1beta1_power_2beta1_power_3beta2_powerbeta2_power_1beta2_power_2beta2_power_3&critic/q/q1_encoding/curiosity_q1/bias4critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1(critic/q/q1_encoding/curiosity_q1/kernel6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1&critic/q/q1_encoding/extrinsic_q1/bias4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1(critic/q/q1_encoding/extrinsic_q1/kernel6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1-critic/q/q1_encoding/q1_encoder/hidden_0/bias;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1/critic/q/q1_encoding/q1_encoder/hidden_0/kernel=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1-critic/q/q1_encoding/q1_encoder/hidden_1/bias;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1/critic/q/q1_encoding/q1_encoder/hidden_1/kernel=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1-critic/q/q1_encoding/q1_encoder/hidden_2/bias;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1/critic/q/q1_encoding/q1_encoder/hidden_2/kernel=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1-critic/q/q1_encoding/q1_encoder/hidden_3/bias;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1/critic/q/q1_encoding/q1_encoder/hidden_3/kernel=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1&critic/q/q2_encoding/curiosity_q2/bias4critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1(critic/q/q2_encoding/curiosity_q2/kernel6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1&critic/q/q2_encoding/extrinsic_q2/bias4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1(critic/q/q2_encoding/extrinsic_q2/kernel6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1-critic/q/q2_encoding/q2_encoder/hidden_0/bias;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1/critic/q/q2_encoding/q2_encoder/hidden_0/kernel=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1-critic/q/q2_encoding/q2_encoder/hidden_1/bias;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1/critic/q/q2_encoding/q2_encoder/hidden_1/kernel=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1-critic/q/q2_encoding/q2_encoder/hidden_2/bias;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1/critic/q/q2_encoding/q2_encoder/hidden_2/kernel=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1-critic/q/q2_encoding/q2_encoder/hidden_3/bias;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1/critic/q/q2_encoding/q2_encoder/hidden_3/kernel=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1!critic/value/curiosity_value/bias/critic/value/curiosity_value/bias/sac_value_opt1critic/value/curiosity_value/bias/sac_value_opt_1#critic/value/curiosity_value/kernel1critic/value/curiosity_value/kernel/sac_value_opt3critic/value/curiosity_value/kernel/sac_value_opt_1"critic/value/encoder/hidden_0/bias0critic/value/encoder/hidden_0/bias/sac_value_opt2critic/value/encoder/hidden_0/bias/sac_value_opt_1$critic/value/encoder/hidden_0/kernel2critic/value/encoder/hidden_0/kernel/sac_value_opt4critic/value/encoder/hidden_0/kernel/sac_value_opt_1"critic/value/encoder/hidden_1/bias0critic/value/encoder/hidden_1/bias/sac_value_opt2critic/value/encoder/hidden_1/bias/sac_value_opt_1$critic/value/encoder/hidden_1/kernel2critic/value/encoder/hidden_1/kernel/sac_value_opt4critic/value/encoder/hidden_1/kernel/sac_value_opt_1"critic/value/encoder/hidden_2/bias0critic/value/encoder/hidden_2/bias/sac_value_opt2critic/value/encoder/hidden_2/bias/sac_value_opt_1$critic/value/encoder/hidden_2/kernel2critic/value/encoder/hidden_2/kernel/sac_value_opt4critic/value/encoder/hidden_2/kernel/sac_value_opt_1"critic/value/encoder/hidden_3/bias0critic/value/encoder/hidden_3/bias/sac_value_opt2critic/value/encoder/hidden_3/bias/sac_value_opt_1$critic/value/encoder/hidden_3/kernel2critic/value/encoder/hidden_3/kernel/sac_value_opt4critic/value/encoder/hidden_3/kernel/sac_value_opt_1!critic/value/extrinsic_value/bias/critic/value/extrinsic_value/bias/sac_value_opt1critic/value/extrinsic_value/bias/sac_value_opt_1#critic/value/extrinsic_value/kernel1critic/value/extrinsic_value/kernel/sac_value_opt3critic/value/extrinsic_value/kernel/sac_value_opt_1*curiosity_vector_obs_encoder/hidden_0/bias/curiosity_vector_obs_encoder/hidden_0/bias/Adam1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1,curiosity_vector_obs_encoder/hidden_0/kernel1curiosity_vector_obs_encoder/hidden_0/kernel/Adam3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1*curiosity_vector_obs_encoder/hidden_1/bias/curiosity_vector_obs_encoder/hidden_1/bias/Adam1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1,curiosity_vector_obs_encoder/hidden_1/kernel1curiosity_vector_obs_encoder/hidden_1/kernel/Adam3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1
dense/biasdense/bias/Adamdense/bias/Adam_1dense/kerneldense/kernel/Adamdense/kernel/Adam_1dense_1/biasdense_1/bias/Adamdense_1/bias/Adam_1dense_1/kerneldense_1/kernel/Adamdense_1/kernel/Adam_1dense_2/biasdense_2/bias/Adamdense_2/bias/Adam_1dense_2/kerneldense_2/kernel/Adamdense_2/kernel/Adam_1dense_3/biasdense_3/bias/Adamdense_3/bias/Adam_1dense_3/kerneldense_3/kernel/Adamdense_3/kernel/Adam_1global_stepis_continuous_controllog_ent_coeflog_ent_coef/sac_entropy_optlog_ent_coef/sac_entropy_opt_1memory_sizenormalization_stepspolicy/log_std/bias"policy/log_std/bias/sac_policy_opt$policy/log_std/bias/sac_policy_opt_1policy/log_std/kernel$policy/log_std/kernel/sac_policy_opt&policy/log_std/kernel/sac_policy_opt_1!policy/main_graph_0/hidden_0/bias0policy/main_graph_0/hidden_0/bias/sac_policy_opt2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1#policy/main_graph_0/hidden_0/kernel2policy/main_graph_0/hidden_0/kernel/sac_policy_opt4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1!policy/main_graph_0/hidden_1/bias0policy/main_graph_0/hidden_1/bias/sac_policy_opt2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1#policy/main_graph_0/hidden_1/kernel2policy/main_graph_0/hidden_1/kernel/sac_policy_opt4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1!policy/main_graph_0/hidden_2/bias0policy/main_graph_0/hidden_2/bias/sac_policy_opt2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1#policy/main_graph_0/hidden_2/kernel2policy/main_graph_0/hidden_2/kernel/sac_policy_opt4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1!policy/main_graph_0/hidden_3/bias0policy/main_graph_0/hidden_3/bias/sac_policy_opt2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1#policy/main_graph_0/hidden_3/kernel2policy/main_graph_0/hidden_3/kernel/sac_policy_opt4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1policy/mu/biaspolicy/mu/bias/sac_policy_optpolicy/mu/bias/sac_policy_opt_1policy/mu/kernelpolicy/mu/kernel/sac_policy_opt!policy/mu/kernel/sac_policy_opt_1running_meanrunning_variance0target_network/critic/value/curiosity_value/bias2target_network/critic/value/curiosity_value/kernel1target_network/critic/value/encoder/hidden_0/bias3target_network/critic/value/encoder/hidden_0/kernel1target_network/critic/value/encoder/hidden_1/bias3target_network/critic/value/encoder/hidden_1/kernel1target_network/critic/value/encoder/hidden_2/bias3target_network/critic/value/encoder/hidden_2/kernel1target_network/critic/value/encoder/hidden_3/bias3target_network/critic/value/encoder/hidden_3/kernel0target_network/critic/value/extrinsic_value/bias2target_network/critic/value/extrinsic_value/kernel"target_network/normalization_stepstarget_network/running_meantarget_network/running_variancetrainer_major_versiontrainer_minor_versiontrainer_patch_versionversion_number*�
dtypes�
�2�
m
save_1/control_dependencyIdentitysave_1/Const^save_1/SaveV2*
T0*
_class
loc:@save_1/Const
�I
save_1/RestoreV2/tensor_namesConst"/device:CPU:0*�I
value�IB�I�BVariableB
Variable_1B
Variable_2Baction_output_shapeBbeta1_powerBbeta1_power_1Bbeta1_power_2Bbeta1_power_3Bbeta2_powerBbeta2_power_1Bbeta2_power_2Bbeta2_power_3B&critic/q/q1_encoding/curiosity_q1/biasB4critic/q/q1_encoding/curiosity_q1/bias/sac_value_optB6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1B(critic/q/q1_encoding/curiosity_q1/kernelB6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_optB8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1B&critic/q/q1_encoding/extrinsic_q1/biasB4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_optB6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1B(critic/q/q1_encoding/extrinsic_q1/kernelB6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_optB8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_0/biasB;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_0/kernelB=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_1/biasB;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_1/kernelB=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_2/biasB;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_2/kernelB=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1B-critic/q/q1_encoding/q1_encoder/hidden_3/biasB;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_optB=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1B/critic/q/q1_encoding/q1_encoder/hidden_3/kernelB=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_optB?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1B&critic/q/q2_encoding/curiosity_q2/biasB4critic/q/q2_encoding/curiosity_q2/bias/sac_value_optB6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1B(critic/q/q2_encoding/curiosity_q2/kernelB6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_optB8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1B&critic/q/q2_encoding/extrinsic_q2/biasB4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_optB6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1B(critic/q/q2_encoding/extrinsic_q2/kernelB6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_optB8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_0/biasB;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_0/kernelB=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_1/biasB;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_1/kernelB=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_2/biasB;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_2/kernelB=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1B-critic/q/q2_encoding/q2_encoder/hidden_3/biasB;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_optB=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1B/critic/q/q2_encoding/q2_encoder/hidden_3/kernelB=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_optB?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1B!critic/value/curiosity_value/biasB/critic/value/curiosity_value/bias/sac_value_optB1critic/value/curiosity_value/bias/sac_value_opt_1B#critic/value/curiosity_value/kernelB1critic/value/curiosity_value/kernel/sac_value_optB3critic/value/curiosity_value/kernel/sac_value_opt_1B"critic/value/encoder/hidden_0/biasB0critic/value/encoder/hidden_0/bias/sac_value_optB2critic/value/encoder/hidden_0/bias/sac_value_opt_1B$critic/value/encoder/hidden_0/kernelB2critic/value/encoder/hidden_0/kernel/sac_value_optB4critic/value/encoder/hidden_0/kernel/sac_value_opt_1B"critic/value/encoder/hidden_1/biasB0critic/value/encoder/hidden_1/bias/sac_value_optB2critic/value/encoder/hidden_1/bias/sac_value_opt_1B$critic/value/encoder/hidden_1/kernelB2critic/value/encoder/hidden_1/kernel/sac_value_optB4critic/value/encoder/hidden_1/kernel/sac_value_opt_1B"critic/value/encoder/hidden_2/biasB0critic/value/encoder/hidden_2/bias/sac_value_optB2critic/value/encoder/hidden_2/bias/sac_value_opt_1B$critic/value/encoder/hidden_2/kernelB2critic/value/encoder/hidden_2/kernel/sac_value_optB4critic/value/encoder/hidden_2/kernel/sac_value_opt_1B"critic/value/encoder/hidden_3/biasB0critic/value/encoder/hidden_3/bias/sac_value_optB2critic/value/encoder/hidden_3/bias/sac_value_opt_1B$critic/value/encoder/hidden_3/kernelB2critic/value/encoder/hidden_3/kernel/sac_value_optB4critic/value/encoder/hidden_3/kernel/sac_value_opt_1B!critic/value/extrinsic_value/biasB/critic/value/extrinsic_value/bias/sac_value_optB1critic/value/extrinsic_value/bias/sac_value_opt_1B#critic/value/extrinsic_value/kernelB1critic/value/extrinsic_value/kernel/sac_value_optB3critic/value/extrinsic_value/kernel/sac_value_opt_1B*curiosity_vector_obs_encoder/hidden_0/biasB/curiosity_vector_obs_encoder/hidden_0/bias/AdamB1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_0/kernelB1curiosity_vector_obs_encoder/hidden_0/kernel/AdamB3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1B*curiosity_vector_obs_encoder/hidden_1/biasB/curiosity_vector_obs_encoder/hidden_1/bias/AdamB1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1B,curiosity_vector_obs_encoder/hidden_1/kernelB1curiosity_vector_obs_encoder/hidden_1/kernel/AdamB3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1B
dense/biasBdense/bias/AdamBdense/bias/Adam_1Bdense/kernelBdense/kernel/AdamBdense/kernel/Adam_1Bdense_1/biasBdense_1/bias/AdamBdense_1/bias/Adam_1Bdense_1/kernelBdense_1/kernel/AdamBdense_1/kernel/Adam_1Bdense_2/biasBdense_2/bias/AdamBdense_2/bias/Adam_1Bdense_2/kernelBdense_2/kernel/AdamBdense_2/kernel/Adam_1Bdense_3/biasBdense_3/bias/AdamBdense_3/bias/Adam_1Bdense_3/kernelBdense_3/kernel/AdamBdense_3/kernel/Adam_1Bglobal_stepBis_continuous_controlBlog_ent_coefBlog_ent_coef/sac_entropy_optBlog_ent_coef/sac_entropy_opt_1Bmemory_sizeBnormalization_stepsBpolicy/log_std/biasB"policy/log_std/bias/sac_policy_optB$policy/log_std/bias/sac_policy_opt_1Bpolicy/log_std/kernelB$policy/log_std/kernel/sac_policy_optB&policy/log_std/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_0/biasB0policy/main_graph_0/hidden_0/bias/sac_policy_optB2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_0/kernelB2policy/main_graph_0/hidden_0/kernel/sac_policy_optB4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_1/biasB0policy/main_graph_0/hidden_1/bias/sac_policy_optB2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_1/kernelB2policy/main_graph_0/hidden_1/kernel/sac_policy_optB4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_2/biasB0policy/main_graph_0/hidden_2/bias/sac_policy_optB2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_2/kernelB2policy/main_graph_0/hidden_2/kernel/sac_policy_optB4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1B!policy/main_graph_0/hidden_3/biasB0policy/main_graph_0/hidden_3/bias/sac_policy_optB2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1B#policy/main_graph_0/hidden_3/kernelB2policy/main_graph_0/hidden_3/kernel/sac_policy_optB4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1Bpolicy/mu/biasBpolicy/mu/bias/sac_policy_optBpolicy/mu/bias/sac_policy_opt_1Bpolicy/mu/kernelBpolicy/mu/kernel/sac_policy_optB!policy/mu/kernel/sac_policy_opt_1Brunning_meanBrunning_varianceB0target_network/critic/value/curiosity_value/biasB2target_network/critic/value/curiosity_value/kernelB1target_network/critic/value/encoder/hidden_0/biasB3target_network/critic/value/encoder/hidden_0/kernelB1target_network/critic/value/encoder/hidden_1/biasB3target_network/critic/value/encoder/hidden_1/kernelB1target_network/critic/value/encoder/hidden_2/biasB3target_network/critic/value/encoder/hidden_2/kernelB1target_network/critic/value/encoder/hidden_3/biasB3target_network/critic/value/encoder/hidden_3/kernelB0target_network/critic/value/extrinsic_value/biasB2target_network/critic/value/extrinsic_value/kernelB"target_network/normalization_stepsBtarget_network/running_meanBtarget_network/running_varianceBtrainer_major_versionBtrainer_minor_versionBtrainer_patch_versionBversion_number*
dtype0
�
!save_1/RestoreV2/shape_and_slicesConst"/device:CPU:0*�
value�B��B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B *
dtype0
�
save_1/RestoreV2	RestoreV2save_1/Constsave_1/RestoreV2/tensor_names!save_1/RestoreV2/shape_and_slices"/device:CPU:0*�
dtypes�
�2�
�
save_1/AssignAssignVariablesave_1/RestoreV2*
use_locking(*
T0*
_class
loc:@Variable*
validate_shape(
�
save_1/Assign_1Assign
Variable_1save_1/RestoreV2:1*
use_locking(*
T0*
_class
loc:@Variable_1*
validate_shape(
�
save_1/Assign_2Assign
Variable_2save_1/RestoreV2:2*
use_locking(*
T0*
_class
loc:@Variable_2*
validate_shape(
�
save_1/Assign_3Assignaction_output_shapesave_1/RestoreV2:3*
use_locking(*
T0*&
_class
loc:@action_output_shape*
validate_shape(
�
save_1/Assign_4Assignbeta1_powersave_1/RestoreV2:4*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_5Assignbeta1_power_1save_1/RestoreV2:5*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
save_1/Assign_6Assignbeta1_power_2save_1/RestoreV2:6*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
save_1/Assign_7Assignbeta1_power_3save_1/RestoreV2:7*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
�
save_1/Assign_8Assignbeta2_powersave_1/RestoreV2:8*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_9Assignbeta2_power_1save_1/RestoreV2:9*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
save_1/Assign_10Assignbeta2_power_2save_1/RestoreV2:10*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
save_1/Assign_11Assignbeta2_power_3save_1/RestoreV2:11*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
�
save_1/Assign_12Assign&critic/q/q1_encoding/curiosity_q1/biassave_1/RestoreV2:12*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
save_1/Assign_13Assign4critic/q/q1_encoding/curiosity_q1/bias/sac_value_optsave_1/RestoreV2:13*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
save_1/Assign_14Assign6critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1save_1/RestoreV2:14*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/curiosity_q1/bias*
validate_shape(
�
save_1/Assign_15Assign(critic/q/q1_encoding/curiosity_q1/kernelsave_1/RestoreV2:15*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
validate_shape(
�
save_1/Assign_16Assign6critic/q/q1_encoding/curiosity_q1/kernel/sac_value_optsave_1/RestoreV2:16*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
validate_shape(
�
save_1/Assign_17Assign8critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1save_1/RestoreV2:17*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/curiosity_q1/kernel*
validate_shape(
�
save_1/Assign_18Assign&critic/q/q1_encoding/extrinsic_q1/biassave_1/RestoreV2:18*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
validate_shape(
�
save_1/Assign_19Assign4critic/q/q1_encoding/extrinsic_q1/bias/sac_value_optsave_1/RestoreV2:19*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
validate_shape(
�
save_1/Assign_20Assign6critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1save_1/RestoreV2:20*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q1_encoding/extrinsic_q1/bias*
validate_shape(
�
save_1/Assign_21Assign(critic/q/q1_encoding/extrinsic_q1/kernelsave_1/RestoreV2:21*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
validate_shape(
�
save_1/Assign_22Assign6critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_optsave_1/RestoreV2:22*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
validate_shape(
�
save_1/Assign_23Assign8critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1save_1/RestoreV2:23*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q1_encoding/extrinsic_q1/kernel*
validate_shape(
�
save_1/Assign_24Assign-critic/q/q1_encoding/q1_encoder/hidden_0/biassave_1/RestoreV2:24*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_25Assign;critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_optsave_1/RestoreV2:25*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_26Assign=critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1save_1/RestoreV2:26*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_27Assign/critic/q/q1_encoding/q1_encoder/hidden_0/kernelsave_1/RestoreV2:27*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_28Assign=critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_optsave_1/RestoreV2:28*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_29Assign?critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1save_1/RestoreV2:29*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_30Assign-critic/q/q1_encoding/q1_encoder/hidden_1/biassave_1/RestoreV2:30*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_31Assign;critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_optsave_1/RestoreV2:31*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_32Assign=critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1save_1/RestoreV2:32*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_33Assign/critic/q/q1_encoding/q1_encoder/hidden_1/kernelsave_1/RestoreV2:33*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_34Assign=critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_optsave_1/RestoreV2:34*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_35Assign?critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1save_1/RestoreV2:35*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_36Assign-critic/q/q1_encoding/q1_encoder/hidden_2/biassave_1/RestoreV2:36*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_37Assign;critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_optsave_1/RestoreV2:37*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_38Assign=critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1save_1/RestoreV2:38*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_39Assign/critic/q/q1_encoding/q1_encoder/hidden_2/kernelsave_1/RestoreV2:39*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_40Assign=critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_optsave_1/RestoreV2:40*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_41Assign?critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1save_1/RestoreV2:41*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_42Assign-critic/q/q1_encoding/q1_encoder/hidden_3/biassave_1/RestoreV2:42*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_43Assign;critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_optsave_1/RestoreV2:43*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_44Assign=critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1save_1/RestoreV2:44*
use_locking(*
T0*@
_class6
42loc:@critic/q/q1_encoding/q1_encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_45Assign/critic/q/q1_encoding/q1_encoder/hidden_3/kernelsave_1/RestoreV2:45*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_46Assign=critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_optsave_1/RestoreV2:46*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_47Assign?critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1save_1/RestoreV2:47*
use_locking(*
T0*B
_class8
64loc:@critic/q/q1_encoding/q1_encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_48Assign&critic/q/q2_encoding/curiosity_q2/biassave_1/RestoreV2:48*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
validate_shape(
�
save_1/Assign_49Assign4critic/q/q2_encoding/curiosity_q2/bias/sac_value_optsave_1/RestoreV2:49*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
validate_shape(
�
save_1/Assign_50Assign6critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1save_1/RestoreV2:50*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/curiosity_q2/bias*
validate_shape(
�
save_1/Assign_51Assign(critic/q/q2_encoding/curiosity_q2/kernelsave_1/RestoreV2:51*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
validate_shape(
�
save_1/Assign_52Assign6critic/q/q2_encoding/curiosity_q2/kernel/sac_value_optsave_1/RestoreV2:52*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
validate_shape(
�
save_1/Assign_53Assign8critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1save_1/RestoreV2:53*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/curiosity_q2/kernel*
validate_shape(
�
save_1/Assign_54Assign&critic/q/q2_encoding/extrinsic_q2/biassave_1/RestoreV2:54*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
validate_shape(
�
save_1/Assign_55Assign4critic/q/q2_encoding/extrinsic_q2/bias/sac_value_optsave_1/RestoreV2:55*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
validate_shape(
�
save_1/Assign_56Assign6critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1save_1/RestoreV2:56*
use_locking(*
T0*9
_class/
-+loc:@critic/q/q2_encoding/extrinsic_q2/bias*
validate_shape(
�
save_1/Assign_57Assign(critic/q/q2_encoding/extrinsic_q2/kernelsave_1/RestoreV2:57*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
validate_shape(
�
save_1/Assign_58Assign6critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_optsave_1/RestoreV2:58*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
validate_shape(
�
save_1/Assign_59Assign8critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1save_1/RestoreV2:59*
use_locking(*
T0*;
_class1
/-loc:@critic/q/q2_encoding/extrinsic_q2/kernel*
validate_shape(
�
save_1/Assign_60Assign-critic/q/q2_encoding/q2_encoder/hidden_0/biassave_1/RestoreV2:60*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_61Assign;critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_optsave_1/RestoreV2:61*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_62Assign=critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1save_1/RestoreV2:62*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_63Assign/critic/q/q2_encoding/q2_encoder/hidden_0/kernelsave_1/RestoreV2:63*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_64Assign=critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_optsave_1/RestoreV2:64*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_65Assign?critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1save_1/RestoreV2:65*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_66Assign-critic/q/q2_encoding/q2_encoder/hidden_1/biassave_1/RestoreV2:66*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_67Assign;critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_optsave_1/RestoreV2:67*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_68Assign=critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1save_1/RestoreV2:68*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_69Assign/critic/q/q2_encoding/q2_encoder/hidden_1/kernelsave_1/RestoreV2:69*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_70Assign=critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_optsave_1/RestoreV2:70*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_71Assign?critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1save_1/RestoreV2:71*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_72Assign-critic/q/q2_encoding/q2_encoder/hidden_2/biassave_1/RestoreV2:72*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_73Assign;critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_optsave_1/RestoreV2:73*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_74Assign=critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1save_1/RestoreV2:74*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_75Assign/critic/q/q2_encoding/q2_encoder/hidden_2/kernelsave_1/RestoreV2:75*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_76Assign=critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_optsave_1/RestoreV2:76*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_77Assign?critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1save_1/RestoreV2:77*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_78Assign-critic/q/q2_encoding/q2_encoder/hidden_3/biassave_1/RestoreV2:78*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_79Assign;critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_optsave_1/RestoreV2:79*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_80Assign=critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1save_1/RestoreV2:80*
use_locking(*
T0*@
_class6
42loc:@critic/q/q2_encoding/q2_encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_81Assign/critic/q/q2_encoding/q2_encoder/hidden_3/kernelsave_1/RestoreV2:81*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_82Assign=critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_optsave_1/RestoreV2:82*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_83Assign?critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1save_1/RestoreV2:83*
use_locking(*
T0*B
_class8
64loc:@critic/q/q2_encoding/q2_encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_84Assign!critic/value/curiosity_value/biassave_1/RestoreV2:84*
use_locking(*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias*
validate_shape(
�
save_1/Assign_85Assign/critic/value/curiosity_value/bias/sac_value_optsave_1/RestoreV2:85*
use_locking(*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias*
validate_shape(
�
save_1/Assign_86Assign1critic/value/curiosity_value/bias/sac_value_opt_1save_1/RestoreV2:86*
use_locking(*
T0*4
_class*
(&loc:@critic/value/curiosity_value/bias*
validate_shape(
�
save_1/Assign_87Assign#critic/value/curiosity_value/kernelsave_1/RestoreV2:87*
use_locking(*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
validate_shape(
�
save_1/Assign_88Assign1critic/value/curiosity_value/kernel/sac_value_optsave_1/RestoreV2:88*
use_locking(*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
validate_shape(
�
save_1/Assign_89Assign3critic/value/curiosity_value/kernel/sac_value_opt_1save_1/RestoreV2:89*
use_locking(*
T0*6
_class,
*(loc:@critic/value/curiosity_value/kernel*
validate_shape(
�
save_1/Assign_90Assign"critic/value/encoder/hidden_0/biassave_1/RestoreV2:90*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_91Assign0critic/value/encoder/hidden_0/bias/sac_value_optsave_1/RestoreV2:91*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_92Assign2critic/value/encoder/hidden_0/bias/sac_value_opt_1save_1/RestoreV2:92*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_93Assign$critic/value/encoder/hidden_0/kernelsave_1/RestoreV2:93*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_94Assign2critic/value/encoder/hidden_0/kernel/sac_value_optsave_1/RestoreV2:94*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_95Assign4critic/value/encoder/hidden_0/kernel/sac_value_opt_1save_1/RestoreV2:95*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_96Assign"critic/value/encoder/hidden_1/biassave_1/RestoreV2:96*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_97Assign0critic/value/encoder/hidden_1/bias/sac_value_optsave_1/RestoreV2:97*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_98Assign2critic/value/encoder/hidden_1/bias/sac_value_opt_1save_1/RestoreV2:98*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_99Assign$critic/value/encoder/hidden_1/kernelsave_1/RestoreV2:99*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_100Assign2critic/value/encoder/hidden_1/kernel/sac_value_optsave_1/RestoreV2:100*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_101Assign4critic/value/encoder/hidden_1/kernel/sac_value_opt_1save_1/RestoreV2:101*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_102Assign"critic/value/encoder/hidden_2/biassave_1/RestoreV2:102*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_103Assign0critic/value/encoder/hidden_2/bias/sac_value_optsave_1/RestoreV2:103*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_104Assign2critic/value/encoder/hidden_2/bias/sac_value_opt_1save_1/RestoreV2:104*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_105Assign$critic/value/encoder/hidden_2/kernelsave_1/RestoreV2:105*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_106Assign2critic/value/encoder/hidden_2/kernel/sac_value_optsave_1/RestoreV2:106*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_107Assign4critic/value/encoder/hidden_2/kernel/sac_value_opt_1save_1/RestoreV2:107*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_108Assign"critic/value/encoder/hidden_3/biassave_1/RestoreV2:108*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_109Assign0critic/value/encoder/hidden_3/bias/sac_value_optsave_1/RestoreV2:109*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_110Assign2critic/value/encoder/hidden_3/bias/sac_value_opt_1save_1/RestoreV2:110*
use_locking(*
T0*5
_class+
)'loc:@critic/value/encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_111Assign$critic/value/encoder/hidden_3/kernelsave_1/RestoreV2:111*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_112Assign2critic/value/encoder/hidden_3/kernel/sac_value_optsave_1/RestoreV2:112*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_113Assign4critic/value/encoder/hidden_3/kernel/sac_value_opt_1save_1/RestoreV2:113*
use_locking(*
T0*7
_class-
+)loc:@critic/value/encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_114Assign!critic/value/extrinsic_value/biassave_1/RestoreV2:114*
use_locking(*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
validate_shape(
�
save_1/Assign_115Assign/critic/value/extrinsic_value/bias/sac_value_optsave_1/RestoreV2:115*
use_locking(*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
validate_shape(
�
save_1/Assign_116Assign1critic/value/extrinsic_value/bias/sac_value_opt_1save_1/RestoreV2:116*
use_locking(*
T0*4
_class*
(&loc:@critic/value/extrinsic_value/bias*
validate_shape(
�
save_1/Assign_117Assign#critic/value/extrinsic_value/kernelsave_1/RestoreV2:117*
use_locking(*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
validate_shape(
�
save_1/Assign_118Assign1critic/value/extrinsic_value/kernel/sac_value_optsave_1/RestoreV2:118*
use_locking(*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
validate_shape(
�
save_1/Assign_119Assign3critic/value/extrinsic_value/kernel/sac_value_opt_1save_1/RestoreV2:119*
use_locking(*
T0*6
_class,
*(loc:@critic/value/extrinsic_value/kernel*
validate_shape(
�
save_1/Assign_120Assign*curiosity_vector_obs_encoder/hidden_0/biassave_1/RestoreV2:120*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_121Assign/curiosity_vector_obs_encoder/hidden_0/bias/Adamsave_1/RestoreV2:121*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_122Assign1curiosity_vector_obs_encoder/hidden_0/bias/Adam_1save_1/RestoreV2:122*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_123Assign,curiosity_vector_obs_encoder/hidden_0/kernelsave_1/RestoreV2:123*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_124Assign1curiosity_vector_obs_encoder/hidden_0/kernel/Adamsave_1/RestoreV2:124*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_125Assign3curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1save_1/RestoreV2:125*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_126Assign*curiosity_vector_obs_encoder/hidden_1/biassave_1/RestoreV2:126*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_127Assign/curiosity_vector_obs_encoder/hidden_1/bias/Adamsave_1/RestoreV2:127*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_128Assign1curiosity_vector_obs_encoder/hidden_1/bias/Adam_1save_1/RestoreV2:128*
use_locking(*
T0*=
_class3
1/loc:@curiosity_vector_obs_encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_129Assign,curiosity_vector_obs_encoder/hidden_1/kernelsave_1/RestoreV2:129*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_130Assign1curiosity_vector_obs_encoder/hidden_1/kernel/Adamsave_1/RestoreV2:130*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_131Assign3curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1save_1/RestoreV2:131*
use_locking(*
T0*?
_class5
31loc:@curiosity_vector_obs_encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_132Assign
dense/biassave_1/RestoreV2:132*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(
�
save_1/Assign_133Assigndense/bias/Adamsave_1/RestoreV2:133*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(
�
save_1/Assign_134Assigndense/bias/Adam_1save_1/RestoreV2:134*
use_locking(*
T0*
_class
loc:@dense/bias*
validate_shape(
�
save_1/Assign_135Assigndense/kernelsave_1/RestoreV2:135*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
�
save_1/Assign_136Assigndense/kernel/Adamsave_1/RestoreV2:136*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
�
save_1/Assign_137Assigndense/kernel/Adam_1save_1/RestoreV2:137*
use_locking(*
T0*
_class
loc:@dense/kernel*
validate_shape(
�
save_1/Assign_138Assigndense_1/biassave_1/RestoreV2:138*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
�
save_1/Assign_139Assigndense_1/bias/Adamsave_1/RestoreV2:139*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
�
save_1/Assign_140Assigndense_1/bias/Adam_1save_1/RestoreV2:140*
use_locking(*
T0*
_class
loc:@dense_1/bias*
validate_shape(
�
save_1/Assign_141Assigndense_1/kernelsave_1/RestoreV2:141*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
�
save_1/Assign_142Assigndense_1/kernel/Adamsave_1/RestoreV2:142*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
�
save_1/Assign_143Assigndense_1/kernel/Adam_1save_1/RestoreV2:143*
use_locking(*
T0*!
_class
loc:@dense_1/kernel*
validate_shape(
�
save_1/Assign_144Assigndense_2/biassave_1/RestoreV2:144*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
�
save_1/Assign_145Assigndense_2/bias/Adamsave_1/RestoreV2:145*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
�
save_1/Assign_146Assigndense_2/bias/Adam_1save_1/RestoreV2:146*
use_locking(*
T0*
_class
loc:@dense_2/bias*
validate_shape(
�
save_1/Assign_147Assigndense_2/kernelsave_1/RestoreV2:147*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
�
save_1/Assign_148Assigndense_2/kernel/Adamsave_1/RestoreV2:148*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
�
save_1/Assign_149Assigndense_2/kernel/Adam_1save_1/RestoreV2:149*
use_locking(*
T0*!
_class
loc:@dense_2/kernel*
validate_shape(
�
save_1/Assign_150Assigndense_3/biassave_1/RestoreV2:150*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
�
save_1/Assign_151Assigndense_3/bias/Adamsave_1/RestoreV2:151*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
�
save_1/Assign_152Assigndense_3/bias/Adam_1save_1/RestoreV2:152*
use_locking(*
T0*
_class
loc:@dense_3/bias*
validate_shape(
�
save_1/Assign_153Assigndense_3/kernelsave_1/RestoreV2:153*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
�
save_1/Assign_154Assigndense_3/kernel/Adamsave_1/RestoreV2:154*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
�
save_1/Assign_155Assigndense_3/kernel/Adam_1save_1/RestoreV2:155*
use_locking(*
T0*!
_class
loc:@dense_3/kernel*
validate_shape(
�
save_1/Assign_156Assignglobal_stepsave_1/RestoreV2:156*
use_locking(*
T0*
_class
loc:@global_step*
validate_shape(
�
save_1/Assign_157Assignis_continuous_controlsave_1/RestoreV2:157*
use_locking(*
T0*(
_class
loc:@is_continuous_control*
validate_shape(
�
save_1/Assign_158Assignlog_ent_coefsave_1/RestoreV2:158*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
�
save_1/Assign_159Assignlog_ent_coef/sac_entropy_optsave_1/RestoreV2:159*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
�
save_1/Assign_160Assignlog_ent_coef/sac_entropy_opt_1save_1/RestoreV2:160*
use_locking(*
T0*
_class
loc:@log_ent_coef*
validate_shape(
�
save_1/Assign_161Assignmemory_sizesave_1/RestoreV2:161*
use_locking(*
T0*
_class
loc:@memory_size*
validate_shape(
�
save_1/Assign_162Assignnormalization_stepssave_1/RestoreV2:162*
use_locking(*
T0*&
_class
loc:@normalization_steps*
validate_shape(
�
save_1/Assign_163Assignpolicy/log_std/biassave_1/RestoreV2:163*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
save_1/Assign_164Assign"policy/log_std/bias/sac_policy_optsave_1/RestoreV2:164*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
save_1/Assign_165Assign$policy/log_std/bias/sac_policy_opt_1save_1/RestoreV2:165*
use_locking(*
T0*&
_class
loc:@policy/log_std/bias*
validate_shape(
�
save_1/Assign_166Assignpolicy/log_std/kernelsave_1/RestoreV2:166*
use_locking(*
T0*(
_class
loc:@policy/log_std/kernel*
validate_shape(
�
save_1/Assign_167Assign$policy/log_std/kernel/sac_policy_optsave_1/RestoreV2:167*
use_locking(*
T0*(
_class
loc:@policy/log_std/kernel*
validate_shape(
�
save_1/Assign_168Assign&policy/log_std/kernel/sac_policy_opt_1save_1/RestoreV2:168*
use_locking(*
T0*(
_class
loc:@policy/log_std/kernel*
validate_shape(
�
save_1/Assign_169Assign!policy/main_graph_0/hidden_0/biassave_1/RestoreV2:169*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
validate_shape(
�
save_1/Assign_170Assign0policy/main_graph_0/hidden_0/bias/sac_policy_optsave_1/RestoreV2:170*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
validate_shape(
�
save_1/Assign_171Assign2policy/main_graph_0/hidden_0/bias/sac_policy_opt_1save_1/RestoreV2:171*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_0/bias*
validate_shape(
�
save_1/Assign_172Assign#policy/main_graph_0/hidden_0/kernelsave_1/RestoreV2:172*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
validate_shape(
�
save_1/Assign_173Assign2policy/main_graph_0/hidden_0/kernel/sac_policy_optsave_1/RestoreV2:173*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
validate_shape(
�
save_1/Assign_174Assign4policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1save_1/RestoreV2:174*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_0/kernel*
validate_shape(
�
save_1/Assign_175Assign!policy/main_graph_0/hidden_1/biassave_1/RestoreV2:175*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
validate_shape(
�
save_1/Assign_176Assign0policy/main_graph_0/hidden_1/bias/sac_policy_optsave_1/RestoreV2:176*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
validate_shape(
�
save_1/Assign_177Assign2policy/main_graph_0/hidden_1/bias/sac_policy_opt_1save_1/RestoreV2:177*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_1/bias*
validate_shape(
�
save_1/Assign_178Assign#policy/main_graph_0/hidden_1/kernelsave_1/RestoreV2:178*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
validate_shape(
�
save_1/Assign_179Assign2policy/main_graph_0/hidden_1/kernel/sac_policy_optsave_1/RestoreV2:179*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
validate_shape(
�
save_1/Assign_180Assign4policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1save_1/RestoreV2:180*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_1/kernel*
validate_shape(
�
save_1/Assign_181Assign!policy/main_graph_0/hidden_2/biassave_1/RestoreV2:181*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
validate_shape(
�
save_1/Assign_182Assign0policy/main_graph_0/hidden_2/bias/sac_policy_optsave_1/RestoreV2:182*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
validate_shape(
�
save_1/Assign_183Assign2policy/main_graph_0/hidden_2/bias/sac_policy_opt_1save_1/RestoreV2:183*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_2/bias*
validate_shape(
�
save_1/Assign_184Assign#policy/main_graph_0/hidden_2/kernelsave_1/RestoreV2:184*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
validate_shape(
�
save_1/Assign_185Assign2policy/main_graph_0/hidden_2/kernel/sac_policy_optsave_1/RestoreV2:185*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
validate_shape(
�
save_1/Assign_186Assign4policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1save_1/RestoreV2:186*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_2/kernel*
validate_shape(
�
save_1/Assign_187Assign!policy/main_graph_0/hidden_3/biassave_1/RestoreV2:187*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
validate_shape(
�
save_1/Assign_188Assign0policy/main_graph_0/hidden_3/bias/sac_policy_optsave_1/RestoreV2:188*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
validate_shape(
�
save_1/Assign_189Assign2policy/main_graph_0/hidden_3/bias/sac_policy_opt_1save_1/RestoreV2:189*
use_locking(*
T0*4
_class*
(&loc:@policy/main_graph_0/hidden_3/bias*
validate_shape(
�
save_1/Assign_190Assign#policy/main_graph_0/hidden_3/kernelsave_1/RestoreV2:190*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
validate_shape(
�
save_1/Assign_191Assign2policy/main_graph_0/hidden_3/kernel/sac_policy_optsave_1/RestoreV2:191*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
validate_shape(
�
save_1/Assign_192Assign4policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1save_1/RestoreV2:192*
use_locking(*
T0*6
_class,
*(loc:@policy/main_graph_0/hidden_3/kernel*
validate_shape(
�
save_1/Assign_193Assignpolicy/mu/biassave_1/RestoreV2:193*
use_locking(*
T0*!
_class
loc:@policy/mu/bias*
validate_shape(
�
save_1/Assign_194Assignpolicy/mu/bias/sac_policy_optsave_1/RestoreV2:194*
use_locking(*
T0*!
_class
loc:@policy/mu/bias*
validate_shape(
�
save_1/Assign_195Assignpolicy/mu/bias/sac_policy_opt_1save_1/RestoreV2:195*
use_locking(*
T0*!
_class
loc:@policy/mu/bias*
validate_shape(
�
save_1/Assign_196Assignpolicy/mu/kernelsave_1/RestoreV2:196*
use_locking(*
T0*#
_class
loc:@policy/mu/kernel*
validate_shape(
�
save_1/Assign_197Assignpolicy/mu/kernel/sac_policy_optsave_1/RestoreV2:197*
use_locking(*
T0*#
_class
loc:@policy/mu/kernel*
validate_shape(
�
save_1/Assign_198Assign!policy/mu/kernel/sac_policy_opt_1save_1/RestoreV2:198*
use_locking(*
T0*#
_class
loc:@policy/mu/kernel*
validate_shape(
�
save_1/Assign_199Assignrunning_meansave_1/RestoreV2:199*
use_locking(*
T0*
_class
loc:@running_mean*
validate_shape(
�
save_1/Assign_200Assignrunning_variancesave_1/RestoreV2:200*
use_locking(*
T0*#
_class
loc:@running_variance*
validate_shape(
�
save_1/Assign_201Assign0target_network/critic/value/curiosity_value/biassave_1/RestoreV2:201*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/curiosity_value/bias*
validate_shape(
�
save_1/Assign_202Assign2target_network/critic/value/curiosity_value/kernelsave_1/RestoreV2:202*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/curiosity_value/kernel*
validate_shape(
�
save_1/Assign_203Assign1target_network/critic/value/encoder/hidden_0/biassave_1/RestoreV2:203*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_0/bias*
validate_shape(
�
save_1/Assign_204Assign3target_network/critic/value/encoder/hidden_0/kernelsave_1/RestoreV2:204*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_0/kernel*
validate_shape(
�
save_1/Assign_205Assign1target_network/critic/value/encoder/hidden_1/biassave_1/RestoreV2:205*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_1/bias*
validate_shape(
�
save_1/Assign_206Assign3target_network/critic/value/encoder/hidden_1/kernelsave_1/RestoreV2:206*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_1/kernel*
validate_shape(
�
save_1/Assign_207Assign1target_network/critic/value/encoder/hidden_2/biassave_1/RestoreV2:207*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_2/bias*
validate_shape(
�
save_1/Assign_208Assign3target_network/critic/value/encoder/hidden_2/kernelsave_1/RestoreV2:208*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_2/kernel*
validate_shape(
�
save_1/Assign_209Assign1target_network/critic/value/encoder/hidden_3/biassave_1/RestoreV2:209*
use_locking(*
T0*D
_class:
86loc:@target_network/critic/value/encoder/hidden_3/bias*
validate_shape(
�
save_1/Assign_210Assign3target_network/critic/value/encoder/hidden_3/kernelsave_1/RestoreV2:210*
use_locking(*
T0*F
_class<
:8loc:@target_network/critic/value/encoder/hidden_3/kernel*
validate_shape(
�
save_1/Assign_211Assign0target_network/critic/value/extrinsic_value/biassave_1/RestoreV2:211*
use_locking(*
T0*C
_class9
75loc:@target_network/critic/value/extrinsic_value/bias*
validate_shape(
�
save_1/Assign_212Assign2target_network/critic/value/extrinsic_value/kernelsave_1/RestoreV2:212*
use_locking(*
T0*E
_class;
97loc:@target_network/critic/value/extrinsic_value/kernel*
validate_shape(
�
save_1/Assign_213Assign"target_network/normalization_stepssave_1/RestoreV2:213*
use_locking(*
T0*5
_class+
)'loc:@target_network/normalization_steps*
validate_shape(
�
save_1/Assign_214Assigntarget_network/running_meansave_1/RestoreV2:214*
use_locking(*
T0*.
_class$
" loc:@target_network/running_mean*
validate_shape(
�
save_1/Assign_215Assigntarget_network/running_variancesave_1/RestoreV2:215*
use_locking(*
T0*2
_class(
&$loc:@target_network/running_variance*
validate_shape(
�
save_1/Assign_216Assigntrainer_major_versionsave_1/RestoreV2:216*
use_locking(*
T0*(
_class
loc:@trainer_major_version*
validate_shape(
�
save_1/Assign_217Assigntrainer_minor_versionsave_1/RestoreV2:217*
use_locking(*
T0*(
_class
loc:@trainer_minor_version*
validate_shape(
�
save_1/Assign_218Assigntrainer_patch_versionsave_1/RestoreV2:218*
use_locking(*
T0*(
_class
loc:@trainer_patch_version*
validate_shape(
�
save_1/Assign_219Assignversion_numbersave_1/RestoreV2:219*
use_locking(*
T0*!
_class
loc:@version_number*
validate_shape(
�!
save_1/restore_allNoOp^save_1/Assign^save_1/Assign_1^save_1/Assign_10^save_1/Assign_100^save_1/Assign_101^save_1/Assign_102^save_1/Assign_103^save_1/Assign_104^save_1/Assign_105^save_1/Assign_106^save_1/Assign_107^save_1/Assign_108^save_1/Assign_109^save_1/Assign_11^save_1/Assign_110^save_1/Assign_111^save_1/Assign_112^save_1/Assign_113^save_1/Assign_114^save_1/Assign_115^save_1/Assign_116^save_1/Assign_117^save_1/Assign_118^save_1/Assign_119^save_1/Assign_12^save_1/Assign_120^save_1/Assign_121^save_1/Assign_122^save_1/Assign_123^save_1/Assign_124^save_1/Assign_125^save_1/Assign_126^save_1/Assign_127^save_1/Assign_128^save_1/Assign_129^save_1/Assign_13^save_1/Assign_130^save_1/Assign_131^save_1/Assign_132^save_1/Assign_133^save_1/Assign_134^save_1/Assign_135^save_1/Assign_136^save_1/Assign_137^save_1/Assign_138^save_1/Assign_139^save_1/Assign_14^save_1/Assign_140^save_1/Assign_141^save_1/Assign_142^save_1/Assign_143^save_1/Assign_144^save_1/Assign_145^save_1/Assign_146^save_1/Assign_147^save_1/Assign_148^save_1/Assign_149^save_1/Assign_15^save_1/Assign_150^save_1/Assign_151^save_1/Assign_152^save_1/Assign_153^save_1/Assign_154^save_1/Assign_155^save_1/Assign_156^save_1/Assign_157^save_1/Assign_158^save_1/Assign_159^save_1/Assign_16^save_1/Assign_160^save_1/Assign_161^save_1/Assign_162^save_1/Assign_163^save_1/Assign_164^save_1/Assign_165^save_1/Assign_166^save_1/Assign_167^save_1/Assign_168^save_1/Assign_169^save_1/Assign_17^save_1/Assign_170^save_1/Assign_171^save_1/Assign_172^save_1/Assign_173^save_1/Assign_174^save_1/Assign_175^save_1/Assign_176^save_1/Assign_177^save_1/Assign_178^save_1/Assign_179^save_1/Assign_18^save_1/Assign_180^save_1/Assign_181^save_1/Assign_182^save_1/Assign_183^save_1/Assign_184^save_1/Assign_185^save_1/Assign_186^save_1/Assign_187^save_1/Assign_188^save_1/Assign_189^save_1/Assign_19^save_1/Assign_190^save_1/Assign_191^save_1/Assign_192^save_1/Assign_193^save_1/Assign_194^save_1/Assign_195^save_1/Assign_196^save_1/Assign_197^save_1/Assign_198^save_1/Assign_199^save_1/Assign_2^save_1/Assign_20^save_1/Assign_200^save_1/Assign_201^save_1/Assign_202^save_1/Assign_203^save_1/Assign_204^save_1/Assign_205^save_1/Assign_206^save_1/Assign_207^save_1/Assign_208^save_1/Assign_209^save_1/Assign_21^save_1/Assign_210^save_1/Assign_211^save_1/Assign_212^save_1/Assign_213^save_1/Assign_214^save_1/Assign_215^save_1/Assign_216^save_1/Assign_217^save_1/Assign_218^save_1/Assign_219^save_1/Assign_22^save_1/Assign_23^save_1/Assign_24^save_1/Assign_25^save_1/Assign_26^save_1/Assign_27^save_1/Assign_28^save_1/Assign_29^save_1/Assign_3^save_1/Assign_30^save_1/Assign_31^save_1/Assign_32^save_1/Assign_33^save_1/Assign_34^save_1/Assign_35^save_1/Assign_36^save_1/Assign_37^save_1/Assign_38^save_1/Assign_39^save_1/Assign_4^save_1/Assign_40^save_1/Assign_41^save_1/Assign_42^save_1/Assign_43^save_1/Assign_44^save_1/Assign_45^save_1/Assign_46^save_1/Assign_47^save_1/Assign_48^save_1/Assign_49^save_1/Assign_5^save_1/Assign_50^save_1/Assign_51^save_1/Assign_52^save_1/Assign_53^save_1/Assign_54^save_1/Assign_55^save_1/Assign_56^save_1/Assign_57^save_1/Assign_58^save_1/Assign_59^save_1/Assign_6^save_1/Assign_60^save_1/Assign_61^save_1/Assign_62^save_1/Assign_63^save_1/Assign_64^save_1/Assign_65^save_1/Assign_66^save_1/Assign_67^save_1/Assign_68^save_1/Assign_69^save_1/Assign_7^save_1/Assign_70^save_1/Assign_71^save_1/Assign_72^save_1/Assign_73^save_1/Assign_74^save_1/Assign_75^save_1/Assign_76^save_1/Assign_77^save_1/Assign_78^save_1/Assign_79^save_1/Assign_8^save_1/Assign_80^save_1/Assign_81^save_1/Assign_82^save_1/Assign_83^save_1/Assign_84^save_1/Assign_85^save_1/Assign_86^save_1/Assign_87^save_1/Assign_88^save_1/Assign_89^save_1/Assign_9^save_1/Assign_90^save_1/Assign_91^save_1/Assign_92^save_1/Assign_93^save_1/Assign_94^save_1/Assign_95^save_1/Assign_96^save_1/Assign_97^save_1/Assign_98^save_1/Assign_99
�V
init_1NoOp^Variable/Assign^Variable_1/Assign^Variable_2/Assign^action_output_shape/Assign^beta1_power/Assign^beta1_power_1/Assign^beta1_power_2/Assign^beta1_power_3/Assign^beta2_power/Assign^beta2_power_1/Assign^beta2_power_2/Assign^beta2_power_3/Assign.^critic/q/q1_encoding/curiosity_q1/bias/Assign<^critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt/Assign>^critic/q/q1_encoding/curiosity_q1/bias/sac_value_opt_1/Assign0^critic/q/q1_encoding/curiosity_q1/kernel/Assign>^critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt/Assign@^critic/q/q1_encoding/curiosity_q1/kernel/sac_value_opt_1/Assign.^critic/q/q1_encoding/extrinsic_q1/bias/Assign<^critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt/Assign>^critic/q/q1_encoding/extrinsic_q1/bias/sac_value_opt_1/Assign0^critic/q/q1_encoding/extrinsic_q1/kernel/Assign>^critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt/Assign@^critic/q/q1_encoding/extrinsic_q1/kernel/sac_value_opt_1/Assign5^critic/q/q1_encoding/q1_encoder/hidden_0/bias/AssignC^critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt/AssignE^critic/q/q1_encoding/q1_encoder/hidden_0/bias/sac_value_opt_1/Assign7^critic/q/q1_encoding/q1_encoder/hidden_0/kernel/AssignE^critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt/AssignG^critic/q/q1_encoding/q1_encoder/hidden_0/kernel/sac_value_opt_1/Assign5^critic/q/q1_encoding/q1_encoder/hidden_1/bias/AssignC^critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt/AssignE^critic/q/q1_encoding/q1_encoder/hidden_1/bias/sac_value_opt_1/Assign7^critic/q/q1_encoding/q1_encoder/hidden_1/kernel/AssignE^critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt/AssignG^critic/q/q1_encoding/q1_encoder/hidden_1/kernel/sac_value_opt_1/Assign5^critic/q/q1_encoding/q1_encoder/hidden_2/bias/AssignC^critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt/AssignE^critic/q/q1_encoding/q1_encoder/hidden_2/bias/sac_value_opt_1/Assign7^critic/q/q1_encoding/q1_encoder/hidden_2/kernel/AssignE^critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt/AssignG^critic/q/q1_encoding/q1_encoder/hidden_2/kernel/sac_value_opt_1/Assign5^critic/q/q1_encoding/q1_encoder/hidden_3/bias/AssignC^critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt/AssignE^critic/q/q1_encoding/q1_encoder/hidden_3/bias/sac_value_opt_1/Assign7^critic/q/q1_encoding/q1_encoder/hidden_3/kernel/AssignE^critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt/AssignG^critic/q/q1_encoding/q1_encoder/hidden_3/kernel/sac_value_opt_1/Assign.^critic/q/q2_encoding/curiosity_q2/bias/Assign<^critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt/Assign>^critic/q/q2_encoding/curiosity_q2/bias/sac_value_opt_1/Assign0^critic/q/q2_encoding/curiosity_q2/kernel/Assign>^critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt/Assign@^critic/q/q2_encoding/curiosity_q2/kernel/sac_value_opt_1/Assign.^critic/q/q2_encoding/extrinsic_q2/bias/Assign<^critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt/Assign>^critic/q/q2_encoding/extrinsic_q2/bias/sac_value_opt_1/Assign0^critic/q/q2_encoding/extrinsic_q2/kernel/Assign>^critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt/Assign@^critic/q/q2_encoding/extrinsic_q2/kernel/sac_value_opt_1/Assign5^critic/q/q2_encoding/q2_encoder/hidden_0/bias/AssignC^critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt/AssignE^critic/q/q2_encoding/q2_encoder/hidden_0/bias/sac_value_opt_1/Assign7^critic/q/q2_encoding/q2_encoder/hidden_0/kernel/AssignE^critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt/AssignG^critic/q/q2_encoding/q2_encoder/hidden_0/kernel/sac_value_opt_1/Assign5^critic/q/q2_encoding/q2_encoder/hidden_1/bias/AssignC^critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt/AssignE^critic/q/q2_encoding/q2_encoder/hidden_1/bias/sac_value_opt_1/Assign7^critic/q/q2_encoding/q2_encoder/hidden_1/kernel/AssignE^critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt/AssignG^critic/q/q2_encoding/q2_encoder/hidden_1/kernel/sac_value_opt_1/Assign5^critic/q/q2_encoding/q2_encoder/hidden_2/bias/AssignC^critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt/AssignE^critic/q/q2_encoding/q2_encoder/hidden_2/bias/sac_value_opt_1/Assign7^critic/q/q2_encoding/q2_encoder/hidden_2/kernel/AssignE^critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt/AssignG^critic/q/q2_encoding/q2_encoder/hidden_2/kernel/sac_value_opt_1/Assign5^critic/q/q2_encoding/q2_encoder/hidden_3/bias/AssignC^critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt/AssignE^critic/q/q2_encoding/q2_encoder/hidden_3/bias/sac_value_opt_1/Assign7^critic/q/q2_encoding/q2_encoder/hidden_3/kernel/AssignE^critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt/AssignG^critic/q/q2_encoding/q2_encoder/hidden_3/kernel/sac_value_opt_1/Assign)^critic/value/curiosity_value/bias/Assign7^critic/value/curiosity_value/bias/sac_value_opt/Assign9^critic/value/curiosity_value/bias/sac_value_opt_1/Assign+^critic/value/curiosity_value/kernel/Assign9^critic/value/curiosity_value/kernel/sac_value_opt/Assign;^critic/value/curiosity_value/kernel/sac_value_opt_1/Assign*^critic/value/encoder/hidden_0/bias/Assign8^critic/value/encoder/hidden_0/bias/sac_value_opt/Assign:^critic/value/encoder/hidden_0/bias/sac_value_opt_1/Assign,^critic/value/encoder/hidden_0/kernel/Assign:^critic/value/encoder/hidden_0/kernel/sac_value_opt/Assign<^critic/value/encoder/hidden_0/kernel/sac_value_opt_1/Assign*^critic/value/encoder/hidden_1/bias/Assign8^critic/value/encoder/hidden_1/bias/sac_value_opt/Assign:^critic/value/encoder/hidden_1/bias/sac_value_opt_1/Assign,^critic/value/encoder/hidden_1/kernel/Assign:^critic/value/encoder/hidden_1/kernel/sac_value_opt/Assign<^critic/value/encoder/hidden_1/kernel/sac_value_opt_1/Assign*^critic/value/encoder/hidden_2/bias/Assign8^critic/value/encoder/hidden_2/bias/sac_value_opt/Assign:^critic/value/encoder/hidden_2/bias/sac_value_opt_1/Assign,^critic/value/encoder/hidden_2/kernel/Assign:^critic/value/encoder/hidden_2/kernel/sac_value_opt/Assign<^critic/value/encoder/hidden_2/kernel/sac_value_opt_1/Assign*^critic/value/encoder/hidden_3/bias/Assign8^critic/value/encoder/hidden_3/bias/sac_value_opt/Assign:^critic/value/encoder/hidden_3/bias/sac_value_opt_1/Assign,^critic/value/encoder/hidden_3/kernel/Assign:^critic/value/encoder/hidden_3/kernel/sac_value_opt/Assign<^critic/value/encoder/hidden_3/kernel/sac_value_opt_1/Assign)^critic/value/extrinsic_value/bias/Assign7^critic/value/extrinsic_value/bias/sac_value_opt/Assign9^critic/value/extrinsic_value/bias/sac_value_opt_1/Assign+^critic/value/extrinsic_value/kernel/Assign9^critic/value/extrinsic_value/kernel/sac_value_opt/Assign;^critic/value/extrinsic_value/kernel/sac_value_opt_1/Assign7^curiosity_vector_obs_encoder/hidden_0/bias/Adam/Assign9^curiosity_vector_obs_encoder/hidden_0/bias/Adam_1/Assign2^curiosity_vector_obs_encoder/hidden_0/bias/Assign9^curiosity_vector_obs_encoder/hidden_0/kernel/Adam/Assign;^curiosity_vector_obs_encoder/hidden_0/kernel/Adam_1/Assign4^curiosity_vector_obs_encoder/hidden_0/kernel/Assign7^curiosity_vector_obs_encoder/hidden_1/bias/Adam/Assign9^curiosity_vector_obs_encoder/hidden_1/bias/Adam_1/Assign2^curiosity_vector_obs_encoder/hidden_1/bias/Assign9^curiosity_vector_obs_encoder/hidden_1/kernel/Adam/Assign;^curiosity_vector_obs_encoder/hidden_1/kernel/Adam_1/Assign4^curiosity_vector_obs_encoder/hidden_1/kernel/Assign^dense/bias/Adam/Assign^dense/bias/Adam_1/Assign^dense/bias/Assign^dense/kernel/Adam/Assign^dense/kernel/Adam_1/Assign^dense/kernel/Assign^dense_1/bias/Adam/Assign^dense_1/bias/Adam_1/Assign^dense_1/bias/Assign^dense_1/kernel/Adam/Assign^dense_1/kernel/Adam_1/Assign^dense_1/kernel/Assign^dense_2/bias/Adam/Assign^dense_2/bias/Adam_1/Assign^dense_2/bias/Assign^dense_2/kernel/Adam/Assign^dense_2/kernel/Adam_1/Assign^dense_2/kernel/Assign^dense_3/bias/Adam/Assign^dense_3/bias/Adam_1/Assign^dense_3/bias/Assign^dense_3/kernel/Adam/Assign^dense_3/kernel/Adam_1/Assign^dense_3/kernel/Assign^global_step/Assign^is_continuous_control/Assign^log_ent_coef/Assign$^log_ent_coef/sac_entropy_opt/Assign&^log_ent_coef/sac_entropy_opt_1/Assign^memory_size/Assign^normalization_steps/Assign^policy/log_std/bias/Assign*^policy/log_std/bias/sac_policy_opt/Assign,^policy/log_std/bias/sac_policy_opt_1/Assign^policy/log_std/kernel/Assign,^policy/log_std/kernel/sac_policy_opt/Assign.^policy/log_std/kernel/sac_policy_opt_1/Assign)^policy/main_graph_0/hidden_0/bias/Assign8^policy/main_graph_0/hidden_0/bias/sac_policy_opt/Assign:^policy/main_graph_0/hidden_0/bias/sac_policy_opt_1/Assign+^policy/main_graph_0/hidden_0/kernel/Assign:^policy/main_graph_0/hidden_0/kernel/sac_policy_opt/Assign<^policy/main_graph_0/hidden_0/kernel/sac_policy_opt_1/Assign)^policy/main_graph_0/hidden_1/bias/Assign8^policy/main_graph_0/hidden_1/bias/sac_policy_opt/Assign:^policy/main_graph_0/hidden_1/bias/sac_policy_opt_1/Assign+^policy/main_graph_0/hidden_1/kernel/Assign:^policy/main_graph_0/hidden_1/kernel/sac_policy_opt/Assign<^policy/main_graph_0/hidden_1/kernel/sac_policy_opt_1/Assign)^policy/main_graph_0/hidden_2/bias/Assign8^policy/main_graph_0/hidden_2/bias/sac_policy_opt/Assign:^policy/main_graph_0/hidden_2/bias/sac_policy_opt_1/Assign+^policy/main_graph_0/hidden_2/kernel/Assign:^policy/main_graph_0/hidden_2/kernel/sac_policy_opt/Assign<^policy/main_graph_0/hidden_2/kernel/sac_policy_opt_1/Assign)^policy/main_graph_0/hidden_3/bias/Assign8^policy/main_graph_0/hidden_3/bias/sac_policy_opt/Assign:^policy/main_graph_0/hidden_3/bias/sac_policy_opt_1/Assign+^policy/main_graph_0/hidden_3/kernel/Assign:^policy/main_graph_0/hidden_3/kernel/sac_policy_opt/Assign<^policy/main_graph_0/hidden_3/kernel/sac_policy_opt_1/Assign^policy/mu/bias/Assign%^policy/mu/bias/sac_policy_opt/Assign'^policy/mu/bias/sac_policy_opt_1/Assign^policy/mu/kernel/Assign'^policy/mu/kernel/sac_policy_opt/Assign)^policy/mu/kernel/sac_policy_opt_1/Assign^running_mean/Assign^running_variance/Assign8^target_network/critic/value/curiosity_value/bias/Assign:^target_network/critic/value/curiosity_value/kernel/Assign9^target_network/critic/value/encoder/hidden_0/bias/Assign;^target_network/critic/value/encoder/hidden_0/kernel/Assign9^target_network/critic/value/encoder/hidden_1/bias/Assign;^target_network/critic/value/encoder/hidden_1/kernel/Assign9^target_network/critic/value/encoder/hidden_2/bias/Assign;^target_network/critic/value/encoder/hidden_2/kernel/Assign9^target_network/critic/value/encoder/hidden_3/bias/Assign;^target_network/critic/value/encoder/hidden_3/kernel/Assign8^target_network/critic/value/extrinsic_value/bias/Assign:^target_network/critic/value/extrinsic_value/kernel/Assign*^target_network/normalization_steps/Assign#^target_network/running_mean/Assign'^target_network/running_variance/Assign^trainer_major_version/Assign^trainer_minor_version/Assign^trainer_patch_version/Assign^version_number/Assign"�