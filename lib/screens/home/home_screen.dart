import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/provider/restaurant_provider.dart';
import 'components/category_list_view.dart';
import 'components/category_list_view_title.dart';
import 'components/restaurant_list_view.dart';
import 'components/restaurant_list_view_title.dart';
import 'components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  TextEditingController restaurantName;
  TextEditingController description;
  TextEditingController rate;
  TextEditingController status;
  TextEditingController image;

  @override
  void initState() {
    super.initState();
    restaurantName = TextEditingController();
    description = TextEditingController();
    rate = TextEditingController();
    status = TextEditingController();
    image = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future:!rest.isMenuArrive ?  rest.dataService.getMenu('menu') : rest.dataService.getListByFuture('restaurant') ,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(!rest.isMenuArrive){
              rest.isMenuArrive = true;
              Navigator.pushReplacementNamed(context, HomeScreen.routeName, );
            }else{
            rest.restaurants = rest.getRestaurantsFromJson(snapshot.data);
            }


            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              "Browse",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SearchBar(),
                            Center(
                              child: Container(
                                width: 200,
                                height: 2,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    CategoryListViewTitle(),
                    CategoryListView(),
                    RestaurantListViewTitle(),
                    RestaurantListView(),
                    _nearbyTitle(rest),
                    _nearbyRestaurants(rest),
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _nearbyRestaurants(RestaurantProvider rest) {
    var count = 0;
    rest.restaurants.forEach((element) {
      if (element.distance <= 3) count++;
    });

    return Container(
      height: 200,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 10, right: 10),
        scrollDirection: Axis.vertical,
        itemCount: count,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, kRestaurantDetail,
                    arguments: index);
              },
              child: Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${rest.restaurants[index].image}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  flex: 3,
                                  child: Text(
                                    "${rest.restaurants[index].name}",
                                    style: TextStyle(fontSize: 18),
                                  )),
                              Expanded(
                                flex: 7,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 5,
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.deepOrange,
                                              size: 18),
                                          Icon(Icons.star,
                                              color: Colors.deepOrange,
                                              size: 18),
                                          Icon(Icons.star,
                                              color: Colors.deepOrange,
                                              size: 18),
                                          Icon(Icons.star,
                                              color: Colors.deepOrange,
                                              size: 18),
                                          Icon(Icons.star,
                                              color: Colors.grey, size: 18),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.amber,
                                              child: Text(
                                                "${rest.restaurants[index].rate}",
                                                style: TextStyle(fontSize: 14),
                                              )),
                                          CircleAvatar(
                                              backgroundColor: Colors.pink,
                                              child: Text(
                                                  "${rest.restaurants[index].distance} Km",
                                                  style:
                                                      TextStyle(fontSize: 14))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _nearbyTitle(RestaurantProvider rest) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, top: 20, right: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Nearby",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          InkWell(
            // onTap: () {
            //   Navigator.pushNamed(
            //     context,
            //     kAllCategories,
            //   );
            // },
            child: Text(
              "View all >>",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// rest.restaurants.add(Restaurant(
//             name: 'Osama rest',
//             id: 'hello 123',
//             category: 'sudanese',
//             description: 'helloo world',
//             distance: 2,
//             image: null,
//             location: 'Tamn u',
//             rate: 9.5,
//             status: 'open'));
//         rest.restaurants.add(Restaurant(
//             name: 'Osama rest',
//             id: 'hello 123',
//             category: 'sudanese',
//             description: 'helloo world',
//             distance: 2,
//             image: null,
//             location: 'Tamn u',
//             rate: 9.5,
//             status: 'open'));
//         rest.restaurants.add(Restaurant(
//             name: 'Osama rest',
//             id: 'hello 123',
//             category: 'sudanese',
//             description: 'helloo world',
//             distance: 2,
//             image: null,
//             location: 'Tamn u',
//             rate: 9.5,
//             status: 'open'));
//         rest.restaurants.add(Restaurant(
//             name: 'Osama rest',
//             id: 'hello 123',
//             category: 'sudanese',
//             description: 'helloo world',
//             distance: 2,
//             image: null,
//             location: 'Tamn u',
//             rate: 9.5,
//             status: 'open'));
//         rest.restaurants.add(
//           Restaurant(
//               name: 'Osama rest',
//               id: 'hello 123',
//               category: 'sudanese',
//               description: 'helloo world',
//               distance: 2,
//               image: null,
//               location: 'Tamn u',
//               rate: 9.5,
//               status: 'open'),
//         );
