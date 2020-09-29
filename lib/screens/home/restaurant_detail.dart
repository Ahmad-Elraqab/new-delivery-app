import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/provider/feedback_provider.dart';
import 'package:work_app/provider/item_provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class RestaurantDetail extends StatelessWidget {
  final int index;
  RestaurantDetail(this.index);
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    final menu = Provider.of<ItemProvider>(context);
    final feedback = Provider.of<FeedbackProvider>(context);
    // menu.getMenuItems(snapshot.data);

    return Scaffold(
      body: FutureBuilder(
        future: menu.dataService.getMenu(rest.isNotNearby
            ? rest.restaurants[index].id
            : rest.nearbyRestaurant[index].id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            menu.getMenuItems(snapshot.data);
            return SafeArea(
              child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverPersistentHeader(
                      delegate:
                          MySliverAppBar(expandedHeight: 200, restIndex: index),
                      pinned: true,
                    ),
                  ];
                },
                body: Scrollable(
                  viewportBuilder: (context, position) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
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
                                menu.currentMenu = index;
                                Navigator.pushNamed(
                                  context,
                                  kRestaurantMenu,
                                );
                              },
                              child: Text(
                                "View all >>",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: menu.items.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 20),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "${menu.items[index].itemImage}"),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Text(
                                    "${menu.items[index].itemName}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text("${menu.items[index].itemPrice} RM",
                                      style: TextStyle(fontSize: 16)),
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
                        padding: const EdgeInsets.only(
                            left: 25.0, top: 20, bottom: 5),
                        child: Text(
                          "The comments",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: feedback.dataService.getFeedback(
                              rest.isNotNearby
                                  ? rest.restaurants[index].id
                                  : rest.nearbyRestaurant[index].id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              feedback.getFeedbackList(snapshot.data);

                              return Container(
                                child: ListView.builder(
                                  physics: AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: feedback.feedback.length,
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.only(left: 10),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.pink,
                                        backgroundImage: NetworkImage(
                                            "${feedback.feedback[index].userImage}"),
                                      ),
                                      title: Text(
                                          "${feedback.feedback[index].userName}"),
                                      subtitle: Row(
                                        children: <Widget>[
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 18),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 18),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 18),
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 18),
                                          Icon(Icons.star,
                                              color: Colors.grey, size: 18),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                                "${feedback.feedback[index].userRate}"),
                                          ),
                                        ],
                                      ),
                                      trailing: Text(
                                          "${feedback.readTimestamp(feedback.feedback[index].date.millisecondsSinceEpoch)}"),
                                    );
                                  },
                                ),
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ),
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
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  int restIndex;
  MySliverAppBar({this.restIndex, @required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final rest = Provider.of<RestaurantProvider>(context);
    List<Restaurant> restaurantsList = [];
    rest.isNotNearby
        ? restaurantsList = rest.restaurants
        : restaurantsList = rest.nearbyRestaurant;
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(180),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 3 - shrinkOffset,
          left: 25,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Container(
              height: expandedHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                            "${restaurantsList[restIndex].name}",
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
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                              Icon(Icons.star, color: Colors.yellow, size: 18),
                              Icon(Icons.star, color: Colors.grey, size: 18),
                              Text(
                                  "${restaurantsList[restIndex].rate}  (260 Reviews)"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.utensilSpoon,
                                      color: Colors.black54, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                        "${restaurantsList[restIndex].category}"),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.locationArrow,
                                      color: Colors.black54, size: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                        "${restaurantsList[restIndex].distance} Km"),
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
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: Text(
                                        "${restaurantsList[restIndex].reservationCost}/person"),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(FontAwesomeIcons.clock,
                                        size: 18, color: Colors.black54),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4.0, top: 1),
                                      child: Text(
                                          '${restaurantsList[restIndex].openTime}-' +
                                              '${restaurantsList[restIndex].closeTime}'),
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
                                      child: Text(
                                          "${restaurantsList[restIndex].parkingFees} Rm"),
                                    )
                                  ],
                                ),
                              ]),
                          Row(
                            children: <Widget>[
                              Icon(FontAwesomeIcons.home,
                                  size: 18, color: Colors.black54),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 4.0, top: 4),
                                child: Text(
                                    "${restaurantsList[restIndex].location}"),
                              )
                            ],
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
        Positioned(
          top: 5,
          left: 10,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
