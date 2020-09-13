class Comment {
  String restaurantId;
  String userName;
  String date;
  String userImage;
  String userRate;
  String userComment;

  Comment(
      {this.restaurantId,
      this.userName,
      this.date,
      this.userImage,
      this.userComment,
      this.userRate});
  Comment.fromJson(Map<String, dynamic> json)
      : this(
          restaurantId: json['restaurantId'],
          userName: json['userName'],
          date: json['date'],
          userImage: json['userImage'],
          userComment: json['userComment'],
          userRate: json['userRate'],
        );

  Map<String, dynamic> toJson() => {
        'restaurantId': restaurantId,
        'userName': userName,
        'date': date,
        'userImage': userImage,
        'userComment': userComment,
        'userRate': userRate,
      };
}
