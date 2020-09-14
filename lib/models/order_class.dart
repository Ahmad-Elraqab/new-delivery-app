import 'item_class.dart';

class Order {
  String orderId;
  String userId;
  String numberOfItems;
  double totalPrice;
  List<Item> items;

  Order({
    this.orderId,
    this.userId,
    this.totalPrice,
    this.numberOfItems,
    this.items,
  });
  Order.fromJson(Map<String, dynamic> json)
      : this(
          orderId: json['orderId'],
          userId: json['userid'],
          numberOfItems: json['numberOfItems'],
          totalPrice: json['totalPrice'],
          items:
              (json['items'] as List).map((doc) => Item.fromJson(doc)).toList(),
        );

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'userid': userId,
        'numberOfItems': numberOfItems,
        'totalPrice': totalPrice,
        'items': items
      };
}
