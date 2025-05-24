import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_admin/core/utils/constants.dart';

import '../../../../core/model/button_model.dart';
import '../../../../core/model/text_field_model.dart';
import '../../../../core/utils/service/firebase_firestore_service.dart';
import '../../../../core/utils/service/firebase_storage_service.dart';
import '../../../../core/utils/service/image_picker_service.dart';
import '../../data/model/user_data_model.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  final ImagePickerService _imagePickerService;
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseStorageService _firebaseStorageService;

  PersonalDataBloc(this._imagePickerService, this._firebaseFirestoreService,
      this._firebaseStorageService)
      : super(PersonalDataInitial()) {
    on<PersonalDataEvent>((event, emit) async {
      if (event is PickImageEvent) {
        await _imagePickerService.pickImage().then((value) {
          if (value != null) {
            imageFile = value;
            emit(PickImageSuccess());
          }
        });
      }

      if (event is UpdateChangeEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          final hasTextFieldChanges =
              _fullName!.text != event.userData.userName;
          bool isImageChanged = false;

          if (imageFile != null && event.userData.imageFile != null) {
            final newImageLength = await File(imageFile!.path).length();
            final oldImageLength =
                await File(event.userData.imageFile!).length();
            isImageChanged = newImageLength != oldImageLength;
          } else {
            isImageChanged = imageFile != null;
          }

          if (hasTextFieldChanges || isImageChanged) {
            _isLoading = true;
            emit(UpdateUserDataLoading());

            String? imageUrl;

            if (isImageChanged) {
              imageUrl = await _firebaseStorageService.uploadImage(imageFile!);
            }

            final data = event.userData.copyWith(
                userImage: imageUrl ?? event.userData.userImage,
                imageFile: imageFile?.path ?? event.userData.imageFile,
                userName: _fullName!.text);
            await _updateUserData(data, emit);
          }
        }
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

  Future<void> _updateUserData(
      UserDataModel data, Emitter<PersonalDataState> emit) async {
    await _firebaseFirestoreService
        .updataData(
            collectionName: Constants.userCollection,
            docID: data.userID,
            data: data.toJson())
        .then((value) {
      _isLoading = false;
      emit(UpdateUserDataSuccess());
    }).catchError((error) {
      log("error from update product: $error");
      _isLoading = false;
      emit(UpdateUserDataFailure(error.code));
    });
  }

  File? imageFile;
  bool _isLoading = false;

  TextEditingController? _fullName;
  TextEditingController? _userRole;
  TextEditingController? _email;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initTextFields(UserDataModel userDataModel) {
    _fullName = TextEditingController(text: userDataModel.userName);
    _userRole = TextEditingController(text: userDataModel.userRole);
    _email = TextEditingController(text: userDataModel.userEmail);
  }

  List<TextFieldModel> textFieldItems() {
    return [
      TextFieldModel(
        controller: _fullName,
        lable: "User Name",
        hintText: "Type something longer here...",
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      ),
      TextFieldModel(
          controller: _userRole,
          lable: "User Role",
          readOnly: true,
          hintText: "Type something longer here..."),
      TextFieldModel(
          controller: _email,
          lable: "User Email",
          readOnly: true,
          hintText: "Type something longer here..."),
    ];
  }

  List<ButtonModel> buttonItems(UserDataModel userData) {
    return [
      ButtonModel(
          isLoading: _isLoading,
          buttonName: "Update Changes",
          onTap: () => add(UpdateChangeEvent(userData: userData))),
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
