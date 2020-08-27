import 'package:flutter/cupertino.dart';
import 'package:work_app/models/restaurant_class.dart';

class User extends ChangeNotifier {
  String name;
  String email;
  String id;
  String image;
  int number;
  List<Restaurant> following;
  final userId = "Ikpfx9o03W1nD168LFfQ";
  
  User({this.name, this.email, this.number, this.id, this.image});
  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    number = json['number'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'number': number,
        'id': id,
        'image': image,
      };
}
