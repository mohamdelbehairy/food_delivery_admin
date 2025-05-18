import '../model/user_data_model.dart';

abstract class UserDataRepo {
  Future<void> addUserData(UserDataModel userDataModel);
  Future<UserDataModel> getFutureUserData();
}
