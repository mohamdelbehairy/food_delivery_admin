import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/service/firebase_auth_service.dart';
import '../../../../../core/utils/service/shared_pref_service.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final FirebaseAuthService _firebaseAuthService;
  final SharedPrefService _sharedPrefService;
  LogoutBloc(this._firebaseAuthService, this._sharedPrefService)
      : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) async {
      if (event is LogoutButtonEvent) {
        isLoading = true;
        emit(LogoutLoading());
        await Future.delayed(const Duration(seconds: 2));
        await _firebaseAuthService.logout().then((value) async {
          await _sharedPrefService.remove(Constants.userID);
          isLoading = false;
          emit(LogoutSuccess());
        }).catchError((error) {
          log("error from logout: $error");
          isLoading = false;
          emit(LogoutFailure(error.code));
        });
      }
    });
  }
  bool isLoading = false;
}
