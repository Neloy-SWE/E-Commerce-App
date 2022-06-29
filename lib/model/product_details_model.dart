// To parse this JSON data, do
//
//     final showProductModel = showProductModelFromMap(jsonString);

import 'dart:convert';

class ProductDetailsModel {
  ProductDetailsModel({
    this.status,
    this.productDetailsData,
  });

  final bool? status;
  final ProductDetailsData? productDetailsData;

  factory ProductDetailsModel.fromJson(String str) => ProductDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDetailsModel.fromMap(Map<String, dynamic> json) => ProductDetailsModel(
    status: json["status"] == null ? null : json["status"],
    productDetailsData: json["data"] == null ? null : ProductDetailsData.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "data": productDetailsData == null ? null : productDetailsData!.toMap(),
  };
}

class ProductDetailsData {
  ProductDetailsData({
    this.id,
    this.name,
    this.businessId,
    this.type,
    this.unitId,
    this.subUnitIds,
    this.brandId,
    this.categoryId,
    this.subCategoryId,
    this.tax,
    this.taxType,
    this.enableStock,
    this.alertQuantity,
    this.sku,
    this.barcodeType,
    this.expiryPeriod,
    this.expiryPeriodType,
    this.enableSrNo,
    this.weight,
    this.productCustomField1,
    this.productCustomField2,
    this.productCustomField3,
    this.productCustomField4,
    this.image,
    this.productDescription,
    this.createdBy,
    this.warrantyId,
    this.isInactive,
    this.notForSelling,
    this.createdAt,
    this.updatedAt,
    this.price,
  });

  final int? id;
  final String? name;
  final int? businessId;
  final String? type;
  final int? unitId;
  final int? subUnitIds;
  final int? brandId;
  final int? categoryId;
  final int? subCategoryId;
  final dynamic tax;
  final String? taxType;
  final int? enableStock;
  final String? alertQuantity;
  final String? sku;
  final String? barcodeType;
  final dynamic expiryPeriod;
  final dynamic expiryPeriodType;
  final int? enableSrNo;
  final String? weight;
  final String? productCustomField1;
  final String? productCustomField2;
  final String? productCustomField3;
  final String? productCustomField4;
  final String? image;
  final dynamic productDescription;
  final int? createdBy;
  final dynamic warrantyId;
  final int? isInactive;
  final int? notForSelling;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? price;

  factory ProductDetailsData.fromJson(String str) => ProductDetailsData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductDetailsData.fromMap(Map<String, dynamic> json) => ProductDetailsData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    businessId: json["business_id"] == null ? null : json["business_id"],
    type: json["type"] == null ? null : json["type"],
    unitId: json["unit_id"] == null ? null : json["unit_id"],
    subUnitIds: json["sub_unit_ids"] == null ? null : json["sub_unit_ids"],
    brandId: json["brand_id"] == null ? null : json["brand_id"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    subCategoryId: json["sub_category_id"] == null ? null : json["sub_category_id"],
    tax: json["tax"],
    taxType: json["tax_type"] == null ? null : json["tax_type"],
    enableStock: json["enable_stock"] == null ? null : json["enable_stock"],
    alertQuantity: json["alert_quantity"] == null ? null : json["alert_quantity"],
    sku: json["sku"] == null ? null : json["sku"],
    barcodeType: json["barcode_type"] == null ? null : json["barcode_type"],
    expiryPeriod: json["expiry_period"],
    expiryPeriodType: json["expiry_period_type"],
    enableSrNo: json["enable_sr_no"] == null ? null : json["enable_sr_no"],
    weight: json["weight"] == null ? null : json["weight"],
    productCustomField1: json["product_custom_field1"] == null ? null : json["product_custom_field1"],
    productCustomField2: json["product_custom_field2"] == null ? null : json["product_custom_field2"],
    productCustomField3: json["product_custom_field3"] == null ? null : json["product_custom_field3"],
    productCustomField4: json["product_custom_field4"] == null ? null : json["product_custom_field4"],
    image: json["image"] == null ? null : json["image"],
    productDescription: json["product_description"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    warrantyId: json["warranty_id"],
    isInactive: json["is_inactive"] == null ? null : json["is_inactive"],
    notForSelling: json["not_for_selling"] == null ? null : json["not_for_selling"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    price: json["price"] == null ? null : json["price"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "business_id": businessId == null ? null : businessId,
    "type": type == null ? null : type,
    "unit_id": unitId == null ? null : unitId,
    "sub_unit_ids": subUnitIds == null ? null : subUnitIds,
    "brand_id": brandId == null ? null : brandId,
    "category_id": categoryId == null ? null : categoryId,
    "sub_category_id": subCategoryId == null ? null : subCategoryId,
    "tax": tax,
    "tax_type": taxType == null ? null : taxType,
    "enable_stock": enableStock == null ? null : enableStock,
    "alert_quantity": alertQuantity == null ? null : alertQuantity,
    "sku": sku == null ? null : sku,
    "barcode_type": barcodeType == null ? null : barcodeType,
    "expiry_period": expiryPeriod,
    "expiry_period_type": expiryPeriodType,
    "enable_sr_no": enableSrNo == null ? null : enableSrNo,
    "weight": weight == null ? null : weight,
    "product_custom_field1": productCustomField1 == null ? null : productCustomField1,
    "product_custom_field2": productCustomField2 == null ? null : productCustomField2,
    "product_custom_field3": productCustomField3 == null ? null : productCustomField3,
    "product_custom_field4": productCustomField4 == null ? null : productCustomField4,
    "image": image == null ? null : image,
    "product_description": productDescription,
    "created_by": createdBy == null ? null : createdBy,
    "warranty_id": warrantyId,
    "is_inactive": isInactive == null ? null : isInactive,
    "not_for_selling": notForSelling == null ? null : notForSelling,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "price": price == null ? null : price,
  };
}
