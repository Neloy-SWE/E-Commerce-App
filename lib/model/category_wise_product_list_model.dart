// To parse this JSON data, do
//
//     final categoryWiseProductListModel = categoryWiseProductListModelFromMap(jsonString);

import 'dart:convert';

class CategoryWiseProductListModel {
  CategoryWiseProductListModel({
    this.status,
    this.categoryWiseProductListData,
  });

  final bool? status;
  final List<CategoryWiseProductListData>? categoryWiseProductListData;

  factory CategoryWiseProductListModel.fromJson(String str) => CategoryWiseProductListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryWiseProductListModel.fromMap(Map<String, dynamic> json) => CategoryWiseProductListModel(
    status: json["status"] == null ? null : json["status"],
    categoryWiseProductListData: json["data"] == null ? null : List<CategoryWiseProductListData>.from(json["data"].map((x) => CategoryWiseProductListData.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "data": categoryWiseProductListData == null ? null : List<dynamic>.from(categoryWiseProductListData!.map((x) => x.toMap())),
  };
}

class CategoryWiseProductListData {
  CategoryWiseProductListData({
    this.id,
    this.name,
    this.sku,
    this.categoryId,
    this.enableStock,
    this.price,
    this.imageUrl,
  });

  final int? id;
  final String? name;
  final String? sku;
  final String? categoryId;
  final String? enableStock;
  final String? price;
  final dynamic imageUrl;

  factory CategoryWiseProductListData.fromJson(String str) => CategoryWiseProductListData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryWiseProductListData.fromMap(Map<String, dynamic> json) => CategoryWiseProductListData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    sku: json["sku"] == null ? null : json["sku"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    enableStock: json["enable_stock"] == null ? null : json["enable_stock"],
    price: json["price"] == null ? null : json["price"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "sku": sku == null ? null : sku,
    "category_id": categoryId == null ? null : categoryId,
    "enable_stock": enableStock == null ? null : enableStock,
    "price": price == null ? null : price,
    "image_url": imageUrl,
  };
}
