import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/service/shared_pref_service.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/repo/auth_repo.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRepo _authRepo;
  final SharedPrefService _sharedPrefService;
  LogoutBloc(this._authRepo, this._sharedPrefService) : super(LogoutInitial()) {
    on<LogoutEvent>((event, emit) async {
      if (event is LogoutButtonEvent) {
        await _authRepo.logout().then((value) async {
          await _sharedPrefService.remove(Constants.userID);
          emit(LogoutSuccess());
        }).catchError((error) {
          log("error from logout: $error");
          emit(LogoutFailure(error.code));
        });
      }
    });
  }
}
