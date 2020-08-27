import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/provider/item_provider.dart';
import 'package:work_app/provider/orders_provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';
import 'package:work_app/services/model_service/orders_data_service.dart';

class RestaurantDetail extends StatefulWidget {
  int index;

  RestaurantDetail(this.index);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  int numberOfOrders = 0;

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<ItemProvider>(context);
    final restProvider = Provider.of<RestaurantProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              //this stack include the retaurant background image and the info box.
              children: <Widget>[
                Container(
                  height: 250,
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
                            "https://previews.123rf.com/images/geckophotos/geckophotos1807/geckophotos180700455/104601455-top-view-of-group-of-happy-friends-having-nice-food-and-drinks-enjoying-the-party-and-communication-.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.arrowLeft,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                  icon: Icon(FontAwesomeIcons.share,
                                      size: 18, color: Colors.black),
                                  onPressed: null),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width - 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.5,
                                offset: Offset(1, 1),
                                spreadRadius: 0.5)
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "The Soothing Dessert",
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 18),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 18),
                                  Icon(Icons.star,
                                      color: Colors.yellow, size: 18),
                                  Icon(Icons.star,
                                      color: Colors.grey, size: 18),
                                  Text("  4.5  (260 Reviews)"),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.utensilSpoon,
                                          color: Colors.black54, size: 18),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text("Dessert"),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.locationArrow,
                                          color: Colors.black54, size: 18),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text("1.6 Km"),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.moneyBillWave,
                                        color: Colors.black54,
                                        size: 18,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Text("  23/person"),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(
                                height: 1,
                                thickness: 1,
                              ),
                              SizedBox(height: 5),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Icon(FontAwesomeIcons.clock,
                                            size: 18, color: Colors.black54),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, top: 1),
                                          child: Text("09:00-22:00"),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(FontAwesomeIcons.car,
                                            size: 18, color: Colors.black54),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 4.0, top: 2),
                                          child: Text("Parking lot"),
                                        )
                                      ],
                                    ),
                                  ]),
                              Row(
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.home,
                                      size: 18, color: Colors.black54),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, top: 4),
                                    child: Text("West 29th Street"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, top: 25, bottom: 5, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recommended dishes",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, kRestaurantMenu);
                        },
                        child: Text(
                          "See all (25)",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 120,
                              width: 150,
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
                                        "https://2.bp.blogspot.com/_wTB2n4D2Q4A/S3sJNExMyAI/AAAAAAAABaE/51ybi-8oadE/s400/Vodka+Penne_1911+120+dpi+sharp+%40+10.jpg"),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Text(
                              "Raspberry cake",
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  size: 18,
                                ),
                                Text("10.5", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 20, bottom: 5),
                  child: Text(
                    "The comments",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: 10),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Sarah"),
                        subtitle: Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 18,
                            ),
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            Icon(Icons.star, color: Colors.yellow, size: 18),
                            Icon(Icons.star, color: Colors.grey, size: 18),
                            Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Text("4.5"),
                            ),
                          ],
                        ),
                        trailing: Text("June 15"),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
