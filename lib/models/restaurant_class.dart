import 'package:flutter/cupertino.dart';
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
  int distance;
  double reservationCost;
  String openTime;
  String closeTime;
  double parkingFees;
  List<Restaurant> restaurants;
  // List<Comment> comments;
  // List<Item> item;

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
  });

  Restaurant.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          description: json['description'],
          rate: json['rate'],
          status: json['status'],
          category: json['category'],
          location: json['location'],
          distance: json['distance'],
          image: json['image'],
          openTime: json['openTime'],
          closeTime: json['closeTime'],
          reservationCost: json['reservationCost'].toDouble(),
          parkingFees: json['parkingFees'].toDouble(),
        );

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
      };
}
