part of 'add_product_bloc.dart';

sealed class AddProductState {}

final class AddProductInitial extends AddProductState {}

final class SelectCategoryState extends AddProductState {}