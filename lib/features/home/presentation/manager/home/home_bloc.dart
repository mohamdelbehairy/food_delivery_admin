import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../add_product/data/model/product_bottom_sheet_item_model.dart';
import '../../../../add_product/presentation/views/add_product_view.dart';
import '../../../../chat/presentation/views/chat_view.dart';
import '../../../../product_data/data/model/product_data_model.dart';
import '../../../../profile/data/model/user_data_model.dart';
import '../../../data/model/bottom_nav_model.dart';
import '../../../data/model/category_item_model.dart';
import '../../views/main_home_view.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseFirestoreService _firebaseFirestoreService;
  HomeBloc(this._firebaseFirestoreService) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      if (event is ChangeBottomNavEvent) {
        if (currentIndex == event.index) return;
        currentIndex = event.index;
        emit(ChangeBottomNav());
      }
      if (event is ChangeCategoryEvent) {
        if (categoryIndex == event.index) return;
        categoryIndex = event.index;
        productsList = _getProducts();
        emit(ChangeCategory());
      }

      if (event is SelectProductCategoryEvent) {
        if (categoryProductIndex == event.index) return;
        categoryProductIndex = event.index;
        emit(ChangeCategoryProduct());
      }

      if (event is GetProductDateEvent) {
        allProductsList = event.productList;
        productsList = _getProducts();
        emit(GetProductDataSuccess());
      }

      if (event is GetUserDataEvent) {
        userData = event.userData;
        emit(GetUserDataSuccess());
      }
    });

    _firebaseFirestoreService.getData(
        collectionName: Constants.productCollection,
        onData: (snapshot) {
          allProductsList.clear();
          _burgerList.clear();
          _tacoList.clear();
          _drinkList.clear();
          _pizzaList.clear();

          for (var element in snapshot.docs) {
            var product = ProductDataModel.fromJson(element.data());
            allProductsList.add(product);

            if (product.productCategory == "Burger") {
              _burgerList.add(product);
            }
            if (product.productCategory == "Taco") {
              _tacoList.add(product);
            }
            if (product.productCategory == "Drink") {
              _drinkList.add(product);
            }
            if (product.productCategory == "Pizza") {
              _pizzaList.add(product);
            }
          }
          add(GetProductDateEvent(allProductsList));
        });

    _firebaseFirestoreService.getData(
        collectionName: Constants.userCollection,
        onData: (snapshot) {
          if (snapshot.docs.isEmpty) return;
          final List<UserDataModel> users = snapshot.docs
              .map((e) => UserDataModel.fromJson(e.data()))
              .toList();

          final user = users.firstWhere((e) =>
              e.userID == Helper.getIt.get<FirebaseAuth>().currentUser!.uid);

          add(GetUserDataEvent(user));
        });
  }
  List<ProductDataModel> _getProducts() {
    if (categoryIndex == 1) return _tacoList;
    if (categoryIndex == 2) return _drinkList;
    if (categoryIndex == 3) return _pizzaList;

    return _burgerList;
  }

  List<ProductDataModel> allProductsList = [];
  List<ProductDataModel> productsList = [];

  final List<ProductDataModel> _burgerList = [];
  final List<ProductDataModel> _tacoList = [];
  final List<ProductDataModel> _drinkList = [];
  final List<ProductDataModel> _pizzaList = [];

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

  int categoryProductIndex = -1;
  List<ProductBottomSheetItemModel> bottomSheetItems() {
    return [
      ProductBottomSheetItemModel(image: Assets.imagesBurger, title: "Burger"),
      ProductBottomSheetItemModel(image: Assets.imagesTaco, title: "Taco"),
      ProductBottomSheetItemModel(image: Assets.imagesDrink, title: "Drink"),
      ProductBottomSheetItemModel(image: Assets.imagesPizza, title: "Pizza"),
    ];
  }

  GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();
  UserDataModel? userData;
}
