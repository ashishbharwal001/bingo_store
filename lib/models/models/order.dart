import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int? id;
  final String? orderId;
  final String? productImage;
  final String? date;
  final String? time;
  final String? status;
  final String? shippingStatus;
  final String? amount;

  const Order({
    this.id,
    this.orderId,
    this.productImage,
    this.date,
    this.time,
    this.status,
    this.shippingStatus,
    this.amount,
  });

  @override
  String toString() {
    return 'Order(id: $id, orderId: $orderId, productImage: $productImage, date: $date, time: $time, status: $status, shippingStatus: $shippingStatus, amount: $amount)';
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Order) return false;
    return other.id == id &&
        other.orderId == orderId &&
        other.productImage == productImage &&
        other.date == date &&
        other.time == time &&
        other.status == status &&
        other.shippingStatus == shippingStatus &&
        other.amount == amount;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      orderId.hashCode ^
      productImage.hashCode ^
      date.hashCode ^
      time.hashCode ^
      status.hashCode ^
      shippingStatus.hashCode ^
      amount.hashCode;

  static List<Order> fetchAllOrders() {
    return [
      Order(
          orderId: "134520",
          productImage: "detol.jpg",
          date: "10/10/2021",
          time: "08:01 AM",
          status: "PAID",
          shippingStatus: "Accepted",
          amount: "198"),
      Order(
          orderId: "134520",
          productImage: "surf2.jpg",
          date: "10/10/2021",
          time: "11:01 AM",
          status: "PAID",
          shippingStatus: "Accepted",
          amount: "290"),
      Order(
          orderId: "134521",
          productImage: "surf.jpg",
          date: "10/10/2021",
          time: "01:01 PM",
          status: "PAID",
          shippingStatus: "Shipped",
          amount: "423"),
      Order(
          orderId: "134522",
          productImage: "maggie.jpeg",
          date: "10/10/2021",
          time: "01:01 PM",
          status: "PAID",
          shippingStatus: "Pending",
          amount: "72"),
      Order(
          orderId: "134520",
          productImage: "detol.jpg",
          date: "10/10/2021",
          time: "08:01 AM",
          status: "PAID",
          shippingStatus: "Accepted",
          amount: "198"),
      Order(
          orderId: "134520",
          productImage: "surf2.jpg",
          date: "10/10/2021",
          time: "11:01 AM",
          status: "PAID",
          shippingStatus: "Accepted",
          amount: "290"),
      Order(
          orderId: "134521",
          productImage: "surf.jpg",
          date: "10/10/2021",
          time: "01:01 PM",
          status: "PAID",
          shippingStatus: "Shipped",
          amount: "423"),
      Order(
          orderId: "134522",
          productImage: "maggie.jpeg",
          date: "10/10/2021",
          time: "01:01 PM",
          status: "PAID",
          shippingStatus: "Pending",
          amount: "72"),
    ];
  }
}
