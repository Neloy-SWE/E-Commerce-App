import 'dart:convert';

class ProfileModel {
  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.role,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final dynamic address;
  final dynamic image;
  final String? role;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ProfileModel.fromJson(String str) => ProfileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"] == null ? null : json["address"],
    image: json["image"] == null ? null : json["image"],
    role: json["role"] == null ? null : json["role"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "address": address == null ? null : address,
    "image": image == null ? null : image,
    "role": role == null ? null : role,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
