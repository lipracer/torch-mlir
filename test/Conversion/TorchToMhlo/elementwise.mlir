// RUN: torch-mlir-opt <%s -convert-torch-to-mhlo -split-input-file -verify-diagnostics | FileCheck %s

// CHECK-LABEL:  func.func @torch.aten.gelu(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[STR:.*]] = torch.constant.str "none"
// CHECK:         %[[T1:.*]] = "chlo.constant_like"(%[[T0]]) {value = 1.000000e+00 : f32} : (tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = "chlo.constant_like"(%[[T0]]) {value = 2.000000e+00 : f32} : (tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T3:.*]] = "chlo.constant_like"(%[[T0]]) {value = 5.000000e-01 : f32} : (tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T4:.*]] = mhlo.rsqrt %[[T2]] : tensor<?x?xf32>
// CHECK:         %[[T5:.*]] = mhlo.multiply %[[T0]], %[[T4]] : tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = chlo.erf %[[T5]] : tensor<?x?xf32> -> tensor<?x?xf32>
// CHECK:         %[[T7:.*]] = mhlo.add %[[T6]], %[[T1]] : tensor<?x?xf32>
// CHECK:         %[[T8:.*]] = mhlo.multiply %[[T7]], %[[T3]] : tensor<?x?xf32>
// CHECK:         %[[T9:.*]] = mhlo.multiply %[[T0]], %[[T8]] : tensor<?x?xf32>
// CHECK:         %[[T10:.*]] = torch_c.from_builtin_tensor %[[T9]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T10]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.gelu(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
    %str = torch.constant.str "none"
    %0 = torch.aten.gelu %arg0, %str : !torch.vtensor<[?,?],f32>, !torch.str -> !torch.vtensor<[?,?],f32>
    return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.tanh$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = mhlo.tanh %[[T0]] : tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = torch_c.from_builtin_tensor %[[T1]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T2]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.tanh$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.tanh %arg0 : !torch.vtensor<[?,?],f32> -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.log$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = mhlo.log %[[T0]] : tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = torch_c.from_builtin_tensor %[[T1]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T2]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.log$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.log %arg0 : !torch.vtensor<[?,?],f32> -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.exp$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = mhlo.exponential %[[T0]] : tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = torch_c.from_builtin_tensor %[[T1]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T2]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.exp$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.exp %arg0 : !torch.vtensor<[?,?],f32> -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.neg$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = mhlo.negate %[[T0]] : tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = torch_c.from_builtin_tensor %[[T1]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T2]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.neg$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.neg %arg0 : !torch.vtensor<[?,?],f32> -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.addscalar$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT9:.*]] = torch.constant.int 9
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT9]]
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_add %[[T0]], %[[T4]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.addscalar$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int9 = torch.constant.int 9
  %int1 = torch.constant.int 1
  %0 = torch.aten.add.Scalar %arg0, %int9, %int1 : !torch.vtensor<[?,?],f32>, !torch.int, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.addscalar$alpha(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT9:.*]] = torch.constant.int 9
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT9]]
// CHECK:         %[[INT2:.*]] = torch.constant.int 2
// CHECK:         %[[T2:.*]] = torch_c.to_i64 %[[INT2]]
// CHECK:         %[[T3:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T4:.*]] = mhlo.convert(%[[T3]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T5:.*]] = mhlo.reshape %[[T4]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T6:.*]] = tensor.from_elements %[[T2]] : tensor<1xi64>
// CHECK:         %[[T7:.*]] = mhlo.convert(%[[T6]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T8:.*]] = mhlo.reshape %[[T7]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T9:.*]] = chlo.broadcast_multiply %[[T5]], %[[T8]] : (tensor<f32>, tensor<f32>) -> tensor<f32>
// CHECK:         %[[T10:.*]] = chlo.broadcast_add %[[T0]], %[[T9]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T11:.*]] = torch_c.from_builtin_tensor %[[T10]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T11]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.addscalar$alpha(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int9 = torch.constant.int 9
  %int2 = torch.constant.int 2
  %0 = torch.aten.add.Scalar %arg0, %int9, %int2 : !torch.vtensor<[?,?],f32>, !torch.int, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.addtensor$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T2:.*]] = chlo.broadcast_add %[[T0]], %[[T1]] : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.addtensor$basic(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int1 = torch.constant.int 1
  %0 = torch.aten.add.Tensor %arg0, %arg1, %int1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.addtensor$alpha(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT2:.*]] = torch.constant.int 2
// CHECK:         %[[T2:.*]] = torch_c.to_i64 %[[INT2]]
// CHECK:         %[[T3:.*]] = tensor.from_elements %[[T2]] : tensor<1xi64>
// CHECK:         %[[T4:.*]] = mhlo.convert(%[[T3]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T5:.*]] = mhlo.reshape %[[T4]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T6:.*]] = chlo.broadcast_multiply %[[T1]], %[[T5]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T7:.*]] = chlo.broadcast_add %[[T0]], %[[T6]] : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T8:.*]] = torch_c.from_builtin_tensor %[[T7]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T8]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.addtensor$alpha(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int2 = torch.constant.int 2
  %0 = torch.aten.add.Tensor %arg0, %arg1, %int2 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.addtensor$promote(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],si32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],si64>) -> !torch.vtensor<[?,?],si64> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],si32> -> tensor<?x?xi32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],si64> -> tensor<?x?xi64>
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T2:.*]] = mhlo.convert(%[[T0]]) : (tensor<?x?xi32>) -> tensor<?x?xi64>
// CHECK:         %[[T3:.*]] = chlo.broadcast_add %[[T2]], %[[T1]] : (tensor<?x?xi64>, tensor<?x?xi64>) -> tensor<?x?xi64>
// CHECK:         %[[T4:.*]] = torch_c.from_builtin_tensor %[[T3]] : tensor<?x?xi64> -> !torch.vtensor<[?,?],si64>
// CHECK:         return %[[T4]] : !torch.vtensor<[?,?],si64>
func.func @torch.aten.addtensor$promote(%arg0: !torch.vtensor<[?,?],si32>, %arg1: !torch.vtensor<[?,?],si64>) -> !torch.vtensor<[?,?],si64> {
  %int1 = torch.constant.int 1
  %0 = torch.aten.add.Tensor %arg0, %arg1, %int1 : !torch.vtensor<[?,?],si32>, !torch.vtensor<[?,?],si64>, !torch.int -> !torch.vtensor<[?,?],si64>
  return %0 : !torch.vtensor<[?,?],si64>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.subscalar$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT9:.*]] = torch.constant.int 9
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT9]]
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_subtract %[[T0]], %[[T4]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.subscalar$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int9 = torch.constant.int 9
  %int1 = torch.constant.int 1
  %0 = torch.aten.sub.Scalar %arg0, %int9, %int1 : !torch.vtensor<[?,?],f32>, !torch.int, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.rsubscalar$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT9:.*]] = torch.constant.int 9
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT9]]
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_subtract %[[T4]], %[[T0]] : (tensor<f32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.rsubscalar$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int9 = torch.constant.int 9
  %int1 = torch.constant.int 1
  %0 = torch.aten.rsub.Scalar %arg0, %int9, %int1 : !torch.vtensor<[?,?],f32>, !torch.int, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.subscalar$alpha(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT9:.*]] = torch.constant.int 9
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT9]]
// CHECK:         %[[INT2:.*]] = torch.constant.int 2
// CHECK:         %[[T2:.*]] = torch_c.to_i64 %[[INT2]]
// CHECK:         %[[T3:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T4:.*]] = mhlo.convert(%[[T3]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T5:.*]] = mhlo.reshape %[[T4]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T6:.*]] = tensor.from_elements %[[T2]] : tensor<1xi64>
// CHECK:         %[[T7:.*]] = mhlo.convert(%[[T6]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T8:.*]] = mhlo.reshape %[[T7]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T9:.*]] = chlo.broadcast_multiply %[[T5]], %[[T8]] : (tensor<f32>, tensor<f32>) -> tensor<f32>
// CHECK:         %[[T10:.*]] = chlo.broadcast_subtract %[[T0]], %[[T9]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T11:.*]] = torch_c.from_builtin_tensor %[[T10]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T11]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.subscalar$alpha(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int9 = torch.constant.int 9
  %int2 = torch.constant.int 2
  %0 = torch.aten.sub.Scalar %arg0, %int9, %int2 : !torch.vtensor<[?,?],f32>, !torch.int, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.subtensor$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T2:.*]] = chlo.broadcast_subtract %[[T0]], %[[T1]] : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.subtensor$basic(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int1 = torch.constant.int 1
  %0 = torch.aten.sub.Tensor %arg0, %arg1, %int1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.subtensor$alpha(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT2:.*]] = torch.constant.int 2
// CHECK:         %[[T2:.*]] = torch_c.to_i64 %[[INT2]]
// CHECK:         %[[T3:.*]] = tensor.from_elements %[[T2]] : tensor<1xi64>
// CHECK:         %[[T4:.*]] = mhlo.convert(%[[T3]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T5:.*]] = mhlo.reshape %[[T4]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T6:.*]] = chlo.broadcast_multiply %[[T1]], %[[T5]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T7:.*]] = chlo.broadcast_subtract %[[T0]], %[[T6]] : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T8:.*]] = torch_c.from_builtin_tensor %[[T7]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T8]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.subtensor$alpha(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int2 = torch.constant.int 2
  %0 = torch.aten.sub.Tensor %arg0, %arg1, %int2 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.subtensor$promote(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],si32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],si64>) -> !torch.vtensor<[?,?],si64> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],si32> -> tensor<?x?xi32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],si64> -> tensor<?x?xi64>
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T2:.*]] = mhlo.convert(%[[T0]]) : (tensor<?x?xi32>) -> tensor<?x?xi64>
// CHECK:         %[[T3:.*]] = chlo.broadcast_subtract %[[T2]], %[[T1]] : (tensor<?x?xi64>, tensor<?x?xi64>) -> tensor<?x?xi64>
// CHECK:         %[[T4:.*]] = torch_c.from_builtin_tensor %[[T3]] : tensor<?x?xi64> -> !torch.vtensor<[?,?],si64>
// CHECK:         return %[[T4]] : !torch.vtensor<[?,?],si64>
func.func @torch.aten.subtensor$promote(%arg0: !torch.vtensor<[?,?],si32>, %arg1: !torch.vtensor<[?,?],si64>) -> !torch.vtensor<[?,?],si64> {
  %int1 = torch.constant.int 1
  %0 = torch.aten.sub.Tensor %arg0, %arg1, %int1 : !torch.vtensor<[?,?],si32>, !torch.vtensor<[?,?],si64>, !torch.int -> !torch.vtensor<[?,?],si64>
  return %0 : !torch.vtensor<[?,?],si64>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.mulscalar$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT9:.*]] = torch.constant.int 9
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT9]]
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_multiply %[[T0]], %[[T4]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.mulscalar$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int9 = torch.constant.int 9
  %0 = torch.aten.mul.Scalar %arg0, %int9 : !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.multensor$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = chlo.broadcast_multiply %[[T0]], %[[T1]] : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.multensor$basic(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.mul.Tensor %arg0, %arg1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[?,?],f32> -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.divscalar$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT9:.*]] = torch.constant.int 9
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT9]]
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_divide %[[T0]], %[[T4]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.divscalar$basic(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %int9 = torch.constant.int 9
  %0 = torch.aten.div.Scalar %arg0, %int9 : !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.divtensor$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = chlo.broadcast_divide %[[T0]], %[[T1]] : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.divtensor$basic(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.div.Tensor %arg0, %arg1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[?,?],f32> -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.gt.scalar(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],i1> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[INT3:.*]] = torch.constant.int 3
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[INT3]]
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_compare %[[T0]], %[[T4]] {compare_type = #chlo<comparison_type FLOAT>, comparison_direction = #chlo<comparison_direction GT>} : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xi1>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xi1> -> !torch.vtensor<[?,?],i1>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],i1>
func.func @torch.aten.gt.scalar(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],i1> {
  %int3 = torch.constant.int 3
  %0 = torch.aten.gt.Scalar %arg0, %int3 : !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],i1>
  return %0 : !torch.vtensor<[?,?],i1>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.gt.tensor(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[64],f32> -> tensor<64xf32>
// CHECK:         %[[T2:.*]] = chlo.broadcast_compare %[[T0]], %[[T1]] {compare_type = #chlo<comparison_type FLOAT>, comparison_direction = #chlo<comparison_direction GT>} : (tensor<?x?xf32>, tensor<64xf32>) -> tensor<?x?xi1>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xi1> -> !torch.vtensor<[?,?],i1>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],i1>
func.func @torch.aten.gt.tensor(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
  %0 = torch.aten.gt.Tensor %arg0, %arg1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[64],f32> -> !torch.vtensor<[?,?],i1>
  return %0 : !torch.vtensor<[?,?],i1>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.lt.tensor(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[64],f32> -> tensor<64xf32>
// CHECK:         %[[T2:.*]] = chlo.broadcast_compare %[[T0]], %[[T1]] {compare_type = #chlo<comparison_type FLOAT>, comparison_direction = #chlo<comparison_direction LT>} : (tensor<?x?xf32>, tensor<64xf32>) -> tensor<?x?xi1>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xi1> -> !torch.vtensor<[?,?],i1>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],i1>
func.func @torch.aten.lt.tensor(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
  %0 = torch.aten.lt.Tensor %arg0, %arg1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[64],f32> -> !torch.vtensor<[?,?],i1>
  return %0 : !torch.vtensor<[?,?],i1>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.eq.tensor(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[64],f32> -> tensor<64xf32>
// CHECK:         %[[T2:.*]] = chlo.broadcast_compare %[[T0]], %[[T1]] {compare_type = #chlo<comparison_type FLOAT>, comparison_direction = #chlo<comparison_direction EQ>} : (tensor<?x?xf32>, tensor<64xf32>) -> tensor<?x?xi1>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xi1> -> !torch.vtensor<[?,?],i1>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],i1>
func.func @torch.aten.eq.tensor(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
  %0 = torch.aten.eq.Tensor %arg0, %arg1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[64],f32> -> !torch.vtensor<[?,?],i1>
  return %0 : !torch.vtensor<[?,?],i1>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.ne.tensor(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[64],f32> -> tensor<64xf32>
// CHECK:         %[[T2:.*]] = chlo.broadcast_compare %[[T0]], %[[T1]] {compare_type = #chlo<comparison_type FLOAT>, comparison_direction = #chlo<comparison_direction NE>} : (tensor<?x?xf32>, tensor<64xf32>) -> tensor<?x?xi1>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xi1> -> !torch.vtensor<[?,?],i1>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],i1>
func.func @torch.aten.ne.tensor(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[64],f32>) -> !torch.vtensor<[?,?],i1> {
  %0 = torch.aten.ne.Tensor %arg0, %arg1 : !torch.vtensor<[?,?],f32>, !torch.vtensor<[64],f32> -> !torch.vtensor<[?,?],i1>
  return %0 : !torch.vtensor<[?,?],i1>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.permute$basic(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[4,64],f32>) -> !torch.vtensor<[64,4],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[4,64],f32> -> tensor<4x64xf32>
// CHECK:         %[[INT0:.*]] = torch.constant.int 0
// CHECK:         %[[INT1:.*]] = torch.constant.int 1
// CHECK:         %[[T1:.*]] = torch.prim.ListConstruct %[[INT1]], %[[INT0]] : (!torch.int, !torch.int) -> !torch.list<int>
// CHECK:         %[[T2:.*]] = "mhlo.transpose"(%[[T0]]) {permutation = dense<[1, 0]> : tensor<2xi64>} : (tensor<4x64xf32>) -> tensor<64x4xf32>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<64x4xf32> -> !torch.vtensor<[64,4],f32>
// CHECK:         return %[[T3]] : !torch.vtensor<[64,4],f32>
func.func @torch.aten.permute$basic(%arg0: !torch.vtensor<[4,64],f32>) -> !torch.vtensor<[64,4],f32> {
  %int0 = torch.constant.int 0
  %int1 = torch.constant.int 1
  %0 = torch.prim.ListConstruct %int1, %int0 : (!torch.int, !torch.int) -> !torch.list<int>
  %1 = torch.aten.permute %arg0, %0 : !torch.vtensor<[4,64],f32>, !torch.list<int> -> !torch.vtensor<[64,4],f32>
  return %1 : !torch.vtensor<[64,4],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.relu(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = "chlo.constant_like"(%[[T0]]) {value = 0.000000e+00 : f32} : (tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = mhlo.maximum %[[T0]], %[[T1]] : tensor<?x?xf32>
// CHECK:         %[[T3:.*]] = torch_c.from_builtin_tensor %[[T2]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T3]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.relu(%arg0: !torch.vtensor<[?,?],f32>) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.relu %arg0 : !torch.vtensor<[?,?],f32> -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.addscalar$variable(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.float) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_f64 %[[ARG1]]
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xf64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xf64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = tensor.from_elements %[[T1]] : tensor<1xf64>
// CHECK:         %[[T6:.*]] = mhlo.convert(%[[T5]]) : (tensor<1xf64>) -> tensor<1xf32>
// CHECK:         %[[T7:.*]] = mhlo.reshape %[[T6]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T8:.*]] = chlo.broadcast_multiply %[[T4]], %[[T7]] : (tensor<f32>, tensor<f32>) -> tensor<f32>
// CHECK:         %[[T9:.*]] = chlo.broadcast_add %[[T0]], %[[T8]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T10:.*]] = torch_c.from_builtin_tensor %[[T9]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T10]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.addscalar$variable(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.float) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.add.Scalar %arg0, %arg1, %arg1: !torch.vtensor<[?,?],f32>, !torch.float, !torch.float -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.addtensor$variable(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG2:.*]]: !torch.float) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T2:.*]] = torch_c.to_f64 %[[ARG2]]
// CHECK:         %[[T3:.*]] = tensor.from_elements %[[T2]] : tensor<1xf64>
// CHECK:         %[[T4:.*]] = mhlo.convert(%[[T3]]) : (tensor<1xf64>) -> tensor<1xf32>
// CHECK:         %[[T5:.*]] = mhlo.reshape %[[T4]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T6:.*]] = chlo.broadcast_multiply %[[T1]], %[[T5]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T7:.*]] = chlo.broadcast_add %[[T0]], %[[T6]] : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
// CHECK:         %[[T8:.*]] = torch_c.from_builtin_tensor %[[T7]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T8]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.addtensor$variable(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.vtensor<[?,?],f32>, %arg2: !torch.float) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.add.Tensor %arg0, %arg1, %arg2: !torch.vtensor<[?,?],f32>, !torch.vtensor<[?,?],f32>, !torch.float -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.mulscalar$variable(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.int) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[ARG1]]
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_multiply %[[T0]], %[[T4]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.mulscalar$variable(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.int) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.mul.Scalar %arg0, %arg1: !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.divscalar$variable(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.int) -> !torch.vtensor<[?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[ARG1]]
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_divide %[[T0]], %[[T4]] : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xf32>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xf32> -> !torch.vtensor<[?,?],f32>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],f32>
func.func @torch.aten.divscalar$variable(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.int) -> !torch.vtensor<[?,?],f32> {
  %0 = torch.aten.div.Scalar %arg0, %arg1: !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],f32>
  return %0 : !torch.vtensor<[?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.gt.scalar$variable(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?],f32>, %[[ARG1:.*]]: !torch.int) -> !torch.vtensor<[?,?],i1> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?],f32> -> tensor<?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_i64 %[[ARG1]]
// CHECK:         %[[T2:.*]] = tensor.from_elements %[[T1]] : tensor<1xi64>
// CHECK:         %[[T3:.*]] = mhlo.convert(%[[T2]]) : (tensor<1xi64>) -> tensor<1xf32>
// CHECK:         %[[T4:.*]] = mhlo.reshape %[[T3]] : (tensor<1xf32>) -> tensor<f32>
// CHECK:         %[[T5:.*]] = chlo.broadcast_compare %[[T0]], %[[T4]] {compare_type = #chlo<comparison_type FLOAT>, comparison_direction = #chlo<comparison_direction GT>} : (tensor<?x?xf32>, tensor<f32>) -> tensor<?x?xi1>
// CHECK:         %[[T6:.*]] = torch_c.from_builtin_tensor %[[T5]] : tensor<?x?xi1> -> !torch.vtensor<[?,?],i1>
// CHECK:         return %[[T6]] : !torch.vtensor<[?,?],i1>
func.func @torch.aten.gt.scalar$variable(%arg0: !torch.vtensor<[?,?],f32>, %arg1: !torch.int) -> !torch.vtensor<[?,?],i1> {
  %0 = torch.aten.gt.Scalar %arg0, %arg1: !torch.vtensor<[?,?],f32>, !torch.int -> !torch.vtensor<[?,?],i1>
  return %0 : !torch.vtensor<[?,?],i1>
}

// CHECK-LABEL:  func.func @torch.aten.div.Tensor_mode$trunc(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?,?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?,?,?],f32>) -> !torch.vtensor<[?,?,?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?,?,?],f32> -> tensor<?x?x?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?,?,?],f32> -> tensor<?x?x?x?xf32>
// CHECK:         %[[STR:.*]] = torch.constant.str "trunc"
// CHECK:         %[[T2:.*]] = chlo.broadcast_divide %[[T0]], %[[T1]] : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
// CHECK:         %[[T3:.*]] = mhlo.sign %[[T2]] : tensor<?x?x?x?xf32>
// CHECK:         %[[T4:.*]] = mhlo.abs %[[T2]] : tensor<?x?x?x?xf32>
// CHECK:         %[[T5:.*]] = mhlo.floor %[[T4]] : tensor<?x?x?x?xf32>
// CHECK:         %[[T6:.*]] = mhlo.multiply %[[T3]], %[[T5]] : tensor<?x?x?x?xf32>
// CHECK:         %[[T7:.*]] = torch_c.from_builtin_tensor %[[T6]] : tensor<?x?x?x?xf32> -> !torch.vtensor<[?,?,?,?],f32>
// CHECK:         return %[[T7]] : !torch.vtensor<[?,?,?,?],f32>
func.func @torch.aten.div.Tensor_mode$trunc(%arg0: !torch.vtensor<[?,?,?,?],f32>, %arg1: !torch.vtensor<[?,?,?,?],f32>) -> !torch.vtensor<[?,?,?,?],f32> {
  %str = torch.constant.str "trunc"
  %0 = torch.aten.div.Tensor_mode %arg0, %arg1, %str : !torch.vtensor<[?,?,?,?],f32>, !torch.vtensor<[?,?,?,?],f32>, !torch.str -> !torch.vtensor<[?,?,?,?],f32>
  return %0 : !torch.vtensor<[?,?,?,?],f32>
}

// -----

// CHECK-LABEL:  func.func @torch.aten.div.Tensor_mode$floor(
// CHECK-SAME:         %[[ARG0:.*]]: !torch.vtensor<[?,?,?,?],f32>, %[[ARG1:.*]]: !torch.vtensor<[?,?,?,?],f32>) -> !torch.vtensor<[?,?,?,?],f32> {
// CHECK:         %[[T0:.*]] = torch_c.to_builtin_tensor %[[ARG0]] : !torch.vtensor<[?,?,?,?],f32> -> tensor<?x?x?x?xf32>
// CHECK:         %[[T1:.*]] = torch_c.to_builtin_tensor %[[ARG1]] : !torch.vtensor<[?,?,?,?],f32> -> tensor<?x?x?x?xf32>
// CHECK:         %[[STR:.*]] = torch.constant.str "floor"
// CHECK:         %[[T2:.*]] = chlo.broadcast_divide %[[T0]], %[[T1]] : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
// CHECK:         %[[T3:.*]] = mhlo.floor %[[T2]] : tensor<?x?x?x?xf32>
// CHECK:         %[[T4:.*]] = torch_c.from_builtin_tensor %[[T3]] : tensor<?x?x?x?xf32> -> !torch.vtensor<[?,?,?,?],f32>
// CHECK:         return %[[T4]] : !torch.vtensor<[?,?,?,?],f32>
func.func @torch.aten.div.Tensor_mode$floor(%arg0: !torch.vtensor<[?,?,?,?],f32>, %arg1: !torch.vtensor<[?,?,?,?],f32>) -> !torch.vtensor<[?,?,?,?],f32> {
  %str = torch.constant.str "floor"
  %0 = torch.aten.div.Tensor_mode %arg0, %arg1, %str : !torch.vtensor<[?,?,?,?],f32>, !torch.vtensor<[?,?,?,?],f32>, !torch.str -> !torch.vtensor<[?,?,?,?],f32>
  return %0 : !torch.vtensor<[?,?,?,?],f32>
}
