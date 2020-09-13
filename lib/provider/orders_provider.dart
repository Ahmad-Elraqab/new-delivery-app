import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/models/order_class.dart';
import 'package:work_app/models/restaurant_class.dart';
import 'package:work_app/services/data_service.dart';
import '../dependency.dart';

class OrderProvider with ChangeNotifier {
  List<Order> orders = [];
  final String collection = 'orders';
  final userId = 'newUser';
  // final String id= 'orders';

  final dataService = service<DataService>();

  // Future<List<Order>> getListById(String id) async {
  //   ordersList.clear();
  //   final result = await dataService.getListById(collection, id);

  //   result.documents.forEach((doc) {
  //     doc.data['id'] = doc.documentID;
  //     final order = Order.fromJson(doc.data);
  //     order.id = doc.documentID;
  //     ordersList.add(order);
  //   });
  //   return ordersList;
  // }
  Future<void> addOrder(List<Item> data) async {
    double totalPrice = 0.0;
    data.forEach((e) => totalPrice += e.itemPrice);
    Order order = Order(
      items: data,
      totalPrice: totalPrice,
      userId: userId,
    );

    await dataService.createOrderCollection(
        collection: 'orders', dataId: 'hello id', data: order);
    notifyListeners();
  }

  void setOrdersFromStream(List data) {
    orders.clear();

    data.forEach((doc) {
      final result = Order.fromJson(doc.data);
      result.orderId = doc.documentID;
      orders.add(result);
    });

    notifyListeners();
  }
}
