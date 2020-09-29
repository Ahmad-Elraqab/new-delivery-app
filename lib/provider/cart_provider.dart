import 'package:flutter/cupertino.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/models/cart_class.dart';
import 'package:work_app/services/data_service.dart';
import '../dependency.dart';

class CartProvider with ChangeNotifier {
  List<dynamic> carts = [];
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

  // void setCart(List data1, List data2) {
  //   carts.clear();

  //   for (int i = 0; i < data1.length; i++) {
  //     final result = Cart.fromJson(data1[i].data(), data2[i].data());

  //     carts.add(result);
  //   }

  //   notifyListeners();
  // }
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
