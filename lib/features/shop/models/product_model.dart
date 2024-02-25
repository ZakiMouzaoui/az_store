import 'package:cloud_firestore/cloud_firestore.dart';

enum ProductType{
  single, variation
}

class Product {
  final String id;
  final String name;
  final int stock;
  final double price;
  final int? discountPercent;
  final String description;
  final String brandId;
  final String brandName;
  final String categoryId;
  final String parentCategoryId;
  final bool isFeatured;
  final List<String> images;
  final List<ProductAttributeModel> productAttributeModels;
  final List<SKU> skus;
  double? rating;
  int? totalReviews=0;

  Product({
    required this.id,
    required this.name,
    required this.stock,
    required this.price,
    this.discountPercent,
    required this.description,
    required this.brandId,
    required this.brandName,
    required this.categoryId,
    required this.parentCategoryId,
    required this.isFeatured,
    required this.images,
    required this.productAttributeModels,
    required this.skus,
    this.rating,
    this.totalReviews
  });

  // Convert a Product instance into a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'stock': stock,
      'price': price,
      'discountPercent': discountPercent ?? 0,
      'description': description,
      'brandId': brandId,
      'brandName': brandName,
      'categoryId': categoryId,
      'parentCategoryId': parentCategoryId,
      'isFeatured': isFeatured,
      'images': images,
      'productAttributeModels': productAttributeModels
          .map((model) => model.toJson())
          .toList(),
      'skus': skus.map((sku) => sku.toJson()).toList(),
      'rating': rating,
      'totalReviews': totalReviews
    };
  }

  factory Product.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
    return Product(
        id: snapshot.id,
      name: snapshot["name"],
      stock: snapshot["stock"],
      price: snapshot["price"],
      discountPercent: snapshot['discountPercent'],
      description: snapshot["description"],
      brandId: snapshot["brandId"],
      brandName: snapshot["brandName"],
      categoryId: snapshot["categoryId"],
      parentCategoryId: snapshot["parentCategoryId"] ?? "",
      isFeatured: snapshot["isFeatured"],
      images: List<String>.from(snapshot["images"] as List),
      productAttributeModels: List<ProductAttributeModel>.from(
          (snapshot["productAttributeModels"] as List).map((e) => ProductAttributeModel.fromSnapshot(e)).toList()
      ) ,
      skus: List<SKU>.from(
          (snapshot["skus"] as List).map((e) => SKU.fromSnapshot(e)).toList()
      ),
      rating: snapshot.get("rating") != null ? snapshot["rating"] : null,
      totalReviews: snapshot.get("totalReviews") != null ? snapshot["totalReviews"] : 0
    );
  }
}

class ProductAttributeModel {
  final String name;
  final List<String> values;

  ProductAttributeModel({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributeModel.fromSnapshot(Map<String, dynamic> snapshot) {
    return ProductAttributeModel(
      name: snapshot['name'],
      values: List<String>.from(snapshot['values'] as List),
    );
  }
}

class SKU {
  final String id;
  final String description;
  final int stock;
  final double price;
  final String image;
  final Map<String, String> variations;

  SKU({
    required this.id,
    required this.description,
    required this.stock,
    required this.price,
    required this.image,
    required this.variations,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'stock': stock,
      'price': price,
      'image': image,
      'variations': variations,
    };
  }

  factory SKU.fromSnapshot(Map<String, dynamic> snapshot) {
    return SKU(
      id: snapshot['id'],
      description: snapshot['description'],
      stock: snapshot['stock'],
      price: snapshot['price'],
      image: snapshot['image'],
      variations: Map<String, String>.from(snapshot['variations']),
    );
  }
}