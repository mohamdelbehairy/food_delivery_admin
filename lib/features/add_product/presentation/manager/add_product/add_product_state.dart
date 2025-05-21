part of 'add_product_bloc.dart';

sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class SelectCategoryState extends AddProductState {}

final class AddProductLoading extends AddProductState {}

final class AddProductSuccess extends AddProductState {}

final class AddProductFailure extends AddProductState {}

final class PickImageSuccess extends AddProductState {}