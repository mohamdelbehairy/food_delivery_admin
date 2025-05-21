import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_data_model.dart';

abstract class ProductDataRepo {
  Future<void> addProductData(ProductDataModel productDataModel);
  void getProductData(void Function(QuerySnapshot<Map<String, dynamic>>)? onData,);
}