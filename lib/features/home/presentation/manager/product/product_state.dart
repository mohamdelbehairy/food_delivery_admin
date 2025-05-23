part of 'product_bloc.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class PickImageSuccess extends ProductState {}

final class UpdateProductSuccess extends ProductState {}

final class CancleChanges extends ProductState {}

final class DeleteProductSuccess extends ProductState {}

final class ProductFailure extends ProductState {
  final String errorMessage;
  ProductFailure(this.errorMessage);
}

final class SelectProductImageState extends ProductState {}