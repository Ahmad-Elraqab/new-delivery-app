import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 180,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 10, right: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              // onTap: () {
              //   Navigator.pushNamed(context, kRestaurantDetail,
              //       arguments: index);
              // },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[350],
                          blurRadius: 3.5,
                          offset: Offset(0.5, 0.5),
                          spreadRadius: 0.1)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.shutterstock.com/image-photo/delicious-pizza-olives-sausages-on-260nw-1100491781.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5.0),
                              bottomLeft: Radius.circular(5.0)),
                          color: Colors.white.withOpacity(0.9),
                        ),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ListTile(
                              title: Text("Pizza & Pasta"),
                              subtitle: Text("29 venues"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
