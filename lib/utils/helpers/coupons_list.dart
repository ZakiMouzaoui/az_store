import '../../features/shop/models/coupon_model.dart';

final coupons = [
  CouponModel(
    code: "AZ-2023",
    percentage: 10,
    maxUsageCount: 100,
    currentUsageCount: 0,
    expirationDate: DateTime(2023, 12, 21),
    minPrice: 50.0,
  ),
  CouponModel(
    code: "AZ-2023",
    percentage: 10,
    maxUsageCount: 100,
    currentUsageCount: 0,
    expirationDate: DateTime(2024, 02, 28),
    minPrice: 50.0,
  ),
  CouponModel(
    code: "AZ-2023",
    percentage: 10,
    maxUsageCount: 100,
    currentUsageCount: 0,
    expirationDate: DateTime(2024, 03, 08),
    minPrice: 50.0,
  )
];
