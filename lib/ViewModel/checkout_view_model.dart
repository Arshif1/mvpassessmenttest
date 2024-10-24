import 'package:flutter/material.dart';

class CheckoutViewModel extends ChangeNotifier{

String _shippingaddres = '';
String _paymentMethod = 'Credit/Debit Card';

String get paymentMethod => _paymentMethod;
String get shippingAddress => _shippingaddres;

  double calculateTotal (List<double> prices) {
return prices.reduce(
  (a,b) => a + b);
  }

  void updateShippingAddress(String newAddress) {
    _shippingaddres = newAddress;
    notifyListeners();
}

void updatePaymentMethod(String paymentMethod){
  _paymentMethod = paymentMethod;
  notifyListeners();
}
}