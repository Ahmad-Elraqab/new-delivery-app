import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/provider/restaurant_provider.dart';
import 'package:work_app/screens/home/components/search_bar.dart';

class RestaurantsList extends StatefulWidget {
  @override
  RrestaurantStatesList createState() => RrestaurantStatesList();
}

class RrestaurantStatesList extends State<RestaurantsList> {
  var rng = new Random();
  List<String> imgs = [
    "https://i.pinimg.com/originals/2d/8e/79/2d8e79276a81c84a74d4641ff440f1db.jpg",
    "https://pbs.twimg.com/profile_images/973995484749721601/WZEpvJeD_400x400.jpg",
    "https://cdn.logojoy.com/wp-content/uploads/2018/05/30151550/1317.png",
    "https://i.pinimg.com/originals/95/90/79/959079e4f999d7aca76a7307f3148d76.jpg",
    "https://static.vecteezy.com/system/resources/thumbnails/000/331/114/small/Pizza_Logo_Emblem_4.jpg",
    "https://image.freepik.com/free-vector/pizza-logo-vector_25327-119.jpg",
    "https://static-cse.canva.com/blob/137719/Red-and-Black-Japanese-Restaurant-Logo.png",
    "https://ucarecdn.com/7ccac1f3-c7ec-47ea-8737-eb73d86339d7/-/quality/lighter/-/format/auto/-/scale_crop/1920x1080/center/",
    "https://1000logos.net/wp-content/uploads/2016/12/original-starbucks-logo.jpg",
    "https://i.pinimg.com/736x/0b/17/0d/0b170d5a13ae67f693d3f2b4615812ff.jpg",
    "https://www.sunwayputramall.com/wp-content/uploads/2019/11/texaschicken_logo.jpg",
    "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0021/5231/brand.gif?itok=B_qMZvtv",
    "https://lh3.googleusercontent.com/proxy/GUY443z7LInISXIEfiwdW4lv7F4khqndcfQymKxoVpVGHgVmcbCJP4UIb2gcN05TageqxPSY73OurSsOelO4oDl5djakV9Rbi7FaBXqgiSMlXvX-XpM",
    "https://uploads.prod01.london.platform-os.com/instances/21/assets/images/logos/pizza-hut-express.png?updated=1568384417",
    "https://fastly.4sqi.net/img/general/200x200/58979480_nIDls8LLNeA39LmcwMrfyprPLPc_UpA-xsZCMZGsgWg.jpg",
    "https://s3-us-west-2.amazonaws.com/cities.directory/jeddah.cool/public_html/uploads/place_images/covers/3d0f4d91bd25c8980b9c1159b115a3f7.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    // final restaurantData = Provider.of<RestaurantProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: false,
                pinned: false,
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              SearchBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    children: List.generate(
                      30,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  // color: Color.fromRGBO(10, rng.nextInt(100),
                                  //     rng.nextInt(100), 0.3),
                                  color: Colors.grey[200]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        // gradient: LinearGradient(
                                        //   begin: Alignment.topCenter,
                                        //   end: Alignment.bottomCenter,
                                        //   colors: [
                                        //     Colors.transparent,
                                        //     Colors.white.withOpacity(0.5),
                                        //   ],
                                        // ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "${imgs[rng.nextInt(16)]}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text("Shop name"),
                                              Text(
                                                  "this place made to write any specific"),
                                              Container(
                                                height: 25,
                                                color: Colors.grey[200],
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.deepOrange,
                                                          size: 18),
                                                      Icon(Icons.star,
                                                          color: Colors.grey,
                                                          size: 18),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
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
      ),
      // body:
    );
  }
}
