import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
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
                      "${restData[menu.currentMenu].image}",
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
              if (menu.visible) _addCart(menu, order)
            ],
          ),
        ),
      ),
    );
  }

  AnimatedOpacity _addCart(ItemProvider menu, CartProvider cart) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 2000),
      child: InkWell(
        onTap: () async {
          menu.cartItems.clear();
          menu.items.forEach((element) {
            if (element.itemCount != 0) menu.cartItems.add(element);
          });

          final response = await cart.checkDocument(userIdConst);
          if (response == true) {
            cart.addOrder(menu.cartItems);
          } else {
            cart.updateCart(menu.cartItems);
          }

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
      RestaurantProvider restaurant, restData) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: menu.items.length,
          itemBuilder: (context, index) {
            if (menu.items[index].itemCategory ==
                restData[menu.currentMenu].categories[currentIndexBar])
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
                                color: Colors.green,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "${menu.items[index].itemImage}"),
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
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "${menu.items[index].itemName}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "${menu.items[index].itemDescription}",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 5,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "${menu.items[index].itemPrice} RM",
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
                                            // int tempInvisible = 0;
                                            // menu.items[index].itemCount--;
                                            // if (menu.items[index].itemCount < 0)
                                            //   menu.items[index].itemCount = 0;
                                            // menu.items.forEach((element) {
                                            //   if (element.itemCount != 0)
                                            //     _visible = true;
                                            //   else
                                            //     tempInvisible++;
                                            // });
                                            // if (tempInvisible ==
                                            //     menu.items.length)
                                            //   _visible = false;

                                            // setState(() {});
                                            menu.decrement(index);
                                          },
                                          color: Colors.black,
                                        ),
                                        Text(
                                          // "${menuProvider.items[index].numberOfItems}",
                                          "${menu.items[index].itemCount}",
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
                                            menu.increment(index);
                                            // menu.items[index].itemCount++;
                                            // if (menu.items[index].itemCount < 0)
                                            //   menu.items[index].itemCount = 0;
                                            // _visible = true;
                                            // setState(() {});
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
            else
              return Text(".");
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
        itemCount: restData[menu.currentMenu].categories.length,
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
                  child:
                      Text("${restData[menu.currentMenu].categories[index]}")),
            ),
          );
        },
      ),
    );
  }
}
