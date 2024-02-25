import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String id;
  final String name;
  final String? icon;
  final List<String> categoryIds;
  final bool? isFeatured; //
  final bool? isActive;

  BrandModel({
    required this.id,
    required this.name,
    this.icon,
    required this.categoryIds,
    this.isFeatured,
    this.isActive=true
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'isFeatured': isFeatured ?? false,
      'isActive': isActive,
      'categoryIds': categoryIds
    };
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return BrandModel(
        id: snapshot['id'],
        name: snapshot['name'],
        icon: snapshot['icon'],
        isFeatured: snapshot['isFeatured'],
        isActive: snapshot['isActive'],
        categoryIds:List<String>.from(snapshot['categoryIds'] as List)
    );
  }
}