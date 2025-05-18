import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_admin/core/utils/helper.dart';

import '../../../../core/utils/constants.dart';
import '../model/user_data_model.dart';
import 'user_data_repo.dart';

class UserDataRepoImpl extends UserDataRepo {
  final FirebaseFirestore _firestore;

  UserDataRepoImpl(this._firestore);
  @override
  Future<void> addUserData(UserDataModel userDataModel) async {
    await _firestore
        .collection(Constants.userCollection)
        .doc(Helper.getIt.get<FirebaseAuth>().currentUser!.uid)
        .set(userDataModel.toJson());
  }

  @override
  Future<UserDataModel> getFutureUserData() async {
    final snapshot = await _firestore
        .collection(Constants.userCollection)
        .doc(Helper.getIt.get<FirebaseAuth>().currentUser!.uid)
        .get();

    return UserDataModel.fromJson(snapshot.data());
  }
}
