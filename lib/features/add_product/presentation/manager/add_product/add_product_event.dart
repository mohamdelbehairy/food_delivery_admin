part of 'add_product_bloc.dart';

sealed class AddProductEvent {}

final class AddProductButtonEvent extends AddProductEvent {}

final class SelectCategoryEvent extends AddProductEvent {
  final int index;
  SelectCategoryEvent(this.index);
}

final class CategoryButtonEvent extends AddProductEvent {
  final int index;
  CategoryButtonEvent(this.index);
}

final class ProductDefaultEvent extends AddProductEvent {}