import 'package:mvpassessmenttest/Model/product.dart';

class Cartitem {
 final Product product;
  int quantity;

   Cartitem({required this.product, this.quantity = 1});
}