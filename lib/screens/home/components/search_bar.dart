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
    // final rest = Provider.of<RestaurantProvider>(context);

    return Container(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(
              fontSize: 18.0,
              color: Colors.grey,
            ),
            hintText: 'Search...',
            contentPadding: EdgeInsets.all(8.0),
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              color: Color.fromRGBO(110, 127, 170, 10),
              onPressed: () {
                // rest.restaurants[0].name = textInput;
                // rest.dataService
                //     .update('restaurant', data: rest.restaurants[0]);
              },
            ),
            suffixIcon: Icon(
              Icons.filter_list,
              color: Color.fromRGBO(110, 127, 170, 10),
            ), // not programmed yet, supposed to be a filter.
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.transparent, width: 1),
            ),
          ),
          onChanged: (text) {
            textInput = text;
          },
        ));
  }
}
