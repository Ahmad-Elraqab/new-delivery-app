import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class RestaurantListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantProvider>(context);
    // final dataService = service<RestaurantDataService>();

    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 200,
      child: ListView.builder(
          padding: EdgeInsets.only(left: 10, right: 10),
          scrollDirection: Axis.horizontal,
          itemCount: restaurantData.restaurants.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                restaurantData.isNotNearby = true;
                Navigator.pushNamed(context, kRestaurantDetail,
                    arguments: index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.79,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${restaurantData.restaurants[index].image}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(
                              padding: EdgeInsets.only(top: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0)),
                                color: Colors.white.withOpacity(0.9),
                              ),
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(restaurantData
                                            .restaurants[index].name),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0,
                                                  bottom: 3.0,
                                                  left: 8.0,
                                                  right: 8.0),
                                              child: Text(
                                                "${restaurantData.restaurants[index].category}",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.0,
                                                  bottom: 3.0,
                                                  left: 8.0,
                                                  right: 8.0),
                                              child: Text(
                                                "${restaurantData.restaurants[index].distance} Km",
                                                style: TextStyle(fontSize: 10),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                    Text(restaurantData
                                        .restaurants[index].description),
                                    Row(
                                      children: <Widget>[
                                        Icon(Icons.star,
                                            color: Colors.deepOrange, size: 18),
                                        Icon(Icons.star,
                                            color: Colors.deepOrange, size: 18),
                                        Icon(Icons.star,
                                            color: Colors.deepOrange, size: 18),
                                        Icon(Icons.star,
                                            color: Colors.deepOrange, size: 18),
                                        Icon(Icons.star,
                                            color: Colors.grey, size: 18),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            "${restaurantData.restaurants[index].rate}  (260 Reviews)"),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
