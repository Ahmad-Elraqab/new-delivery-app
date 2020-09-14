class Feedback {
  String restaurantId;
  String userName;
  String date;
  String userImage;
  String userRate;
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
          userRate: json['userRate'],
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
