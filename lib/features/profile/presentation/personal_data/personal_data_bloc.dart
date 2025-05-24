import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/button_model.dart';
import '../../../../core/model/text_field_model.dart';
import '../../../../core/utils/service/image_picker_service.dart';
import '../../data/model/user_data_model.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  final ImagePickerService _imagePickerService;
  PersonalDataBloc(this._imagePickerService) : super(PersonalDataInitial()) {
    on<PersonalDataEvent>((event, emit) async {
      if (event is PickImageEvent) {
        await _imagePickerService.pickImage().then((value) {
          if (value != null) {
            imageFile = value;
            emit(PickImageSuccess());
          }
        });
      }

      if (event is CancleChangeEvent) {
        final hasImageChanges = imageFile != null;
        final hasTextFieldChanges = _fullName!.text != event.userData.userName;

        if (hasImageChanges || hasTextFieldChanges) {
          if (hasImageChanges) {
            imageFile = null;
          }

          if (hasTextFieldChanges) {
            _fullName?.text = event.userData.userName;
          }

          emit(CancleChanges());
        }
      }
    });
  }

  File? imageFile;

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

  List<ButtonModel> buttonItems(UserDataModel userData) {
    return [
      ButtonModel(buttonName: "Update Changes"),
      ButtonModel(
          buttonName: "Cancel Changes",
          onTap: () => add(CancleChangeEvent(userData: userData))),
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
