import 'package:flutter/material.dart';
import 'package:work_app/dependency.dart';
import 'package:work_app/screens/profile/profile_screen.dart';
import 'package:work_app/services/data_service.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';
import 'notification/notification_screen.dart';

class App extends StatefulWidget {
  int currentIndex;
  App({this.currentIndex = 0});
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  _onItemTapped(index) {
    setState(() {
      widget.currentIndex = index;
    });
  }

  // ignore: missing_return
  Widget callPage(index) {
    switch (index) {
      case 0:
        return HomeScreen();
        break;
      case 1:
        return Cart();
        break;
      case 2:
        return NotificationPage();
        break;
      case 3:
        return MyProfile();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataService = service<DataService>();
    return Scaffold(
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.currentIndex == 0
          ? FloatingActionButton(
              onPressed: () async{
                await dataService.create('restaurant');
                // _showDialog(context);
              },
              child: Icon(Icons.add),
            )
          : null,
      body: callPage(widget.currentIndex),
      bottomNavigationBar: _getBottomNav(),
    );
  }

  _getBottomNav() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _getNavItem(index: 0, icon: Icons.home),
          _getNavItem(index: 1, icon: Icons.shopping_cart),
          if (widget.currentIndex == 0)
            SizedBox(
              width: 20,
            ),
          _getNavItem(index: 2, icon: Icons.notifications),
          _getNavItem(index: 3, icon: Icons.person),
        ],
      ),
    );
  }

  Widget _getNavItem({int index, IconData icon}) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.currentIndex = index;
        });
      },
      child: Container(
        child: Icon(
          icon,
          color: widget.currentIndex == index ? Colors.deepOrange : Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}
