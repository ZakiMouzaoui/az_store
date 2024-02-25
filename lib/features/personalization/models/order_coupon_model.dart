import 'package:cloud_firestore/cloud_firestore.dart';

class OrderCouponModel{
  final String id;
  final String code;
  final int discountPercent;
  final String orderTrackingCode;

  OrderCouponModel({
    required this.id,
    required this.code,
    required this.discountPercent,
    required this.orderTrackingCode,
  });

  OrderCouponModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        code = snapshot['code'],
        discountPercent = snapshot['discountPercent'],
        orderTrackingCode = snapshot['orderTrackingCode'];

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'discountAmount': discountPercent,
      'orderTrackingCode': orderTrackingCode,
    };
  }
}