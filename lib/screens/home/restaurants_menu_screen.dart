import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/provider/item_provider.dart';
import 'package:work_app/provider/cart_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final rest = Provider.of<RestaurantProvider>(context);
    final menu = Provider.of<ItemProvider>(context);
    final order = Provider.of<CartProvider>(context);
    final restData = rest.restaurantsByDistance[rest.currentRestaurantType];
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
                      "${restData[rest.currentMenu].image}",
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              _categoryList(rest, restData),
              _itemList(context, menu, rest, restData),
              // _visible ? _addCart() : null,
              if (rest.visible) _addCart(order, rest)
            ],
          ),
        ),
      ),
    );
  }

  AnimatedOpacity _addCart(CartProvider cart, RestaurantProvider restaurant) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 2000),
      child: InkWell(
        onTap: () async {
          restaurant
              .restaurantsByDistance['${restaurant.currentRestaurantType}']
                  [restaurant.currentMenu]
              .menu
              .forEach((element) {
            if (element.itemCount != 0) {
              // cart.cartItems.add(element);
              cart.addToCart(element);
            }
            // element.itemCount = 0;
          });

          Navigator.pushNamed(context, kRestaurantCart);
        },
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

  Expanded _itemList(BuildContext context, ItemProvider menu,
      RestaurantProvider restaurant, List<Restaurant> restData) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: restData[restaurant.currentMenu].menu.length,
          itemBuilder: (context, index) {
            if (restData[restaurant.currentMenu].menu[index].itemCategory ==
                restData[restaurant.currentMenu].categories[currentIndexBar]) {
              return Container(
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
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${restData[restaurant.currentMenu].menu[index].itemImage}"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${restData[restaurant.currentMenu].menu[index].itemName}",
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "${restData[restaurant.currentMenu].menu[index].itemDescription}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 6,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "${restData[restaurant.currentMenu].menu[index].itemPrice} RM",
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
                                          onPressed: () {
                                            restaurant.decrement(index);
                                          },
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "${restData[restaurant.currentMenu].menu[index].itemCount}",
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
                                          onPressed: () {
                                            restaurant.increment(index);
                                          },
                                          color: Colors.black,
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
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Container _categoryList(RestaurantProvider restaurant, restData) {
    final menu = Provider.of<ItemProvider>(context);
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.builder(
        itemCount: restData[restaurant.currentMenu].categories.length,
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
              child: Center(
                  child: Text(
                      "${restData[restaurant.currentMenu].categories[index]}")),
            ),
          );
        },
      ),
    );
  }
}
