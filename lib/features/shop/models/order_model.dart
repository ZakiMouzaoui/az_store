import 'package:cloud_firestore/cloud_firestore.dart';

import '../../personalization/models/address_model.dart';
import 'cart_item_model.dart';

enum OrderStatus { processing, completed, canceled }

class OrderModel {
  final String? id;
  final String trackingCode;
  final List<CartItemModel> items;
  final double totalAmount;
  final String userId;
  final OrderStatus status;
  final DateTime? orderDate;
  final String? couponCode;
  final double? discountAmount;
  final DateTime deliveryDate;
  final Map<String, dynamic> shippingAddress;

  const OrderModel({
    this.id,
    required this.trackingCode,
    required this.items,
    required this.totalAmount,
    required this.userId,
    this.status=OrderStatus.processing,
    this.orderDate,
    required this.deliveryDate,
    this.couponCode,
    this.discountAmount,
    required this.shippingAddress
  });

  Map<String, dynamic> toJson() {
    return {
      'trackingCode': trackingCode,
      'items': items.map((item) => item.toJson()).toList(),
      'totalAmount': totalAmount,
      'userId': userId,
      'status': status.toString().split('.').last,
      'orderDate': Timestamp.fromDate(DateTime.now()), 
      'deliveryDate': Timestamp.fromDate(deliveryDate),
      'couponCode': couponCode,
      'discountAmount': discountAmount,
      'shippingAddress': shippingAddress
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return OrderModel(
      id: snapshot.id,
      trackingCode: snapshot['trackingCode'],
      items: List<CartItemModel>.from(
        snapshot['items'].map((item) => CartItemModel.fromJson(item)),
      ),
      totalAmount: snapshot['totalAmount'],
      userId: snapshot['userId'],
      status: OrderStatus.values.firstWhere(
            (status) => status.toString().split('.').last == snapshot['status'],
      ),
      orderDate: (snapshot['orderDate'] as Timestamp).toDate(),
      deliveryDate: (snapshot['deliveryDate'] as Timestamp).toDate(),
      couponCode: snapshot['couponCode'],
      discountAmount: snapshot['discountAmount'],
      shippingAddress: snapshot['shippingAddress']
    );
  }
}
