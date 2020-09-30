import 'package:flutter/cupertino.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/models/cart_class.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/screens_service/cart_service.dart';
import '../dependency.dart';

class CartProvider with ChangeNotifier {
  Cart carts;
  final userId = 'newUser';

  final dataService = service<DataService>();
  final cartService = CartService();

  Future<void> addOrder(List<Item> data) async {
    await cartService.createCart(data);
  }

  Future<void> updateCart(List<Item> data) async {
    // final dataList = data;

    data.forEach((element) async {
      final checkData = await cartService.checkItemExist(carts.id, element.id);

      carts.items.forEach((doc) {
        if (doc.id == element.id) element.itemCount += doc.itemCount;
      });

      if (checkData == false) {
        await cartService.updateCartDocument(element, carts.id);
      } else {
        await cartService.updateCartRepeated(element, carts.id, checkData);
      }
    });
    notifyListeners();
  }

  Future<void> getCart() async {
    final cartList = await cartService.getCartItems();
    carts = await cartList;

    return cartList;
  }

  Future checkDocument(String id) async {
    return await cartService.checkDoc(id);
  }
}
