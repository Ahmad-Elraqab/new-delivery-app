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

  // ignore: missing_return
  Future<Restaurant> createRestaurant(Restaurant r) async {}

  // ignore: missing_return
  Future<Restaurant> updateRestaurant(Restaurant r) async {
    // ignore: unused_local_variable
    final data = dataService.getListByFuture('restaurant');

    // return (data as List).map((e) => Restaurant.fromJson(e)).toList();
  }

  Future<void> deleteRestaurant({Restaurant r, String id}) {
    // ignore: unused_local_variable
    final data = dataService.getListByFuture('restaurant');

    return null;
  }
}
