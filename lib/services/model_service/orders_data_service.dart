import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_app/models/order_class.dart';

class OrderDataService {  List<Order> ordersList = [];

  // user.getList('users');
  Future<List<Order>> getListOrder({String id}) async {
    // user.getList('users');
    ordersList.clear();
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection('orders').get();

    result.docs.forEach((doc) {
      if (doc.data()['userid'] == id) {
        ordersList.add(Order.fromJson(doc.data()));
      }
    });

    return ordersList;
  }

  List<Order> getOrders() {
    return ordersList;
  }
}

final order = OrderDataService();
