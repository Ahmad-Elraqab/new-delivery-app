import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/provider/restaurant_provider.dart';
import 'package:work_app/screens/home/components/search_bar.dart';

class RestaurantsList extends StatefulWidget {
  @override
  RrestaurantStatesList createState() => RrestaurantStatesList();
}

class RrestaurantStatesList extends State<RestaurantsList> {
  @override
  Widget build(BuildContext context) {
    final restaurantData = Provider.of<RestaurantProvider>(context);
    List<Restaurant> restaurantsList = [];
    restaurantData.isNotNearby
        ? restaurantsList = restaurantData.restaurants
        : restaurantsList = restaurantData.nearbyRestaurant;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: false,
                pinned: false,
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              SearchBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    children: List.generate(
                      restaurantsList.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, kRestaurantDetail,
                                  arguments: index);
                            },
                            child: Card(
                              elevation: 7,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey[200]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${restaurantsList[index].image}"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                  "${restaurantsList[index].name}"),
                                              Expanded(
                                                child: Text(
                                                  "${restaurantsList[index].description}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 3,
                                                ),
                                              ),
                                              Container(
                                                height: 25,
                                                color: Colors.grey[200],
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color: Colors.grey,
                                                          size: 18),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
