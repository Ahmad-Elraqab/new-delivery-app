import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/models/cart_class.dart';

class OrderDataService {
  List<Cart> ordersList = [];

  // user.getList('users');
  Future<List<Cart>> getListOrder({String id}) async {
    // user.getList('users');
    ordersList.clear();
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('orders').get();

    result.docs.forEach((doc) {
      if (doc.data()['userid'] == id) {
        ordersList.add(Cart.fromJson(doc.data()));
      }
    });

    return ordersList;
  }

  List<Cart> getOrders() {
    return ordersList;
  }
}

final order = OrderDataService();
