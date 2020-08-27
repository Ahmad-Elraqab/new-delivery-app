import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class CategoryListViewTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    return Container(
        padding: EdgeInsets.only(
            top: 10,
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Category",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  kAllCategories,
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
