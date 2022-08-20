import 'package:l_and_u/product/model/product.dart';

class AllOrders {
  List<OrdersToDelever> ordersToDelever;
  AllOrders({required this.ordersToDelever});
  factory AllOrders.fromJson(Map<Object?, dynamic> json) => AllOrders(
        ordersToDelever: List<OrdersToDelever>.from(
            json["ordersToDelever"].map((x) => OrdersToDelever.fromJson(x))),
      );
  Map<Object?, dynamic> toJson() => {
        "ordersToDelever": List<dynamic>.from(ordersToDelever.map((x) => x.toJson())),
      };
}

class OrdersToDelever {
  OrdersToDelever({
    required this.priceWithTax,
    required this.myOrder,
  });

  MyOrder myOrder;
  double priceWithTax;

  factory OrdersToDelever.fromJson(Map<Object?, dynamic> json) =>
      OrdersToDelever(
        priceWithTax: json["priceWithTax"],
        myOrder: json["myOrder"],
      );

  Map<Object?, dynamic> toJson() => {
        "priceWithTax": priceWithTax,
        "myOrder": myOrder.toJson(),
      };
}

class MyOrder {
  MyOrder({
    required this.totalPrice,
    required this.orders,
  });

  List<Order> orders;
  double totalPrice;

  factory MyOrder.fromJson(Map<Object?, dynamic> json) => MyOrder(
        totalPrice: json["totalPrice"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalPrice": totalPrice,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.orderCode,
    required this.orderColorName,
    required this.colorNumber,
    required this.orderName,
    required this.price,
    required this.totalPrice,
    required this.colorIndex,
    required this.sizeIndex,
    required this.images,
    required this.number,
    required this.orderSize,
    this.product,
  });

  String orderCode;
  String orderColorName;
  String colorNumber;
  String orderName;
  double price;
  double totalPrice;
  int colorIndex;
  int sizeIndex;
  String images;
  double number;
  String orderSize;
  Proudct? product;

  factory Order.fromJson(Map<Object?, dynamic> json) => Order(
        orderCode: json["orderCode"],
        orderColorName: json["orderColorName"],
        colorNumber: json["colorNumber"],
        orderName: json["orderName"],
        price: json["price"].toDouble(),
        totalPrice: json["totalPrice"].toDouble(),
        colorIndex: json["colorIndex"],
        sizeIndex: json["sizeIndex"],
        images: json["image"],
        number: json["number"].toDouble(),
        orderSize: json["orderSize"],
        product: Proudct.fromJson(json["product"]),
      );

  Map<Object?, dynamic> toJson() => {
        "orderCode": orderCode,
        "orderColorName": orderColorName,
        "colorNumber": colorNumber,
        "orderName": orderName,
        "price": price,
        "totalPrice": totalPrice,
        "colorIndex": colorIndex,
        "sizeIndex": sizeIndex,
        "image": images,
        "number": number,
        "orderSize": orderSize,
        "product": product!.toJson(),
      };
}
