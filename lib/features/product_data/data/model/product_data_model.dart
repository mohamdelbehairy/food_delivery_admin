import 'package:cloud_firestore/cloud_firestore.dart';

class ProductDataModel {
  final String productID,
      productName,
      productPrice,
      productCategory,
      productDescription,
      ownerID;

  final List<String> productImages;
  final DateTime createdAt;

  ProductDataModel(
      {required this.productID,
      required this.productName,
      required this.productPrice,
      required this.productCategory,
      required this.productDescription,
      required this.ownerID,
      required this.productImages,
      required this.createdAt});

  factory ProductDataModel.fromJson(json) {
    return ProductDataModel(
        productID: json['productID'],
        productName: json['productName'],
        productPrice: json['productPrice'],
        productCategory: json['productCategory'],
        productDescription: json['productDescription'],
        ownerID: json['ownerID'],
        productImages: List<String>.from(json['productImages']),
        createdAt: (json['createdAt'] as Timestamp).toDate());
  }

  toJson() {
    return {
      'productID': productID,
      'productName': productName,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'ownerID': ownerID,
      'productImages': productImages,
      'createdAt': createdAt
    };
  }
}
