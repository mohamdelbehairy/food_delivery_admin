class ProductDataModel {
  final String productID,
      productName,
      productPrice,
      productCategory,
      productDescription,
      ownerID;

  ProductDataModel(
      {required this.productID,
      required this.productName,
      required this.productPrice,
      required this.productCategory,
      required this.productDescription,
      required this.ownerID});

  factory ProductDataModel.fromJson(json) {
    return ProductDataModel(
        productID: json['productID'],
        productName: json['productName'],
        productPrice: json['productPrice'],
        productCategory: json['productCategory'],
        productDescription: json['productDescription'],
        ownerID: json['ownerID']);
  }

  toJson() {
    return {
      'productID': productID,
      'productName': productName,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'ownerID': ownerID
    };
  }
}
