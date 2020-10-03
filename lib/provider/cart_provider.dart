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
    data.forEach((element) {
      element.totalPrice = element.itemCount * element.itemPrice;
    });
    await cartService.createCart(data);
  }

  Future<void> updateCart(List<Item> data) async {
    data.forEach((element) async {
      final checkData = await cartService.checkItemExist(carts.id, element.id);

      if (checkData == false) {
        element.totalPrice = element.itemCount * element.itemPrice;
        carts.totalPrice += element.totalPrice;
        await cartService.updateCartDocument(element, carts.id);
      } else {
        element.totalPrice = element.itemCount * element.itemPrice;
        carts.totalPrice += element.totalPrice;
        element.itemCount += checkData[0].data()['itemCount'];
        element.totalPrice += checkData[0].data()['totalPrice'];
        await cartService.updateCartRepeated(
            element, carts.id, checkData[0].id);
      }

      await cartService.updateCartTotalPrice(carts.id, carts.totalPrice);
    });

    notifyListeners();
  }

  // carts.items.forEach((doc) {
  //   if (doc.id == element.id) {
  //     element.totalPrice = element.itemCount * element.itemPrice;
  //     carts.totalPrice += element.totalPrice;
  //     element.itemCount += doc.itemCount;
  //   } else {
  //     element.totalPrice = element.itemCount * element.itemPrice;
  //     carts.totalPrice += element.totalPrice;
  //   }
  // });

  // await cartService.updateCartTotalPrice(carts.id, carts.totalPrice);

  Future<void> getCart() async {
    final cartList = await cartService.getCartItems();
    carts = await cartList;

    return cartList;
  }

  Future checkDocument(String id) async {
    return await cartService.checkDoc(id);
  }

  increment(int index) async {
    carts.items[index].itemCount++;
    carts.items[index].totalPrice =
        carts.items[index].itemCount * carts.items[index].itemPrice;

    await cartService.updateItemField(
        carts.items[index], carts.items[index].menuId, carts.id);

    double totalPrice = 0.0;
    carts.items.forEach((element) {
      totalPrice += element.totalPrice;
    });
    await cartService.updateCartTotalPrice(carts.id, totalPrice);

    notifyListeners();
  }

  decrement(int index) async {
    carts.items[index].itemCount--;
    carts.items[index].totalPrice =
        carts.items[index].itemCount * carts.items[index].itemPrice;
    await cartService.updateItemField(
        carts.items[index], carts.items[index].menuId, carts.id);

    double totalPrice = 0.0;
    carts.items.forEach((element) {
      totalPrice += element.totalPrice;
    });
    await cartService.updateCartTotalPrice(carts.id, totalPrice);
    notifyListeners();
  }

  delete(int index) async {
    await cartService.deleteFromCart(carts.items[index].menuId, carts.id);

    double totalPrice = 0.0;
    carts.items.remove(carts.items[index]);
    carts.items.forEach((element) {
      totalPrice += element.totalPrice;
    });
    await cartService.updateCartTotalPrice(carts.id, totalPrice);
    notifyListeners();
  }
}
