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
                rest.getRestaurantsFromJson(snapshot.data.documents);

            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SearchBar(),
                          RestaurantListViewTitle(),
                          RestaurantListView(),
                          CategoryListViewTitle(),
                          CategoryListView(),
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

  _showDialog(BuildContext con) async {
    // final dataService = service<RestaurantDataService>();
    final restaurantData = Provider.of<RestaurantProvider>(context);

    await showDialog(
      context: con,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(10),
        content: Column(
          children: <Widget>[
            Text("Please fill out the form"),
            Expanded(
              child: TextField(
                  autofocus: true,
                  autocorrect: true,
                  decoration: InputDecoration(labelText: "Restaurant Name*"),
                  controller: restaurantName),
            ),
            Expanded(
              child: TextField(
                  autofocus: true,
                  autocorrect: true,
                  decoration: InputDecoration(labelText: "Description*"),
                  controller: description),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Status"),
                controller: status,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Rate"),
                controller: rate,
              ),
            ),
            Expanded(
              child: TextField(
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(labelText: "Image Link"),
                controller: image,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancle")),
          FlatButton(
              onPressed: () {
                if (restaurantName.text.isNotEmpty &&
                    description.text.isNotEmpty &&
                    status.text.isNotEmpty &&
                    rate.text.isNotEmpty &&
                    image.text.isNotEmpty) {
                  restaurantData.dataService
                      .create('restaurant',
                          data: Restaurant(
                              name: restaurantName.text,
                              description: description.text,
                              rate: double.parse(rate.text),
                              status: status.text,
                              image: image.text))
                      .then((response) {
                    restaurantName.clear();
                    description.clear();
                    rate.clear();
                    image.clear();
                    status.clear();
                    Navigator.pop(context);
                  }).catchError((error) => print("error"));
                }
              },
              child: Text("Save")),
        ],
      ),
    );
  }
}

// body: FutureBuilder<List<Restaurant>>(
//   // future: restaurantService.getRestaurantList(),
//   future: dataService.getList('restaurant'),
//   builder: (context, snapshot) {
//     if (!snapshot.hasData) {
//       return CircularProgressIndicator();
//     } else {
//       _restaurants = snapshot.data;
//       return SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 SearchBar(_restaurants),
//                 RestaurantListViewTitle(_restaurants),
//                 RestaurantListView(_restaurants),
//                 CategoryListViewTitle(_restaurants),
//                 CategoryListView(_restaurants),
//               ],
//             )
//           ],
//         ),
//       );
//     }
//   },
// ),
