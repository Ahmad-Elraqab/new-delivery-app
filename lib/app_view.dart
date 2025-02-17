import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/provider/item_provider.dart';
import 'package:work_app/provider/my_profile_provider.dart';
import 'package:work_app/provider/orders_provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

import 'models/router.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MyProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ItemProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepOrange,
          textTheme: TextTheme(body2: TextStyle(color: Colors.black)),
        ),
        onGenerateRoute: Router.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}
