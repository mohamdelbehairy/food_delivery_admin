part of 'product_bloc.dart';

sealed class ProductEvent {}

final class DeleteProductEvent extends ProductEvent {
  final String productID;
  DeleteProductEvent(this.productID);
}