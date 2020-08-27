import 'package:flutter/cupertino.dart';
import 'package:work_app/dependency.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/services/data_service.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> restaurants = [];

  final dataService = service<DataService>();

  Future<void> delete(String id) async {
    await dataService.delete('restaurant', id);
  }

  List<Restaurant> getRestaurantsFromJson(List data) {
    restaurants.clear();
    data.forEach((doc) {
      final restaurant = Restaurant.fromJson(doc.data);
      restaurant.id = doc.documentID;
      restaurants.add(restaurant);
    });
    return restaurants;
  }

  Future<void> create({Restaurant data}) async {
    data = Restaurant(
        description: "hello from server description",
        name: "New Restaurant",
        rate: 9.2,
        status: "open");

    await dataService.create('restaurant', data: data);
  }
}
