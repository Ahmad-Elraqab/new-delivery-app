import 'item_class.dart';

class Cart {
  String cartId;
  String userId;
  double totalPrice;
  List<Item> items;

  Cart({
    this.cartId,
    this.userId,
    this.totalPrice,
    this.items,
  });
  Cart.fromJson(Map<String, dynamic> json)
      : this(
          cartId: json['cartId'],
          userId: json['userid'],
          totalPrice: json['totalPrice'],
          items:
              (json['items'] as List).map((doc) => Item.fromJson(doc)).toList(),
        );

  Map<String, dynamic> toJson() => {
        'cartId': cartId,
        'userid': userId,
        'totalPrice': totalPrice,
        'items': items
      };
}
