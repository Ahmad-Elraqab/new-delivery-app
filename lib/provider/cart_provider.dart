import 'package:flutter/cupertino.dart';
import 'package:work_app/models/item_class.dart';
import 'package:work_app/services/data_service.dart';
import 'package:work_app/services/screens_service/cart_service.dart';
import '../dependency.dart';

class CartProvider with ChangeNotifier {
  final userId = 'newUser';
  final dataService = service<DataService>();
  final cartService = CartService();

  List<Item> cartItems = new List<Item>();

  Future<void> addToCart(Item data) async {
    data.totalPrice = data.itemCount * data.itemPrice;
    await cartService.addItemsToCart(data.toJson());

    notifyListeners();
  }

  Future<void> getCart() async {
    final cartList = await cartService.getCartItems();
    cartItems = await cartList;

    return cartList;
  }

  double getTotalPrice() {
    double total = 0;
    cartItems.forEach((element) {
      total += element.totalPrice;
    });

    return total;
  }

  Future checkDocument(String id) async {
    return await cartService.checkDoc(id);
  }

  increment(int index) async {
    cartItems[index].itemCount++;
    cartItems[index].totalPrice =
        cartItems[index].itemCount * cartItems[index].itemPrice;

    await cartService.updateItemField(cartItems[index], cartItems[index].id);

    notifyListeners();
  }

  decrement(int index) async {
    cartItems[index].itemCount--;
    cartItems[index].totalPrice =
        cartItems[index].itemCount * cartItems[index].itemPrice;
    await cartService.updateItemField(cartItems[index], cartItems[index].id);

    notifyListeners();
  }

  delete(int index) async {
    await cartService.deleteFromCart(cartItems[index].id);

    // double totalPrice = 0.0;
    // cartItems.remove(cartItems[index]);
    // cartItems.forEach((element) {
    //   totalPrice += element.totalPrice;
    // });
    notifyListeners();
  }
}
