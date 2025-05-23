part of 'product_bloc.dart';

sealed class ProductEvent {}

final class PickImageEvent extends ProductEvent {}

final class RemovePickImageEvent extends ProductEvent {
  final int index;

  RemovePickImageEvent(this.index);
}

final class UpdateProductEvent extends ProductEvent {
  final ProductDataModel productDataModel;
  final BuildContext context;
  UpdateProductEvent(this.context, {required this.productDataModel});
}

final class CancelChangesEvent extends ProductEvent {
  final ProductDataModel productDataModel;

  CancelChangesEvent(this.productDataModel);
}

final class DeleteProductEvent extends ProductEvent {
  final String productID;
  DeleteProductEvent(this.productID);
}

final class SelectProductImageEvent extends ProductEvent {
  final int index;
  SelectProductImageEvent({required this.index});
}
