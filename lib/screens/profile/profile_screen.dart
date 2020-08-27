import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependency.dart';
import 'package:work_app/models/order_class.dart';
import 'package:work_app/models/user_class.dart';
import 'package:work_app/provider/my_profile_provider.dart';
import 'package:work_app/provider/orders_provider.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/model_service/user_data_service.dart';

class MyProfile extends StatefulWidget {
  static const String routeName = "/MyProfilePage";

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final order_provider = Provider.of<OrderProvider>(context);
    // ignore: non_constant_identifier_names
    final user_provider = Provider.of<MyProfileProvider>(context);

    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: FutureBuilder<List<User>>(
        future: user.getList('users'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 30),
                                Text(
                                  "${user_provider.users[0].name}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.ltr,
                                ),
                                SizedBox(height: 5),
                                Text("${user_provider.users[0].email}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                    textDirection: TextDirection.ltr),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        disabledColor: Color(0xff5663FF),
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        onPressed: null,
                                        child: Text('Edit Profile')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    FlatButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        disabledColor: Colors.grey,
                                        disabledTextColor: Colors.black,
                                        padding: EdgeInsets.all(15.0),
                                        onPressed: null,
                                        child: Text('Settings')),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 30,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: SizedBox(
                        height: 20,
                        child: Text("Orders history "),
                      ),
                    ),
                    FutureBuilder<List<Order>>(
                      // future:
                      //     order_provider.getListById(user_provider.users[0].id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 130,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      // itemCount:
                                         
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onLongPress: () {
                                            order_provider.dataService.delete(
                                                'orders',
                                                order_provider
                                                    .orders[index].id);
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Card(
                                              elevation: 5,
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  // image: DecorationImage(
                                                  //     image: NetworkImage(
                                                  //         "${order_provider.ordersList[index].image}"),
                                                  //     fit: BoxFit.cover),
                                                ),
                                                child: Center(
                                                    child: Text("",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 32))),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  child: ListView.builder(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 25),
                                      scrollDirection: Axis.horizontal,
                                      // itemCount: rest.restaurants.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Card(
                                            elevation: 20,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: BorderSide(
                                                color: Colors.blueGrey,
                                                width: 1.0,
                                              ),
                                            ),
                                            color: Colors.grey.withOpacity(0.2),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  image: DecorationImage(
                                                      image: NetworkImage(""),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    )
                  ],
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
