import 'package:cloud_firestore/cloud_firestore.dart';

class Feedback {
  String id;
  String uid;
  String restaurantId;
  String userName;
  Timestamp date;
  String userImage;
  double userRate;
  String userFeedback;

  Feedback(
      {this.restaurantId,
      this.userName,
      this.date,
      this.userImage,
      this.userFeedback,
      this.userRate});
  Feedback.fromJson(Map<String, dynamic> json)
      : this(
          restaurantId: json['restaurantId'],
          userName: json['userName'],
          date: json['date'],
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
      };
}
