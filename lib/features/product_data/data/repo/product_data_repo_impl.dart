import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utils/constants.dart';
import '../model/product_data_model.dart';
import 'product_data_repo.dart';

class ProductDataRepoImpl extends ProductDataRepo {
  final FirebaseFirestore _firebaseFirestore;

  ProductDataRepoImpl(this._firebaseFirestore);
  @override
  Future<void> addProductData(ProductDataModel productDataModel) async {
    await _firebaseFirestore
        .collection(Constants.productCollection)
        .doc(productDataModel.productID)
        .set(productDataModel.toJson());
  }

  @override
  void getProductData(
      void Function(QuerySnapshot<Map<String, dynamic>>)? onData) {
    _firebaseFirestore
        .collection(Constants.productCollection)
        .snapshots()
        .listen(onData);
  }

  @override
  Future<void> deleteProduct(String productID) async {
    await _firebaseFirestore
        .collection(Constants.productCollection)
        .doc(productID)
        .delete();
  }
}
