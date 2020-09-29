import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/models/cart_class.dart';
import 'package:work_app/provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with SingleTickerProviderStateMixin {
  // static int pageChanged = 0;
  PageController pageController = PageController(initialPage: 0);
  bool _visible = true;
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          // initialIndex: pageChanged,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  // backgroundColor: Colors.red,
                  expandedHeight: 0.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                  ),
                  bottom: TabBar(
                    onTap: (index) {
                      // pageChanged = index;
                      pageController.animateToPage(index,
                          duration: Duration(milliseconds: 250),
                          curve: Curves.bounceInOut);
                    },
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black87,
                    tabs: [
                      Tab(icon: Icon(Icons.list), text: "current order"),
                      Tab(icon: Icon(Icons.history), text: "order history"),
                    ],
                  ),
                ),
              ];
            },
            body: FutureBuilder(
              future: cart.dataService.getCart(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                   final Cart cartItems = snapshot.data;

                  return PageView(
                    onPageChanged: (index) {
                      // pageChanged = index;
                      // print(pageChanged);
                      setState(() {});
                    },
                    controller: pageController,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text('${cartItems.items}'),
                            _orderList(),
                            _summaryBox(context),
                            _checkoutButton()
                          ],
                        ),
                      ),
                      _historyScreen(context),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }

  Padding _checkoutButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            "Checkout",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Column _summaryBox(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 3,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Subtotal:",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "1469.95 RM",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Delivery:",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Free",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Taxes:",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "59.45 RM",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "TOTAL:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "1499.85 RM",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
                  color: Colors.blueGrey[50],
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
                                style: TextStyle(color: Colors.pink),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          "Total: 2040 RM",
                          style: TextStyle(color: Colors.pink),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                child: Card(
                                  color: Colors.blueGrey[100],
                                  child: Center(
                                    child: ListTile(
                                      title: Text("Signature Box",
                                          style: TextStyle(fontSize: 16)),
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://cdn.kfc.com.my/images/menu/self-collect/stacker-box.jpg"),
                                        radius: 25,
                                      ),
                                      trailing: Text(
                                        "25.18 RM",
                                        style: TextStyle(
                                            color: Colors.pink, fontSize: 16),
                                      ),
                                      subtitle: Text(
                                        "This text field is made for samll description about the item",
                                        style: TextStyle(fontSize: 12),
                                      ),
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

  Padding _orderList() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Card(
        elevation: 3,
        child: Container(
          height: 400,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            padding: EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn-b.william-reed.com/var/wrbm_gb_hospitality/storage/images/publications/hospitality/bighospitality.co.uk/article/2020/04/15/kfc-reopens-11-restaurants-for-delivery-only/3331532-1-eng-GB/KFC-reopens-11-restaurants-for-delivery-only_wrbm_large.png"),
                                  fit: BoxFit.cover)),
                          width: 75,
                          height: 75,
                          child: Align(
                              alignment: Alignment(-0.9, -0.8),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.blueGrey,
                                  size: 14,
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 8.0),
                            height: 75,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "KFC Box",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "this text is made for small description",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 10,
                                )),
                                Text(
                                  "45.60 RM",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: 25,
                              width: 25,
                              child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.minus,
                                    size: 10,
                                    color: Colors.grey,
                                  ),
                                  onPressed: null),
                            ),
                            Container(
                              color: Colors.white,
                              height: 25,
                              width: 25,
                              child: Center(
                                  child: Text(
                                "0",
                                style: TextStyle(fontSize: 14),
                              )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey[50],
                                  borderRadius: BorderRadius.circular(5)),
                              height: 25,
                              width: 25,
                              child: IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.plus,
                                    size: 10,
                                    color: Colors.pink,
                                  ),
                                  onPressed: null),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
