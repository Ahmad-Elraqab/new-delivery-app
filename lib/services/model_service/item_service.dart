import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/models/item_class.dart';

class ItemService {
  Future update(Item data) async {
    await Firestore.instance
        .collection('restaurant')
        .document(data.restaurantId)
        .collection('menu')
        .document(data.itemId)
        .setData(data.toJson());

    return data;
  }
}
