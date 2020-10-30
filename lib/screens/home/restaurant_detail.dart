import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/models/feedback_class.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/provider/feedback_provider.dart';
import 'package:work_app/provider/item_provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class RestaurantDetail extends StatefulWidget {
  final int index;

  RestaurantDetail(this.index);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  final myController = TextEditingController();
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    final menu = Provider.of<ItemProvider>(context, listen: false);
    final feedback = Provider.of<FeedbackProvider>(context);
    final resData = rest.restaurantsByDistance[rest.currentRestaurantType];

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                delegate: MySliverAppBar(
                    expandedHeight: 200, restIndex: widget.index),
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
                          rest.currentMenu = widget.index;
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
                    itemCount: resData[widget.index].menu.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        width: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.transparent,
                                          blurRadius: 2.5,
                                          offset: Offset(1, 1),
                                          spreadRadius: 0.5)
                                    ],
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "${resData[widget.index].menu[index].itemImage}"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${resData[widget.index].menu[index].itemName}",
                                style: TextStyle(fontSize: 16),
                                maxLines: 2,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                  "${resData[widget.index].menu[index].itemPrice} RM",
                                  style: TextStyle(fontSize: 16)),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "The comments",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          onPressed: () {
                            showBottomSheet(
                                context: context,
                                builder: (BuildContext context) =>
                                    addComment(context, feedback, rest));
                          })
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rest
                        .restaurantsByDistance[rest.currentRestaurantType]
                            [widget.index]
                        .comments
                        .length,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(left: 10),
                    itemBuilder: (context, index) {
                      return ListTile(
                        isThreeLine: true,
                        leading: CircleAvatar(
                          backgroundColor: Colors.pink,
                          backgroundImage: NetworkImage(
                              "${rest.restaurantsByDistance[rest.currentRestaurantType][widget.index].comments[index].userImage}"),
                        ),
                        title: Text(
                            "${rest.restaurantsByDistance[rest.currentRestaurantType][widget.index].comments[index].userName}"),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${rest.restaurantsByDistance[rest.currentRestaurantType][widget.index].comments[index].userFeedback}"),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 18),
                                Icon(Icons.star, color: Colors.grey, size: 18),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                      "${rest.restaurantsByDistance[rest.currentRestaurantType][widget.index].comments[index].userRate}"),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // trailing: Text(
                        //     "${feedback.readTimestamp(feedback.feedback[index].date.millisecondsSinceEpoch)}"),
                      );
                    },
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container addComment(BuildContext context, FeedbackProvider feedback,
      RestaurantProvider restaurant) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          TextField(
            maxLines: 1,
            controller: myController,
            decoration: InputDecoration(
              labelText: 'Write here...',
              border: OutlineInputBorder(
                borderSide: new BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                final rest = restaurant
                        .restaurantsByDistance[restaurant.currentRestaurantType]
                    [widget.index];
                if (myController.text.isNotEmpty) {
                  // feedback.addComment(
                  //   FeedbackData(
                  //     date: Timestamp.now(),
                  //     restaurantId: rest.id,
                  //     userRate: 5,
                  //     userFeedback: myController.text,
                  //     userImage:
                  //         'https://fedspendingtransparency.github.io/assets/img/user_personas/repurposer_mug.jpg',
                  //     userName: 'Ahmad Mousa',
                  //     userId: userIdConst,
                  //     id: 'id',
                  //   ),
                  // );
                  myController.clear();
                  Navigator.pop(context);
                  setState(
                    () {},
                  );
                }
              })
        ],
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
    List<Restaurant> restaurantsList =
        rest.restaurantsByDistance[rest.currentRestaurantType];
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
