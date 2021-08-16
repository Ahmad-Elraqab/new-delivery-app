import 'package:flutter/cupertino.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/screens_service/cart_service.dart';
import '../dependency.dart';

class CartProvider with ChangeNotifier {
  final userId = 'newUser';
  final dataService = service<DataService>();
  final cartService = CartService();

  // ignore: deprecated_member_use
  List<Item> cartItems = new List<Item>();

  Future<void> addToCart(Item data) async {
    final valid =
        await cartService.checkItemExist('Ikpfx9o03W1nD168LFfQ', data.id);
    // !?! i must add meal id to the meals to validate its existence in the cart............. it supposed to be data.mealId
    if (valid == false) {
      data.totalPrice = data.itemCount * data.itemPrice;
      await cartService.addItemsToCart(data.toJson());
    } else {
      data.itemCount += valid.data()['itemCount'];
      data.totalPrice = data.itemCount * data.itemPrice;
      await cartService.updateItemField(data, valid.id);
    }

    notifyListeners();
  }

  Future<void> getCart() async {
    final cartList = await cartService.getCartItems();
    cartItems = cartList;

    return cartList;
  }

  double getTotalPrice() {
    double total = 0;
    cartItems.forEach((element) {
      total += element.totalPrice;
    });

    return total.roundToDouble();
  }

  Future checkDocument(String id) async {
    return await cartService.checkDoc(id);
  }

  increment(int index) async {
    cartItems[index].itemCount++;
    cartItems[index].totalPrice =
        cartItems[index].itemCount * cartItems[index].itemPrice;

    await cartService.updateItemField(
        cartItems[index], cartItems[index].menuId);

    notifyListeners();
  }

  decrement(int index) async {
    cartItems[index].itemCount--;
    cartItems[index].totalPrice =
        cartItems[index].itemCount * cartItems[index].itemPrice;
    await cartService.updateItemField(
        cartItems[index], cartItems[index].menuId);

    notifyListeners();
  }

  delete(int index) async {
    await cartService.deleteFromCart(cartItems[index].menuId);

    // double totalPrice = 0.0;
    // cartItems.remove(cartItems[index]);
    // cartItems.forEach((element) {
    //   totalPrice += element.totalPrice;
    // });
    notifyListeners();
  }
}
