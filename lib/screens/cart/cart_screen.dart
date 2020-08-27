import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(
              text: "current order",
            ),
            Tab(
              text: "history order",
            )
          ]),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: FloatingActionButton.extended(
            onPressed: null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            label: Text(
              "Checkout",
              // style: TextStyle(color: Colors.black),
            ),
            icon: Icon(
              FontAwesomeIcons.moneyBill,
              // color: Colors.black,
            ),
            // backgroundColor: Colors.blueGrey[100],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    padding: EdgeInsets.all(8.0),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          color: Colors.blueGrey[50],
                          width: MediaQuery.of(context).size.width / 2.3,
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn-b.william-reed.com/var/wrbm_gb_hospitality/storage/images/publications/hospitality/bighospitality.co.uk/article/2020/04/15/kfc-reopens-11-restaurants-for-delivery-only/3331532-1-eng-GB/KFC-reopens-11-restaurants-for-delivery-only_wrbm_large.png"),
                                        fit: BoxFit.cover)),
                                height: 250 / 2,
                                child: Align(
                                    alignment: Alignment(-0.9, -0.8),
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.blueGrey,
                                        size: 18,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "KFC Box",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.attach_money,
                                    size: 18,
                                  ),
                                  Text("45.60",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[200],
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                        ),
                                      ),
                                      height: 35,
                                      width: 40,
                                      child: IconButton(
                                          icon: Icon(FontAwesomeIcons.minus,
                                              size: 14),
                                          onPressed: null),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      height: 35,
                                      width: 50,
                                      child: Center(
                                          child: Text(
                                        "0",
                                        style: TextStyle(fontSize: 16),
                                      )),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[200],
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                      ),
                                      height: 35,
                                      width: 40,
                                      child: IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.plus,
                                            size: 14,
                                          ),
                                          onPressed: null),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey[50]),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Subtotal:"),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  size: 18,
                                ),
                                Text("1469.95"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Taxes:"),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  size: 18,
                                ),
                                Text("59.45"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("TOTAL:"),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.attach_money,
                                  size: 18,
                                ),
                                Text("1499.85"),
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
      ),
    );
  }
}
