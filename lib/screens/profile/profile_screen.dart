import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  List<String> itemsList = [
    "Payment Cards",
    "Address",
    "Delivery Support",
    "Settings",
    "Terms of use",
    "Privacy policy"
  ];
  List<Widget> iconsList = [
    Icon(FontAwesomeIcons.creditCard, size: 30, color: Colors.blueGrey),
    Icon(FontAwesomeIcons.addressCard, size: 30, color: Colors.yellow),
    Icon(FontAwesomeIcons.solidQuestionCircle, size: 30, color: Colors.red),
    Icon(Icons.settings, size: 30, color: Colors.blue),
    Icon(FontAwesomeIcons.exclamationCircle, size: 30, color: Colors.green),
    Icon(FontAwesomeIcons.lock, size: 30, color: Colors.yellow)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2.5,
                                    offset: Offset(1, 1),
                                    spreadRadius: 0.5)
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Ricardo McDonald",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                "corkey_dakota@gmail.com",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Account Credits",
                                          style: TextStyle(
                                              fontSize: 18, color: Colors.grey),
                                        ),
                                        Text(
                                          "52.25 RM",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Card(
                  elevation: 5,
                  child: ListView.builder(
                    itemCount: itemsList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        height: 75,
                        child: Center(
                          child: ListTile(
                            leading: iconsList[index],
                            title: Text(
                              "${itemsList[index]}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(
                              // FontAwesomeIcons.times,
                              Icons.arrow_forward_ios,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  TopBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0 + shrinkOffset / 2),
              bottomRight: Radius.circular(0 + shrinkOffset / 2),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 3,
          left: 20,
          child: Container(
            height: expandedHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.5,
                          offset: Offset(1, 1),
                          spreadRadius: 0.5)
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Ricardo McDonald",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      "corkey_dakota@gmail.com",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Account Credits",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.grey),
                              ),
                              Text(
                                "52.25 RM",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10 - shrinkOffset / 17,
          left: 5,
          child: Container(
            width: MediaQuery.of(context).size.width - 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
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
