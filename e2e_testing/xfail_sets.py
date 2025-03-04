# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
# Also available under a BSD-style license. See LICENSE.

# This file describes the sets of tests expected to fail for each config.
# This information is deliberately kept in a side table, rather than
# in-situ on the test, as a deliberate layering decision: tests should
# have unique keys to identify them and enable side tables of various kinds
# (this includes down into lower parts of the stack, where a side table
# might be used to keep more elaborate sets of testing configurations).

from torch_mlir_e2e_test.test_suite import COMMON_TORCH_MLIR_LOWERING_XFAILS

REFBACKEND_XFAIL_SET = COMMON_TORCH_MLIR_LOWERING_XFAILS

EAGER_MODE_XFAIL_SET = {
    # RefBackend fails
    "TableBatchEmbeddingModule_basic",
    "QuantizedMLP_basic",
    "Matmul_vecmat",
    "BatchMlpLayerModule_basic"
}

MHLO_PASS_SET = {
    "ElementwiseClampModule_basic",
    "ElementwiseClampMinModule_basic",
    "ElementwiseClampMaxModule_basic",
    "BmmModule_basic",
    "BroadcastToModule_basic",
    "ElementwiseExpModule_basic",
    "ElementwiseLogModule_basic",
    "ElementwiseNegModule_basic",
    "ElementwiseSqrtModule_basic",
    "ElementwiseUnaryModule_basic",
    "ElementwiseUnsqueezeNegDimsModule_basic",
    "ExpandModule_basic",
    "MatmulBroadcastBatchDim_basic",
    "MatmulSingleDynamicBatchDim_basic",
    "Matmul_3d",
    "Matmul_4d",
    "MeanDtypeModule_basic",
    "MmTanhModule_basic",
    "ReduceFrobeniusNormKeepDimModule_basic",
    "ReduceSumDimIntListDtypeFloatModule_basic",
    "ReduceSumDimIntListDtypeIntModule_basic",
    "ReduceSumDimIntListKeepDimFloatModule_basic",
    "ReduceSumDimIntListKeepDimIntModule_basic",
    "ReduceSumDtypeFloatModule_basic",
    "ReduceSumDtypeIntModule_basic",
    "SelectIntModule_basic",
    "SliceSingleIdxModule_basic",
    "SqueezeDimModule_dynamic",
    "SqueezeDimModule_negDim",
    "ReduceFrobeniusNormModule_basic",
    "FlattenStaticModule_basic",
    "FlattenRank0Module_basic",
    "TensorsConcatNegativeDimModule_basic",
    "NumelModule_basic",
    "ReduceSumDimIntListEmptyDimModule_basic",
    "SqueezeModule_allUnitDim",
    "SqueezeDimModule_unitDim",
    "MeanModule_basic",
    "MeanDynamicSizesModule_basic",
    "MeanDimEmptyDimModule_basic",
    "NumToTensorFloatModule_basic",
    "AtenToDeviceModule_basic",
    "AvgPool2dStaticModule_basic",
    "Conv2dWithPaddingDilationStrideStaticModule_basic",
    "Convolution2DStaticModule_basic",
    "ConvolutionModule2DTransposeStridedStatic_basic",
    "ElementwiseCloneContiguousModule_basic",
    "ElementwiseCloneModule_basic",
    "ElementwiseBinaryStaticShapeModule_basic",
    "ReturnThreeTensorFloat32_basic",
    "BoolTensorReturnFalseModule_basic",
    "BoolTensorReturnTrueModule_basic",
    "BoolTensorReturnMixedModule_basic",
    "SqueezeModule_static",
    "TModuleRank1_basic",
    "TModuleRank0_basic",
    "ElementwiseToDtypeIdentityModule_basic",
    "View1DFoldModule_basic",
    "UnsafeView1DFoldModule_basic",
    "SqueezeDimModule_static",
    "SqueezeDimModule_identity",
    "SliceModule_basic",
    "SliceNegIdxModule_basic",
    "SliceOutOfLowerBoundStartIndexModule_basic",
    "SliceOutOfUpperBoundIndexModule_basic",
    "SliceStartEqEndModule_basic",
    "SliceSizeTwoStepModule_basic",
    "SliceWholeTensorModule_basic",
    "ReturnTwoTensorF32I64_basic",
    "Matmul4dStatic_basic",
    "Matmul_dot",
    "Matmul_2d",
    "Matmul_matvec",
    "Matmul_vecmat",
    "MaxPool2dWithIndicesStaticModule_basic",
    "MmDagModule_basic",
    "MmModule_basic",
    "MmModule_chained",
    "MaxPool2dStaticModule_basic",
    "PermuteModule_basic",
    "PermuteNegativeIndexModule_basic",
    "ZerosModuleDefaultDtype_basic",
    "ZerosModuleInt2D_basic",
    "ZerosModuleInt3D_basic",
    "ZerosModuleFloat2D_basic",
    "ZerosModuleFloat3D_basic",
    "ZerosModuleFalsePinMemory_basic",
    "OnesModuleDefaultDtype_basic",
    "OnesModuleInt_basic",
    "OnesModuleFloat_basic",
    "OnesModuleFalsePinMemory_basic",
    "NewZerosModuleDefaultDtype_basic",
    "NewZerosModuleInt2D_basic",
    "NewZerosModuleInt3D_basic",
    "NewZerosModuleFloat2D_basic",
    "NewZerosModuleFloat3D_basic",
    "NewZerosModuleFalsePinMemory_basic",
    "NewOnesModuleDefaultDtype_basic",
    "NewOnesModuleInt2D_basic",
    "NewOnesModuleInt3D_basic",
    "NewOnesModuleFloat2D_basic",
    "NewOnesModuleFloat3D_basic",
    "NewOnesModuleFalsePinMemory_basic",
    "DropoutEvalIntModule_basic",
    "DropoutEvalFloatModule_basic",
    "ContiguousModule_basic",
    "DropoutModule_basic",
    "ViewCollapseModule_basic",
    "ViewCollapseInferredDimModule_basic",
    "ViewDynamicExpandCollapseModule_basic",
    "ViewDynamicExpandModule_basic",
    "ViewExpandModule_basic",
    "ViewExpandOnesModule_basic",
    "ViewExpandOnesBeforeAndAfterModule_basic",
    "ViewExpandOnesMiddleModule_basic",
    "ViewExpandCollapseModule_basic",
    "ViewExpandCollapseWithOnesModule_basic",
    "ViewExpandInferredDimModule_basic",
    "ViewNoChangeStaticModule_basic",
    "ViewNoChange1dModule_basic",
    "ViewNoChange2dModule_basic",
    "ViewNoChange3dModule_basic",
    "UnsafeViewExpandModule_basic",
    "ReduceMaxAllDims_basic",
    "ReduceMaxFloatModule_basic",
    "ReduceMaxSignedIntModule_basic",
    "ReduceMaxUnsignedIntModule_basic",
    "ReduceSumDimIntListFloatModule_basic",
    "ReduceSumDimIntListIntModule_basic",
    "ReduceSumFloatModule_basic",
    "ReduceSumSignedIntModule_basic",
    "ReduceSumUnsignedIntModule_basic",
    "RepeatModule_basic",
    "ReshapeAliasCollapseModule_basic",
    "ReshapeAliasExpandModule_basic",
    "ReshapeExpandModule_basic",
    "RollModule_basic",
    "TestMultipleTensorReturn_basic",
    "AdaptiveAvgPool2dUnitOutputSizeStaticModule_basic",
    "BaddbmmStaticModule_basic",
    "BaddbmmBroadcast1DInputModule_basic",
    "BaddbmmBroadcast2DInputModule_basic",
    "NarrowHorizontalTest2_basic",
    "NarrowHorizontalTest_basic",
    "NarrowVerticalTest2_basic",
    "NarrowVerticalTest_basic",
    "NumToTensorIntModule_basic",
    "NumpyTRank0Module_basic",
    "NumpyTRank1Module_basic",
    "NumpyTRank2Module_basic",
    "NumpyTRankNStaticModule_basic",
    "NumpyTRankNDynamicModule_basic",
    "TModuleRank2_basic",
    "TensorLiteralModule_basic",
    "TensorsConcatModule_basic",
    "TensorOpaqueLiteralModule_basic",
    "TransposeIntModule_basic",
    "TransposeIntNegDimsModule_basic",
    "OnesModuleCPUDevice_basic",
    "Permute0RankModule_basic",
    "UnsafeViewCollapseModule_basic",
    "UnsafeViewDynamicExpandModule_basic",
}

# Write the TOSA set as a "passing" set as it is very early in development
# and very few tests work yet.
TOSA_PASS_SET = {
    "ElementwiseUnaryModule_basic",
    "ElementwiseBinaryModule_basic",
    "ElementwiseSigmoidModule_basic",
    "ElementwiseExpModule_basic",
    "ElementwiseReluModule_basic",
    "ElementwiseFloorModule_basic",
    "ElementwiseLogModule_basic",
    "ElementwiseBinaryStaticShapeModule_basic",
    "ElementwiseMinimumModule_basic",
    "ElementwiseMinimumIntModule_basic",
    "ElementwiseMaximumModule_basic",
    "ElementwiseMaximumIntModule_basic",
    "TanhBackward_basic",
    "ElementwiseAddModule_basic",
    "ReturnThreeTensorFloat32_basic",
    "AddCMulModule_basic",
    "AddCDivModule_basic",
    "SqueezeModule_broadcast",
    "BoolTensorReturnFalseModule_basic",
    "BoolTensorReturnTrueModule_basic",
    "BoolTensorReturnMixedModule_basic",
    "BoolTensorHandleSignless_basic",
    "ElementwiseRsqrtModule_basic",
    "SqueezeModule_static",
    "SqueezeModule_noUnitDim",
    "SqueezeModule_allUnitDim",
    "TModuleRank1_basic",
    "TModuleRank0_basic",
    "ElementwiseToDtypeIdentityModule_basic",
    "AtenToDeviceModule_basic",
    "View1DFoldModule_basic",
    "UnsafeView1DFoldModule_basic",
    "SqueezeDimModule_static",
    "SqueezeDimModule_identity",
    "SqueezeDimModule_unitDim",
    "ReturnTwoTensorF32I64_basic",
    "ElementwisePowModule_basic",
    "BmmModule_basic",
    "MmDagModule_basic",
    "Matmul4dStatic_basic",
    "Matmul_dot",
    "Matmul_3d",
    "RsubFloatModule_basic",
    "RsubFloatModule_noalpha_basic",
    "ElementwiseGtFloatScalarModule_basic",
    "ElementwiseGtIntScalarModule_basic",
    "ElementwiseGtMixed2ScalarModule_basic",
    "ElementwiseGtFloatTensorModule_basic",
    "ElementwiseGtIntTensorModule_basic",
    "ElementwiseLtFloatScalarModule_basic",
    "ElementwiseLtIntScalarModule_basic",
    "ElementwiseLtDiffWidthScalarModule_basic",
    "ElementwiseLtFloatTensorModule_basic",
    "ElementwiseLtIntTensorModule_basic",
    "ElementwiseEqFloatScalarModule_basic",
    "ElementwiseEqIntScalarModule_basic",
    "ElementwiseEqDiffWidthScalarModule_basic",
    "ElementwiseEqFloatTensorModule_basic",
    "ElementwiseEqIntTensorModule_basic",
    "ElementwiseMulScalarModule_int",
    "ElementwiseMulScalarModule_float",
    "ElementwiseMulTensorIntModule_basic",
    "ElementwiseDivScalarModule_basic",
    "ElementwiseSubScalarFloatModule_basic",
    "ElementwiseAddScalarFloatModule_basic",
    "ElementwiseMulScalarModule_float",
    "ElementwiseCeilModule_basic",
    "ElementwiseReciprocalModule_basic",
    "ElementwiseNotIntegerModule_basic",
    "ElementwiseNotInt32Module_basic",
    "TypePromotionAlphaWiderModule_basic",
    "Conv2dWithPaddingDilationStrideStaticModule_basic",
    "BatchNorm1DModule_basic",
    "BatchNorm1DWith2DInputModule_basic",
    "BatchNorm2DModule_basic",
    "BatchNorm3DModule_basic",
    "FlattenStaticModule_basic",
    "FlattenRank0Module_basic",
    "ElementwiseFlattenBroadcastModule_basic",
    "SquareModule_basic",
    "MaxPool2dStaticModule_basic",
    "ResNet18StaticModule_basic",
    "NativeLayerNormModule4D_basic",
    "LayerNormNormalizeOverAllDimsModule_basic",
    "PermuteModule_basic",
    "PermuteNegativeIndexModule_basic",
    "ElementwiseLog2Module_basic",
    "Threshold1dIntI32Module_basic",
    "Threshold1dFloatModule_basic",
    "Threshold2dFloatModule_basic",
    "Threshold3dFloatModule_basic",
    "ElementwiseSubScalarIntModule_basic",
    "ElementwiseAddScalarIntModule_basic",
    "ElementwiseMulScalarModule_basic",
    "ZerosModuleDefaultDtype_basic",
    "ZerosModuleInt2D_basic",
    "ZerosModuleInt3D_basic",
    "ZerosModuleFloat2D_basic",
    "ZerosModuleFloat3D_basic",
    "ZerosModuleFalsePinMemory_basic",
    "OnesModuleDefaultDtype_basic",
    "OnesModuleInt_basic",
    "OnesModuleFloat_basic",
    "OnesModuleFalsePinMemory_basic",
    "OnesModuleCPUDevice_basic",
    "NewZerosModuleDefaultDtype_basic",
    "NewZerosModuleInt2D_basic",
    "NewZerosModuleInt3D_basic",
    "NewZerosModuleFloat2D_basic",
    "NewZerosModuleFloat3D_basic",
    "NewZerosModuleFalsePinMemory_basic",
    "NewOnesModuleDefaultDtype_basic",
    "NewOnesModuleInt2D_basic",
    "NewOnesModuleInt3D_basic",
    "NewOnesModuleFloat2D_basic",
    "NewOnesModuleFloat3D_basic",
    "NewOnesModuleFalsePinMemory_basic",
    "SiluModule_basic",
    "DropoutEvalIntModule_basic",
    "DropoutEvalFloatModule_basic",
    "ContiguousModule_basic",
    "DropoutModule_basic",
    "ViewExpandModule_basic",
    "ViewExpandOnesModule_basic",
    "ViewExpandOnesBeforeAndAfterModule_basic",
    "ViewExpandOnesMiddleModule_basic",
    "ViewExpandCollapseModule_basic",
    "ViewExpandCollapseWithOnesModule_basic",
    "ViewCollapseInferredDimModule_basic",
    "ViewExpandInferredDimModule_basic",
    "ViewNoChangeStaticModule_basic",
    "UnsafeViewExpandModule_basic",
    "ReshapeCollapseModule_basic",
    "ElementwiseGeluModule_basic",
    "GeluBackwardModule_basic",
    "ElementwiseNeIntScalarModule_basic",
    "ElementwiseNeFloatTensorModule_basic",
    "Convolution2DStaticModule_basic",
    "ElementwiseNegModule_basic",
    "TestMultipleTensorReturn_basic",
    "TypeAsSameModule_basic",
    "AdaptiveAvgPool2dUnitOutputSizeStaticModule_basic",
    "BaddbmmDynamicModule_basic",
    "BaddbmmStaticModule_basic",
    "BaddbmmWithAlphaBetaModule_basic",
    "BaddbmmWithAlphaModule_basic",
    "BaddbmmWithBetaModule_basic",
    "BaddbmmBroadcast1DInputModule_basic",
    "BaddbmmBroadcast2DInputModule_basic",
    "NumpyTRank1Module_basic",
    "NumpyTRank2Module_basic",
    "NumpyTRankNStaticModule_basic",
    "NumpyTRankNDynamicModule_basic",
    "EmbeddingModuleI32Static_basic",
    "TModuleRank2_basic",
    "TransposeIntModule_basic",
    "TransposeIntNegDimsModule_basic",
    "ArgmaxModule_keepDim",
    "ArgmaxModule_with_dim",
    "_LogSoftmaxModuleStable_basic",
}

LTC_XFAIL_SET = {
    "_Convolution2DAllFalseModule_basic",
    "_Convolution2DBenchmarkModule_basic",
    "_Convolution2DCudnnModule_basic",
    "_Convolution2DDeterministicModule_basic",
    "_Convolution2DTF32Module_basic",
    "_ConvolutionDeprecated2DAllFalseModule_basic",
    "_ConvolutionDeprecated2DBenchmarkModule_basic",
    "_ConvolutionDeprecated2DDeterministicModule_basic",
    "AdaptiveAvgPool2dNonUnitOutputSizeDynamicModule_basic",
    "AdaptiveAvgPool2dNonUnitOutputSizeStaticModule_basic",
    "AddIntModule_basic",
    "BernoulliFloatModule_basic",
    "BernoulliModule_basic",
    "BernoulliTensorModule_basic",
    "BincountMinlengthModule_basic",
    "BincountModule_basic",
    "BincountStaticSizeModule_basic",
    "BoolFloatFalseModule_basic",
    "BoolFloatTrueModule_basic",
    "BoolIntFalseModule_basic",
    "BoolIntTrueModule_basic",
    "CeilFloatModule_basic",
    "DivFloatModule_basic",
    "DropoutTrainModule_basic",
    "ElementwiseAtenFloorDivideBroadcastModule_basic",
    "ElementwiseAtenFloorDivideModule_basic",
    "ElementwiseWhereScalarModule_basic",
    "ElementwiseWhereScalarOtherModule_basic",
    "ElementwiseWhereScalarSelfModule_basic",
    "ElementwiseWhereSelfModule_basic",
    "EmptyLikeMemoryFormatModule_basic",
    "EmptyLikeModule_defaultDtype",
    "EmptyLikeModule_falsePinMemory",
    "EmptyLikeModule_float",
    "EmptyLikeModule_int",
    "EqIntModule_basic",
    "Fill_TensorFloat64WithFloat32_basic",
    "Fill_TensorFloat64WithFloat64_basic",
    "Fill_TensorFloat64WithInt64_basic",
    "FullLikeModuleDefaultDtype_basic",
    "FullLikeModuleFalsePinMemory_basic",
    "FullLikeModuleFloat2D_basic",
    "FullLikeModuleFloat3DStatic_basic",
    "FullLikeModuleFloat3D_basic",
    "FullLikeModuleInt2DStatic_basic",
    "FullLikeModuleInt2D_basic",
    "FullLikeModuleInt3D_basic",
    "GeFloatIntModule_basic",
    "GeFloatModule_basic",
    "GeIntModule_basic",
    "GtFloatIntModule_basic",
    "GtIntModule_basic",
    "HBC_basic",
    "HardTanhIntModule_basic",
    "HardTanhModule_basic",
    "IndexPut1DFloatAccumulateModule_basic",
    "IndexPut1DFloatNonAccumulateModule_basic",
    "IndexPut1DIntAccumulateModule_basic",
    "IndexPut1DIntNonAccumulateModule_basic",
    "IndexPut2DFloatAccumulateModule_basic",
    "IndexPut2DFloatNonAccumulateModule_basic",
    "IndexPut2DIntAccumulateModule_basic",
    "IndexPut2DIntNonAccumulateModule_basic",
    "IndexPut3DFloatAccumulateModule_basic",
    "IndexPut3DFloatNonAccumulateModule_basic",
    "IndexPut3DIntAccumulateModule_basic",
    "IndexPut3DIntNonAccumulateModule_basic",
    "IndexPutHackedTwin1DFloatAccumulateModule_basic",
    "IndexPutHackedTwin1DFloatNonAccumulateModule_basic",
    "IndexPutHackedTwin1DIntAccumulateModule_basic",
    "IndexPutHackedTwin1DIntNonAccumulateModule_basic",
    "IndexPutHackedTwin2DFloatAccumulateModule_basic",
    "IndexPutHackedTwin2DFloatNonAccumulateModule_basic",
    "IndexPutHackedTwin2DIntAccumulateModule_basic",
    "IndexPutHackedTwin2DIntNonAccumulateModule_basic",
    "IndexPutHackedTwin3DFloatAccumulateModule_basic",
    "IndexPutHackedTwin3DFloatNonAccumulateModule_basic",
    "IndexPutHackedTwin3DIntAccumulateModule_basic",
    "IndexPutHackedTwin3DIntNonAccumulateModule_basic",
    "IndexPutImpl1DFloatAccumulateModule_basic",
    "IndexPutImpl1DFloatNonAccumulateModule_basic",
    "IndexPutImpl1DIntAccumulateModule_basic",
    "IndexPutImpl1DIntNonAccumulateModule_basic",
    "IndexPutImpl2DFloatAccumulateModule_basic",
    "IndexPutImpl2DFloatNonAccumulateModule_basic",
    "IndexPutImpl3DFloatAccumulateModule_basic",
    "IndexPutImpl3DFloatNonAccumulateModule_basic",
    "IndexTensorModule3dInput_basic",
    "IndexTensorModule_basic",
    "IndexTensorMultiInputContiguousCenter_basic",
    "IndexTensorMultiInputNonContiguous_basic",
    "IndexTensorMultiInputOneDim_basic",
    "IndexTensorMultiInputThreeIndexers_basic",
    "IndexTensorMultiInput_basic",
    "IndexTensorSelectDimModule_basic",
    "IndexTensorMultiInputContiguousOneDimDynamic_basic",
    "IndexTensorMultiInputNonContiguousOneDimDynamic_basic",
    "IndexTensorMultiInputNonContiguousDynamic_basic",
    "IndexTensorMultiInputNonContiguousMultipleStaticDims_basic",
    "IndexTensorHackedTwinModule_basic",
    "IndexTensorHackedTwinModule3dInput_basic",
    "IndexTensorHackedTwinMultiInputNonContiguousMultipleStaticDims_basic",
    "Matmul_dot",
    "Matmul_matvec",
    "MulIntModule_basic",
    "NeFloatIntModule_basic",
    "NeIntModule_basic",
    "NewEmptyModuleDefaultDtype_basic",
    "NewEmptyModuleFalsePinMemory_basic",
    "NewEmptyModuleFloat2D_basic",
    "NewEmptyModuleFloat3D_basic",
    "NewEmptyModuleInt2D_basic",
    "NewEmptyModuleInt3D_basic",
    "NewEmptyModuleLayoutIntDtype_basic",
    "NewEmptyModuleNonDefaultFloatDtype_basic",
    "NewEmptyModuleNonDefaultIntDtype_basic",
    "NewOnesModuleDefaultDtype_basic",
    "NewOnesModuleFalsePinMemory_basic",
    "NewOnesModuleFloat2D_basic",
    "NewOnesModuleFloat3D_basic",
    "NewOnesModuleInt2D_basic",
    "NewOnesModuleInt3D_basic",
    "OnesLikeModule_defaultDtype",
    "OnesLikeModule_falsePinMemory",
    "OnesLikeModule_float",
    "OnesLikeModule_int",
    "QuantizedMLP_basic",
    "RandLikeDtypeModule_basic",
    "RandLikeModule_basic",
    "RollModule_basic",
    "ScalarImplicitFloatModule_basic",
    "ScalarImplicitIntModule_basic",
    "SliceEndSleStartModule_basic",
    "SliceOutOfUpperBoundIndexModule_basic",
    "SliceStartEqEndModule_basic",
    "SqrtIntModule_basic",
    "StdBiasedModule_basic",
    "StdDimBiasedModule_basic",
    "StdDimKeepDimFalseModule_basic",
    "StdDimKeepDimTrueModule_basic",
    "StdDimEmptyDimModule_basic",
    "StdDimNoneDimModule_basic",
    "StdUnbiasedModule_basic",
    "SubFloatModule_basic",
    "SubIntModule_basic",
    "TableBatchEmbeddingModule_basic",
    "TensorsConcatNegativeDimModule_basic",
    "TensorToBoolZeroRank_basic",
    "TensorToBool_basic",
    "TensorToFloatZeroRank_basic",
    "TensorToFloat_basic",
    "TensorToIntZeroRank_basic",
    "TensorToInt_basic",
    "TensorsConcatModule_basic",
    "UniformModule_basic",
    "UniformStaticModule_basic",
    "UnsafeViewCollapseDynamicWithAtenSizeIntModule_basic",
    "ViewCollapseDynamicWithAtenSizeIntModule_basic",
    "AtenEmbeddingBagSumExample_basic",
    "Aten_EmbeddingBagExample_basic",
    "ElementwiseRemainderScalarModule_Int_Float_basic",
    "ElementwiseRemainderScalarModule_Float_basic",
    "ElementwiseRemainderScalarModule_Int_basic",
    "ElementwiseRemainderScalarModule_Bool_basic",
}
