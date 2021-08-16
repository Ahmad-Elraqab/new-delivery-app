import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class CategoryListViewTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final rest = Provider.of<RestaurantProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Category",
            style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                kAllCategories,
              );
            },
            child: Text(
              "View all >>",
              style: TextStyle(color: Colors.pink, fontSize: 12,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
