import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/models/item_class.dart';

import '../../dependency.dart';
import '../data_service.dart';

class ItemService {
  final dataService = service<DataService>();
  Future update(Item data) async {
    await FirebaseFirestore.instance
        .collection('restaurant')
        .doc(data.restaurantId)
        .collection('menu')
        .doc(data.id)
        .set(data.toJson());

    return data;
  }

  Future getItems(String id) async {
    final data = await dataService.getMenu(id);

    final result = [];
    data.forEach((element) {
      Map x = element.data();

      x['itemCount'] == null ? x['itemCount'] = 0 : null;
      x["itemId"] = element.id;
      result.add(x);
    });

    return (result).map((e) => Item.fromJson(e)).toList();
  }
}
