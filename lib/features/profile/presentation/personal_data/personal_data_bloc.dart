import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/model/button_model.dart';
import 'package:food_delivery_admin/core/model/text_field_model.dart';

import '../../data/model/user_data_model.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  PersonalDataBloc() : super(PersonalDataInitial()) {
    on<PersonalDataEvent>((event, emit) {});
  }

  TextEditingController? _fullName;
  TextEditingController? _userRole;
  TextEditingController? _email;

  void initTextFields(UserDataModel userDataModel) {
    _fullName = TextEditingController(text: userDataModel.userName);
    _userRole = TextEditingController(text: userDataModel.userRole);
    _email = TextEditingController(text: userDataModel.userEmail);
  }

  List<TextFieldModel> textFieldItems() {
    return [
      TextFieldModel(
          controller: _fullName,
          lable: "Full Name",
          hintText: "Type something longer here..."),
      TextFieldModel(
          controller: _userRole,
          lable: "User Role",
          readOnly: true,
          hintText: "Type something longer here..."),
      TextFieldModel(
          controller: _email,
          lable: "Email",
          readOnly: true,
          hintText: "Type something longer here..."),
    ];
  }

  List<ButtonModel> buttonItems() {
    return [
      ButtonModel(
        buttonName: "Update Changes",
      ),
      ButtonModel(
        buttonName: "Cancel Changes",
      ),
    ];
  }

  @override
  Future<void> close() {
    _fullName?.dispose();
    _userRole?.dispose();
    _email?.dispose();
    return super.close();
  }
}
