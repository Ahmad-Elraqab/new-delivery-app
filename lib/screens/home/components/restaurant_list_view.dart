import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/provider/restaurant_provider.dart';

import '../../../dependency.dart';

class RestaurantListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantProvider>(context);
    // final dataService = service<RestaurantDataService>();

    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 250,
      child: ListView.builder(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 13,
              right: MediaQuery.of(context).size.width / 10),
          scrollDirection: Axis.horizontal,
          itemCount: restaurantData.restaurants.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, kRestaurantDetail,
                    arguments: index);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.79,
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.5,
                          offset: Offset(1, 1),
                          spreadRadius: 0.5)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 144,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://previews.123rf.com/images/geckophotos/geckophotos1807/geckophotos180700455/104601455-top-view-of-group-of-happy-friends-having-nice-food-and-drinks-enjoying-the-party-and-communication-.jpg"),
                              fit: BoxFit.cover),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.5,
                                      offset: Offset(0.5, 0.5),
                                      spreadRadius: 0.5)
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              margin: EdgeInsets.only(
                                top: 20,
                                left: 20,
                              ),
                              width: 50,
                              height: 20,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                    restaurantData.restaurants[index].status,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.green)),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 0.5,
                                      offset: Offset(0.5, 0.5),
                                      spreadRadius: 0.5)
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              margin: EdgeInsets.only(
                                top: 20,
                                right: 20,
                              ),
                              width: 50,
                              height: 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.amberAccent,
                                  ),
                                  Text(
                                      restaurantData.restaurants[index].rate
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
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
                        height: 90,
                        padding: EdgeInsets.only(
                            top: 12.0, bottom: 12.0, right: 12.0),
                        child: ListTile(
                          title: Row(
                            children: <Widget>[
                              Text(restaurantData.restaurants[index].name),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0,
                                        bottom: 3.0,
                                        left: 8.0,
                                        right: 8.0),
                                    child: Text(
                                      "Italian",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.orange,
                                          Colors.deepOrange
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 3.0,
                                        bottom: 3.0,
                                        left: 8.0,
                                        right: 8.0),
                                    child: Text(
                                      "12 Km",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.purple[50],
                                          Colors.purple
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, right: 8.0),
                            child: Text(
                                restaurantData.restaurants[index].description),
                          ),
                          // trailing: IconButton(
                          //   icon: Icon(Icons.delete),
                          //   color: Colors.brown,
                          //   onPressed: () {
                          //     restaurantData.delete(
                          //         restaurantData.restaurants[index].id);
                          //   },
                          // ),
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
