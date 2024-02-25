import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String? id;
  final String productId;
  final String userId;
  final String userName;
  final String userPicture;
  double rating;
  String? comment;
  String? reply;
  final DateTime createdAt;

  ReviewModel({
    this.id,
    required this.productId,
    required this.userId,
    required this.userName,
    required this.userPicture,
    required this.rating,
    this.comment="",
    this.reply="",
    required this.createdAt,
  });

  factory ReviewModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ReviewModel(
      id: snapshot.id,
      productId: snapshot['productId'],
      userId: snapshot['userId'],
      userName: snapshot['userName'],
      userPicture: snapshot['userPicture'],
      rating: snapshot['rating'].toDouble(),
      comment: snapshot['comment'],
      reply: snapshot['reply'],
      createdAt: (snapshot['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'userId': userId,
      'userName': userName,
      'userPicture': userPicture,
      'rating': rating,
      'comment': comment,
      'reply': reply,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }
}
