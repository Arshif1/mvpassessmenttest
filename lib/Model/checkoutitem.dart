import 'package:mvpassessmenttest/Model/product.dart';

class Checkoutitem {
  String shippingAddress;
  String paymentMethod;
  Product product;

  Checkoutitem(this.paymentMethod, this.product, this.shippingAddress);
}