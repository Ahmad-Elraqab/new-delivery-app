import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class RestaurantListViewTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    return Container(
        padding: EdgeInsets.only(
            top: 20,
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Trending Restaurants",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  kAllRestaurants,
                );
              },
              child: Text(
                "See all (${rest.restaurants.length})",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ],
        ));
  }
}
