import 'item_class.dart';

class Cart {
  String id;
  String userId;
  double totalPrice;
  List<Item> items;

  Cart({
    this.id,
    this.userId,
    this.totalPrice,
    this.items,
  });
  // Cart.fromJson(Map<String, dynamic> json, dynamic json2)
  Cart.fromJson(Map<String, dynamic> json)
      : this(
          // id: json['id'],
          // userId: json['userid'],
          // totalPrice: json['totalPrice'],
          items:
              (json['items'] as List).map((doc) => Item.fromJson(doc)).toList(),
        );

  Map<String, dynamic> toJson() =>
      {'id': id, 'userid': userId, 'totalPrice': totalPrice, 'items': items};
}
