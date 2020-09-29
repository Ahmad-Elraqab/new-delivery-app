import 'package:flutter/cupertino.dart';
import 'package:work_app/dependency.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/screens_service/restaurant_service.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> restaurants = [];
  bool isMenuArrive = false;
  final dataService = service<DataService>();
  final dataService2 = RestaurantService();

  String currentRestaurantType;

  Map<String, List<Restaurant>> restaurantsByDistance = {
    'nearby': [],
    'trending': [],
  };

  bool isNotNearby = true;
  // int nearbyRestaurants = 0;
  List<Restaurant> nearbyRestaurant = [];
  // void setServerData(){
  //   getRestaurantsFromJson()
  // }

  Future<void> delete(String id) async {
    await dataService.delete('restaurant', id);
  }

  Future<void> setProviderData() async {
    final data = await dataService2.getAllRestaurants();
    restaurants = data;
    restaurantsByDistance['trending'] = restaurants;
    restaurantsByDistance['nearby'] = nearbyRestaurant;
    notifyListeners();
  }

  getNearbyRestaurant() {
    // nearbyRestaurants = 0;
    nearbyRestaurant.clear();
    restaurants.forEach((element) {
      if (element.distance <= 3) {
        // nearbyRestaurants++;
        nearbyRestaurant.add(element);
      }
    });
  }

  List<Restaurant> getRestaurantsFromJson(List data) {
    restaurants.clear();
    data.forEach((doc) {
      print(doc.data());
      final restaurant = Restaurant.fromJson(doc.data());
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
