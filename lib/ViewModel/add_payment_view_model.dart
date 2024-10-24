import 'package:flutter/material.dart';

class AddPaymentViewModel extends ChangeNotifier{

  String _selectedPaymentmethod = 'UPI';
  String selectedUPI = 'Google Pay';
  String selectedCard = 'Saved Card';
  String selectedOtherMethod = '';

String get selectedPaymentmethod => _selectedPaymentmethod;
void updateSelectedpaymentMethod(String paymentMethod) {
  _selectedPaymentmethod = paymentMethod;
  notifyListeners();
}

void updateSelectedUPI(String UPI){
  selectedUPI = UPI;
  notifyListeners();
}
void updateSelectedCard(String card) {
  selectedCard = card;
  notifyListeners();
}

void updateSelectedOtherMethod(String otherMethod) {
  selectedOtherMethod = otherMethod;
  notifyListeners();
}
}