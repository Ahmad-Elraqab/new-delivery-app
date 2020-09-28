import 'package:flutter/cupertino.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/models/cart_class.dart';
import 'package:work_app/services/data_service.dart';
import '../dependency.dart';

class CartProvider with ChangeNotifier {
  List<Cart> orders = [];
  final String collection = 'orders';
  final userId = 'newUser';

  final dataService = service<DataService>();

  Future<void> addOrder(List<Item> data) async {
    double totalPrice = 0.0;
    data.forEach((e) => totalPrice += e.itemPrice * e.itemCount);
    Cart order = Cart(
      items: data,
      totalPrice: totalPrice,
      userId: userId,
    );

    await dataService.createOrderCollection(
        collection: 'cart', dataId: 'blablalba', data: order);
    notifyListeners();
  }

  void setOrdersFromStream(List data) {
    orders.clear();

    data.forEach((doc) {
      final result = Cart.fromJson(doc.data);
      result.cartId = doc.documentID;
      orders.add(result);
    });

    notifyListeners();
  }
}

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
