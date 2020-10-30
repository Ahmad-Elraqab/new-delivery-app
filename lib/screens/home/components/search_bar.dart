import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String textInput;

  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context, listen: false);
    final myController = TextEditingController();
    return Container(
        height: 40,
        child: TextField(
          controller: myController,
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
              onPressed: () {},
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
          // onChanged: (text) {},
          onSubmitted: (text) {
            rest.updateList(text);
          },
        ));
  }
}
