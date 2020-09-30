import 'package:flutter/cupertino.dart';
import 'package:work_app/dependency.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/screens_service/item_service.dart';

class ItemProvider with ChangeNotifier {
  List<Item> items = [];
  List<Item> cartItems = [];
  final dataService = service<DataService>();
  final itemService = service<ItemService>();
  bool visible = false;
  int currentMenu;

  List<Item> getMenuItems(List data) {
    items.clear();
    data.forEach((doc) {
      final result = Item.fromJson(doc.data());

      // ignore: unnecessary_statements
      result.itemCount == null ? result.itemCount = 0 : null;
      result.id = doc.documentID;
      items.add(result);
    });

    // if (items.isEmpty) return null;
  }

  void increment(index) {
    items[index].itemCount++;
    if (items[index].itemCount < 0) items[index].itemCount = 0;
    visible = true;
    notifyListeners();
  }

  void decrement(index) {
    int tempInvisible = 0;
    items[index].itemCount--;
    if (items[index].itemCount < 0) items[index].itemCount = 0;
    items.forEach((element) {
      if (element.itemCount != 0)
        visible = true;
      else
        tempInvisible++;
    });
    if (tempInvisible == items.length) visible = false;

    notifyListeners();
  }
}

// Future<List<Item>> getMenu(String restaurantId) async {
//   items.clear();
//   final menus = await dataService.getStreamSecondCollection(
//       collection1: 'restaurant', docId1: restaurantId, collection2: 'menu');

//   menus.documents.forEach((doc) {
//     final result = Item.fromJson(doc.data);
//     result.id = doc.documentID;
//     items.add(result);
//   });

//   if (items.isEmpty) return null;

//   return items;
// }
