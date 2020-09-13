import 'package:flutter/cupertino.dart';
import 'package:work_app/dependency.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/model_service/item_service.dart';

class ItemProvider with ChangeNotifier {
  List<Item> items = [];
  final dataService = service<DataService>();
  final itemService = service<ItemService>();

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
  List<Item> getMenu(List data) {
    items.clear();
    // final menus =  dataService.getStreamSecondCollection(
    //     collection1: 'restaurant', docId1: restaurantId, collection2: 'menu');

    data.forEach((doc) {
      final result = Item.fromJson(doc.data);
      result.itemId = doc.documentID;
      items.add(result);
    });

    // if (items.isEmpty) return null;
  }

  void increment(index) {
    // items[index].numberOfItems++;
    // itemService.update(items[index]);
    notifyListeners();
  }

  void decrement(index) {
    // items[index].numberOfItems--;
    // itemService.update(items[index]);
    notifyListeners();
    // items[index].numberOfItems--;
    // notifyListeners();
  }
}
