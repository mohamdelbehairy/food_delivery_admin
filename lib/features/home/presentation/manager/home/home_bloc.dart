import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/features/add_product/presentation/views/add_product_view.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../chat/presentation/views/chat_view.dart';
import '../../../data/model/bottom_nav_model.dart';
import '../../../data/model/category_item_model.dart';
import '../../views/main_home_view.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      if (event is ChangeBottomNavEvent) {
        if (currentIndex == event.index) return;
        currentIndex = event.index;
        emit(ChangeBottomNav());
      }
      if (event is ChangeCategoryEvent) {
        if (categoryIndex == event.index) return;
        categoryIndex = event.index;
        emit(ChangeCategory());
      }
    });
  }
  int currentIndex = 0;
  List<BottomNavModel> bottomList = [
    BottomNavModel(image: Assets.imagesHome, index: 0, lable: "Home"),
    BottomNavModel(image: Assets.imagesChat, index: 1, lable: "Chat"),
    BottomNavModel(
        image: Assets.imagesAddProduct, index: 2, lable: "Add Product"),
  ];

  List<Widget> views = const [
    MainHomeView(),
    ChatView(),
    AddProductView(),
  ];

  int categoryIndex = 0;
  List<CategoryItemModel> categoryItems = [
    CategoryItemModel(image: Assets.imagesBurger, title: "Burger", index: 0),
    CategoryItemModel(image: Assets.imagesTaco, title: "Taco", index: 1),
    CategoryItemModel(image: Assets.imagesDrink, title: "Drink", index: 2),
    CategoryItemModel(image: Assets.imagesPizza, title: "Pizza", index: 3),
  ];
}
