import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/screens/app.dart';
import 'package:work_app/screens/home/categories_screen.dart';
import 'package:work_app/screens/home/restaurant_detail.dart';
import 'package:work_app/screens/home/restaurants_menu_screen.dart';
import 'package:work_app/screens/home/all_restaurants_screen.dart';

class RouterPage {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    // Manage your route names here
    final data = settings.arguments;
    switch (settings.name) {
      case '/':
        builder = (BuildContext context) => App();
        break;
      case kRestaurantCart:
        builder = (BuildContext context) => App(currentIndex: 1);
        break;
      case kRestaurantHomePage:
        builder = (BuildContext context) => App(currentIndex: 0);
        break;
      case kRestaurantProfile:
        builder = (BuildContext context) => App(currentIndex: 4);
        break;
      case kRestaurantNotification:
        builder = (BuildContext context) => App(currentIndex: 3);
        break;
      case kRestaurantDetail:
        builder = (BuildContext context) => RestaurantDetail(data);
        break;
      case kAllRestaurants:
        builder = (BuildContext context) => RestaurantsList();
        break;
      case kAllCategories:
        builder = (BuildContext context) => CategoryList();
        break;
      case kRestaurantMenu:
        builder = (BuildContext context) => RestaurantMenu(data);
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
