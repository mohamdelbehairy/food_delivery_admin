part of 'add_product_bloc.dart';

sealed class AddProductEvent {}

final class AddProductButtonEvent extends AddProductEvent {
  final BuildContext context;
  AddProductButtonEvent(this.context);
}

final class SelectCategoryEvent extends AddProductEvent {
  final int index;
  SelectCategoryEvent(this.index);
}

final class CategoryButtonEvent extends AddProductEvent {
  final int index;
  CategoryButtonEvent(this.index);
}

final class ProductDefaultEvent extends AddProductEvent {}

final class PickImageEvent extends AddProductEvent {}

final class RemoveImageEvent extends AddProductEvent {
  final int index;
  RemoveImageEvent(this.index);
}