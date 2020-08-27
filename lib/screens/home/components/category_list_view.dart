import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 120,
      child: ListView.builder(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 13,
            right: MediaQuery.of(context).size.width / 10),
        scrollDirection: Axis.horizontal,
        // itemCount: model.categories.length,
        itemBuilder: (context, index) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.5,
                              offset: Offset(1, 1),
                              spreadRadius: 0.5)
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cookieandkate.com/images/2020/03/vegan-chana-masala-recipe-2.jpg"),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(colors: [
                      Color(0xff832BF6).withOpacity(0.45),
                      Color(0xffFF4665).withOpacity(0.45)
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  ),
                  child: Center(
                      child: Text("Italian",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
