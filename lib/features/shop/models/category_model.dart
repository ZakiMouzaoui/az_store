import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final bool? isFeatured;
  final String? parentId;
  final String? promoBanner;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    this.isFeatured,
    this.parentId,
    this.promoBanner,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'isFeatured': isFeatured,
      'parentId': parentId,
      'promoBanner': promoBanner,
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return CategoryModel(
      id: snapshot['id'],
      name: snapshot['name'],
      icon: snapshot['icon'],
      isFeatured: snapshot['isFeatured'],
      parentId: snapshot['parentId'],
      promoBanner: snapshot['promoBanner'],
    );
  }
}