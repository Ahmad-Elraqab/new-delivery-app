import 'package:flutter/cupertino.dart';

class Restaurant extends ChangeNotifier {
  String id;
  double rate;
  String name;
  String description;
  String status;
  String image;
  List<Restaurant> restaurants;
  // Stream stream = dataService.getListByStream('restaurant');

  Restaurant(
      {this.id,
      this.name,
      this.description,
      this.rate,
      this.status,
      this.image});
  Restaurant.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          description: json['description'],
          rate: json['rate'],
          status: json['status'],
          image: json['image'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'status': status,
        'rate': rate,
        'image': image
      };
}
