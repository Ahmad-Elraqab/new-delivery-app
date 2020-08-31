import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  // static int pageChanged = 0;
  PageController pageController = PageController(initialPage: 0);
  bool _visible = true;
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      DefaultTabController(
        // initialIndex: pageChanged,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                // backgroundColor: Colors.red,
                expandedHeight: 150.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.network(
                    "https://image.freepik.com/free-vector/order-delivery-service-online-background_73174-203.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  onTap: (index) {
                    // pageChanged = index;
                    pageController.animateToPage(index,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.bounceInOut);
                  },
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(icon: Icon(Icons.list), text: "current order"),
                    Tab(icon: Icon(Icons.history), text: "order history"),
                  ],
                ),
              ),
            ];
          },
          body: PageView(
            onPageChanged: (index) {
              // pageChanged = index;
              // print(pageChanged);
              setState(() {});
            },
            controller: pageController,
            children: <Widget>[_orderListScreen(), _historyScreen(context)],
          ),
        ),
      ),
    );
  }

  Container _historyScreen(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                currentIndex = index;
                _visible = !_visible;
                setState(() {});
              },
              child: Container(
                height: currentIndex == index && !_visible ? 300 : 80.0,
                child: Card(
                  color: Colors.blueGrey[100],
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("Order: 35D32F5H65GG4D"),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("23/05/2020"),
                            InkWell(
                              child: Text(
                                "Reorder",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text("Total: 2040 RM"),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                child: Card(
                                  color: Colors.blueGrey[50],
                                  child: Center(
                                    child: ListTile(
                                      title: Text("Signature Box"),
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://cdn.kfc.com.my/images/menu/self-collect/stacker-box.jpg"),
                                        radius: 25,
                                      ),
                                      trailing: Text("25.18 RM"),
                                      subtitle: Text(
                                          "kopkaodsf kf e o egkowekg p w "),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
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

  SingleChildScrollView _orderListScreen() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _sammaryBox(),
          _orderList(),
        ],
      ),
    );
  }

  Padding _sammaryBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.blueGrey[50]),
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: null,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.moneyBill,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Checkout",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _orderList() {
    return Container(
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
                      height: 15,
                    ),
                    Text(
                      "KFC Box",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
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
                          height: 30,
                          width: 35,
                          child: IconButton(
                              icon: Icon(FontAwesomeIcons.minus, size: 10),
                              onPressed: null),
                        ),
                        Container(
                          color: Colors.white,
                          height: 30,
                          width: 35,
                          child: Center(
                              child: Text(
                            "0",
                            style: TextStyle(fontSize: 14),
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
                          height: 30,
                          width: 35,
                          child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                size: 10,
                              ),
                              onPressed: null),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
