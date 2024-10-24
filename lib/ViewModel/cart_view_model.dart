import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/Model/cartitem.dart';
import 'package:mvpassessmenttest/Model/product.dart';
import '../View/Checkout Views/checkout_view.dart';

class CartViewModel extends ChangeNotifier {

final List<Cartitem> _cartItems = [];

List<Cartitem> get cartItems => _cartItems;

bool isinCart(Product product) {
return cartItems.any(
  ((item) => item.product.id == product.id )
  );
}

void addProduct(Product product) {
  if (isinCart(product)){
increaseQuantity(product);
  } else {
_cartItems.add(Cartitem(product: product));
notifyListeners();
  }

}

int getQuantity(Product product) {
final items = cartItems.firstWhere(
  ((item) => item.product.id == product.id),
  orElse:() => Cartitem(product: product, quantity: 0)
  );
  return items.quantity;
}

void removeProduct(Product product) {
if (isinCart(product)) {
decreaseQuantity(product);
}else{
  print('no items');
}
}

void increaseQuantity(Product product) {
  final item = cartItems.firstWhere(
    ((item) => item.product.id == product.id)
    );
    item.quantity++;
notifyListeners();
}

void decreaseQuantity(Product product) {
var item = cartItems.firstWhere(
  ((item) => item.product.id == product.id),
  );
  if (item.quantity > 1) {
item.quantity--;
  }else{
_cartItems.remove(item);
  }
  notifyListeners();
  } 

  void toNavigateToCheckOutScreen(BuildContext context, Product product) {
Navigator.push(
  context, 
  MaterialPageRoute(
    builder: (context) => CheckoutView()
    )
    );
  }

  

}
