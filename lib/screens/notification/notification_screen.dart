import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  // static const String routeName = "/NotificationPage";

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 100.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.network(
                    "https://png.pngtree.com/thumb_back/fw800/back_our/20190619/ourmid/pngtree-blue-horn-background-material-image_141450.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Container(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                    height: 75,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.mcdonalds.com/content/dam/usa/nfl/assets/nav/m-logo_108x108.jpg"),
                        radius: 25,
                      ),
                      title: Text("Your order is ready to collect!"),
                      subtitle: Text("lorem osfk fjeejtr dlawd asd!"),
                      trailing: Icon(
                        // FontAwesomeIcons.times,
                        Icons.watch_later,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
