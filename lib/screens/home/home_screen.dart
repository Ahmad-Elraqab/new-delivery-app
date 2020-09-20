import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      body: StreamBuilder(
        stream: rest.dataService.getListByStream('restaurant'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            rest.restaurants =
                rest.getRestaurantsFromJson(snapshot.data.docs);

            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Column(
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
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                          _nearbyRestaurants()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Container _nearbyRestaurants() {
    return Container(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 25, right: 25),
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://image.shutterstock.com/image-photo/delicious-pizza-olives-sausages-on-260nw-1100491781.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Happy Bones"),
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
                            Icon(Icons.star, color: Colors.grey, size: 18),
                            Text("  4.5  (260 Reviews)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
          const EdgeInsets.only(left: 28.0, top: 20, right: 25, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Nearby",
            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
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
              style: TextStyle(color: Colors.pink, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
