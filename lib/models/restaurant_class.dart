import 'package:flutter/cupertino.dart';
import 'package:work_app/models/feedback_class.dart';

import 'item_class.dart';
// import 'package:work_app/models/comment_class.dart';
// import 'item_class.dart';

class Restaurant extends ChangeNotifier {
  String id;
  String name;
  String description;
  String status;
  double rate;
  String image;
  String category;
  String location;
  double distance;
  double reservationCost;
  String openTime;
  String closeTime;
  List categories;
  double parkingFees;
  List<FeedbackData> comments;
  List<Item> menu;
  List<Restaurant> restaurants;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.rate,
    this.status,
    this.image,
    this.category,
    this.location,
    this.distance,
    this.closeTime,
    this.openTime,
    this.parkingFees,
    this.reservationCost,
    this.categories,
    this.comments,
    this.menu,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    rate = json['rate'];
    status = json['status'];
    category = json['category'];
    location = json['location'];
    distance = json['distance'];
    image = json['image'];
    openTime = json['openTime'];
    closeTime = json['closeTime'];
    reservationCost = json['reservationCost'].toDouble();
    parkingFees = json['parkingFees'].toDouble();
    categories = json['categories'];
    if (json['menu'] != null) menu = new List<Item>();
    json['menu'].forEach((item) {
      menu.add(new Item.fromJson(item));
    });
    if (json['feedback'] != null) comments = new List<FeedbackData>();
    json['feedback'].forEach((comment) {
      comments.add(new FeedbackData.fromJson(comment));
    });
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'status': status,
        'rate': rate,
        'category': category,
        'location': location,
        'distance': distance,
        'image': image,
        'reservationCost': reservationCost,
        'parkingFees': parkingFees,
        'openTime': openTime,
        'closeTime': closeTime,
        'categories': categories,
      };
}
