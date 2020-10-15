import 'package:work_app/dependencies/constants.dart';
import 'package:work_app/models/cart_class.dart';
import 'package:work_app/models/item_class.dart';
import '../../dependency.dart';
import '../data_service.dart';

class CartService {
  final dataService = service<DataService>();

  Future getCartItems() async {
    // final carts = await dataService.getCart();
    // final items = await dataService.getCartItems(carts[0]);
    // final id = carts[0].documentID;
    // final Map<String, dynamic> mergedCart = carts[0].data();
    // final result = (items as List).map((e) => e.data()).toList();
    // double totalPrice = 0.0;

    // mergedCart['id'] = id;
    // mergedCart['items'] = result;

    // for (var i = 0; i < mergedCart['items'].length; i++) {
    // mergedCart['items'][i]['menuId'] = items[i].documentID;
    // totalPrice += mergedCart['items'][i]['totalPrice'];
    // }

    // mergedCart['totalPrice'] = totalPrice;

    final items = await dataService.getCartItems();
    
    return (items as List).map((e) => Item.fromJson(e)).toList();
  }

  Future<void> createCart(List<Item> data) async {
    double totalPrice = 0.0;
    data.forEach((e) => totalPrice += e.itemPrice * e.itemCount);

    Cart order = Cart(
      items: data,
      totalPrice: totalPrice,
      userId: userIdConst,
    );

    await dataService.createOrderCollection(collection: 'cart', data: order);
  }

  Future<void> updateCartRepeated(Item data, String id, String itemId) async {
    await dataService.updateRepeated(data.toJson(), id, itemId);
  }

  Future<void> updateCartDocument(Item data, String id) async {
    await dataService.updateDocument(data.toJson(), id);
  }

  Future<void> deleteCart({Cart r, String id}) {
    return null;
  }

  Future checkDoc(String id) async {
    return await dataService.checkExist('cart', id: id);
  }

  Future checkItemExist(String cartId, String itemId) async {
    return await dataService.checkItemExistInDoc(cartId, itemId);
  }

  Future updateItemField(Item data, String itemId, String cartId) async {
    final result = data.toJson();

    return await dataService.updateRepeated(result, cartId, itemId);
  }

  Future deleteFromCart(String itemId, String cartId) async {
    return await dataService.deleteFromSubCollection(cartId, itemId);
  }

  Future updateCartTotalPrice(String cartId, double totalPrice) async {
    return await dataService
        .update(cartId, 'cart', data: {'totalPrice': totalPrice});
  }

  Future<void> addItemsToCart(Map items) async {
    await dataService.addToSubCollection(
        'Ikpfx9o03W1nD168LFfQ', items, 'users', 'cart');
  }
}
