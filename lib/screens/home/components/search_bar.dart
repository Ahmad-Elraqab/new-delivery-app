import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

import '../../../dependency.dart';

class SearchBar extends StatelessWidget {
  // SearchBar(List<Restaurant> restaurants, int index) {
  //   this.index = index;
  //   this._restaurants = restaurants;
  // }
  String textInput;
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);

    return Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width / 1.2,
        height: 40,
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 25.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: Offset(0, 3))
          ],
        ),
        child: TextField(
          textDirection: TextDirection.ltr,
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 12.0, color: Color.fromRGBO(110, 127, 170, 10)),
            hintText: 'Find Restaurants',
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              color: Color.fromRGBO(110, 127, 170, 10),
              onPressed: () {
                rest.restaurants[0].name = textInput;
                rest.dataService
                    .update('restaurant', data: rest.restaurants[0]);
              },
            ),
            suffixIcon: Icon(
              Icons.filter_list,
              color: Color.fromRGBO(110, 127, 170, 10),
            ), // not programmed yet, supposed to be a filter.
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(
                  color: Color.fromRGBO(110, 127, 170, 10), width: 1),
            ),
          ),
          onChanged: (text) {
            textInput = text;
          },
        ));
  }
}
