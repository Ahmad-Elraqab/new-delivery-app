import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/provider/item_provider.dart';
import 'package:work_app/provider/restaurant_provider.dart';

class RestaurantMenu extends StatefulWidget {
  final int index;
  RestaurantMenu(this.index);
  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  int numberOfOrders = 0;
  int currentIndexBar = 0;
  bool isExtend = true;
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    final menu = Provider.of<ItemProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.network(
                      "${rest.restaurants[widget.index].image}",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              _categoryList(),
              _itemList(context),
              // _visible ? _addCart() : null,
              if (_visible) _addCart()
            ],
          ),
        ),
      ),
    );
  }

  AnimatedOpacity _addCart() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 2000),
      child: Container(
        color: Colors.deepOrange,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Add to cart",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _backButton(BuildContext context) {
    return Positioned(
      left: 16,
      top: 30,
      child: CircleAvatar(
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
    );
  }

  Expanded _itemList(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        // height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: 16,
          // itemCount: menuProvider.items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.green,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.kfc.com.my/images/menu/self-collect/stacker-box.jpg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        width: 225,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Signature Box",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "1 Chicken piece, signature burger, fries potato with KFC special sauce,KFC special sauce & KFC special sauce ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "23.50 RM",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.minus,
                                        size: 16,
                                      ),
                                      // onPressed: menuProvider.decrementItem,
                                      onPressed: () {
                                        numberOfOrders--;
                                        if (numberOfOrders < 0)
                                          numberOfOrders = 0;
                                        if (numberOfOrders == 0)
                                          _visible = false;
                                        setState(() {});
                                      },
                                      color: Colors.black,
                                    ),
                                    Text(
                                      // "${menuProvider.items[index].numberOfItems}",
                                      "${numberOfOrders}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        FontAwesomeIcons.plus,
                                        size: 16,
                                        color: Colors.pink,
                                      ),
                                      // onPressed: menuProvider.incrementItem,
                                      onPressed: () {
                                        numberOfOrders++;
                                        if (numberOfOrders < 0)
                                          numberOfOrders = 0;
                                        _visible = true;
                                        setState(() {});
                                      },
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Container _categoryList() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              currentIndexBar = index;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                color: index == currentIndexBar ? Colors.red[50] : Colors.white,
                border: index == currentIndexBar
                    ? Border(
                        bottom: BorderSide(width: 3.0, color: Colors.red),
                      )
                    : Border(
                        bottom: BorderSide(
                            width: 2.0, color: Colors.grey.withOpacity(0.5)),
                      ),
              ),
              width: MediaQuery.of(context).size.width / 3,
              child: Center(child: Text("meal")),
            ),
          );
        },
      ),
    );
  }
}
