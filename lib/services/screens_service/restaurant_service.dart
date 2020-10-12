import 'package:work_app/models/restaurant_class.dart';

import '../../dependency.dart';
import '../data_service.dart';

class RestaurantService {
  final dataService = service<DataService>();

  Future<List<Restaurant>> getAllRestaurants() async {
    final data = await dataService.getListByFuture('restaurants');

    final result = (data as List).map((e) => Restaurant.fromJson(e)).toList();
    
    return result;
  }

  Future<Restaurant> createRestaurant(Restaurant r) async {}

  Future<Restaurant> updateRestaurant(Restaurant r) async {
    final data = dataService.getListByFuture('restaurant');

    // return (data as List).map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<void> deleteRestaurant({Restaurant r, String id}) {
    final data = dataService.getListByFuture('restaurant');

    return null;
  }
}
