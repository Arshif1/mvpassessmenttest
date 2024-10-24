import 'package:flutter/material.dart';

class ShippingAddressAddViewModel extends ChangeNotifier{
  String userName = '';

  void updateName(String name){
    userName = name;
  }


}