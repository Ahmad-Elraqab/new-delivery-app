import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackData {
  String id;
  String restaurantId;
  String date;
  String userId;
  String userName;
  String userImage;
  double userRate;
  String userFeedback;

  FeedbackData({
    this.restaurantId,
    this.userName,
    this.date,
    this.userImage,
    this.userFeedback,
    this.userRate,
    this.userId,
    this.id,
  });
  FeedbackData.fromJson(Map<String, dynamic> json)
      : this(
          restaurantId: json['restaurantId'],
          date: json['date'],
          userName: json['userName'],
          userImage: json['userImage'],
          userFeedback: json['userFeedback'],
          userRate: json['userRate'].toDouble(),
        );

  Map<String, dynamic> toJson() => {
        'restaurantId': restaurantId,
        'userName': userName,
        'date': date,
        'userImage': userImage,
        'userFeedback': userFeedback,
        'userRate': userRate,
        'id': id,
        'userId': userId,
      };
}
