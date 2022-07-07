import 'dart:convert';

class CategoryListModel {
  CategoryListModel({
    this.status,
    this.categoryListData,
  });

  final bool? status;
  final List<CategoryListData>? categoryListData;

  factory CategoryListModel.fromJson(String str) => CategoryListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryListModel.fromMap(Map<String, dynamic> json) => CategoryListModel(
    status: json["status"] == null ? null : json["status"],
    categoryListData: json["data"] == null ? null : List<CategoryListData>.from(json["data"].map((x) => CategoryListData.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status == null ? null : status,
    "data": categoryListData == null ? null : List<dynamic>.from(categoryListData!.map((x) => x.toMap())),
  };
}

class CategoryListData {
  CategoryListData({
    this.id,
    this.name,
    this.businessId,
    this.shortCode,
    this.parentId,
    this.createdBy,
    this.categoryType,
    this.description,
    this.slug,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? businessId;
  final String? shortCode;
  final String? parentId;
  final String? createdBy;
  final String? categoryType;
  final String? description;
  final dynamic slug;
  final DateTime? deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CategoryListData.fromJson(String str) => CategoryListData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryListData.fromMap(Map<String, dynamic> json) => CategoryListData(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    businessId: json["business_id"] == null ? null : json["business_id"],
    shortCode: json["short_code"] == null ? null : json["short_code"],
    parentId: json["parent_id"] == null ? null : json["parent_id"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    categoryType: json["category_type"] == null ? null : json["category_type"],
    description: json["description"] == null ? null : json["description"],
    slug: json["slug"],
    deletedAt: json["deleted_at"] == null ? null : DateTime.parse(json["deleted_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "business_id": businessId == null ? null : businessId,
    "short_code": shortCode == null ? null : shortCode,
    "parent_id": parentId == null ? null : parentId,
    "created_by": createdBy == null ? null : createdBy,
    "category_type": categoryType == null ? null : categoryType,
    "description": description == null ? null : description,
    "slug": slug,
    "deleted_at": deletedAt == null ? null : deletedAt!.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
