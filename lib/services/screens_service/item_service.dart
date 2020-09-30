import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/models/item_class.dart';

class ItemService {
  Future update(Item data) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(data.restaurantId)
        .collection('menu')
        .doc(data.id)
        .set(data.toJson());

    return data;
  }
}
