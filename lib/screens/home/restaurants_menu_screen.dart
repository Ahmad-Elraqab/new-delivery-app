import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantMenu extends StatefulWidget {
  @override
  _RestaurantMenuState createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  int numberOfOrders = 0;
  int currentIndexBar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Add to cart"),
        icon: Icon(
          FontAwesomeIcons.shoppingCart,
          size: 18,
        ),
        onPressed: () {
          //! Add items to cart
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.network(
                    "https://previews.123rf.com/images/geckophotos/geckophotos1807/geckophotos180700455/104601455-top-view-of-group-of-happy-friends-having-nice-food-and-drinks-enjoying-the-party-and-communication-.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: 
       
          Column(
            children: <Widget>[_categoryList(), _itemList(context)],
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
                                        setState(() {});
                                      },
                                      color: Colors.black,
                                    ),
                                    Text(
                                      // "${menuProvider.items[index].numberOfItems}",
                                      "0",
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
                                      onPressed: () {},
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
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(25),
        //   topRight: Radius.circular(25),
        // ),
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
