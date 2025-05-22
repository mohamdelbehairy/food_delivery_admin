part of 'product_bloc.dart';

sealed class ProductEvent {}

final class UpdateProductEvent extends ProductEvent {
  final ProductDataModel productDataModel;
  UpdateProductEvent(this.productDataModel);
}

final class CancelChangesEvent extends ProductEvent {
  final ProductDataModel productDataModel;

  CancelChangesEvent(this.productDataModel);
}

final class DeleteProductEvent extends ProductEvent {
  final String productID;
  DeleteProductEvent(this.productID);
}
