import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/screens/app.dart';
import 'package:work_app/screens/home/categories_screen.dart';
import 'package:work_app/screens/home/home_screen.dart';
import 'package:work_app/screens/home/restaurant_detail.dart';
import 'package:work_app/screens/home/restaurants_menu_screen.dart';
import 'package:work_app/screens/home/restaurants_screen.dart';
import 'package:work_app/screens/notification/notification_screen.dart';
import 'package:work_app/screens/profile/profile_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    // Manage your route names here
    final data = settings.arguments;
    switch (settings.name) {
      case '/':
        builder = (BuildContext context) => App();
        break;
      case '/Cart':
        builder = (BuildContext context) => App(
              currentIndex: 0,
            );
        break;
      case HomeScreen.routeName:
        builder = (BuildContext context) => App(
              currentIndex: 2,
            );
        break;
      case MyProfile.routeName:
        builder = (BuildContext context) => App(
              currentIndex: 4,
            );
        break;
      case NotificationPage.routeName:
        builder = (BuildContext context) => App(
              currentIndex: 3,
            );
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
        builder = (BuildContext context) => RestaurantMenu();
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
