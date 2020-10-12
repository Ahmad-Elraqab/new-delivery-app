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

  Future getMenuItems(String id) async {
    items.clear();

    final data = await itemService.getItems(id);

    items = data;
    return items;
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
