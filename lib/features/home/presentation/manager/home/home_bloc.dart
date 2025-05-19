import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../../../chat/presentation/views/chat_view.dart';
import '../../../data/model/bottom_nav_model.dart';
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
    });
  }
  int currentIndex = 0;
  List<BottomNavModel> bottomList = [
    BottomNavModel(image: Assets.imagesHome, index: 0, lable: "Home"),
    BottomNavModel(image: Assets.imagesChat, index: 1, lable: "Chat"),
  ];

  List<Widget> views = const [
    MainHomeView(),
    ChatView(),
  ];
}
