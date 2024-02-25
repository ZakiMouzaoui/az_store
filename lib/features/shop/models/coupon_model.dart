import 'package:cloud_firestore/cloud_firestore.dart';

class CouponModel {
  final String? id;
  final String code;
  final int percentage;
  final int maxUsageCount;
  int currentUsageCount;
  List<String>? usedBy;
  final DateTime expirationDate;
  final double minPrice;

  CouponModel({
    this.id,
    required this.code,
    required this.percentage,
    required this.maxUsageCount,
    this.currentUsageCount=0,
    this.usedBy,
    required this.expirationDate,
    required this.minPrice
  });

  CouponModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        code = snapshot['code'],
        percentage = snapshot['percentage'],
        maxUsageCount = snapshot['maxUsageCount'],
        currentUsageCount = snapshot['currentUsageCount'],
        usedBy = List<String>.from(snapshot['usedBy']),
        expirationDate = (snapshot['expirationDate'] as Timestamp).toDate(),
        minPrice = snapshot['minPrice'];

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'percentage': percentage,
      'maxUsageCount': maxUsageCount,
      'currentUsageCount': currentUsageCount,
      'usedBy': [],
      'expirationDate': Timestamp.fromDate(expirationDate),
      'minPrice': minPrice
    };
  }
}
