import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/ViewModel/cart_view_model.dart';
import 'package:mvpassessmenttest/ViewModel/shipping_address_add_view_model.dart';
import 'package:provider/provider.dart';

class ShippingAddressAddView extends StatelessWidget{

 final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(),
  body: SingleChildScrollView(
    child: Column(
   children: [
    Consumer<ShippingAddressAddViewModel>(
      builder: (context, viewModel, child) {
       return customSimpleFieldContainer('inputText',(text) {viewModel.updateName(text);}, nameController);
      }

      )
   
   ],
    ),
  ),
);


  }
}

Widget customSimpleFieldContainer(
  String inputText,
  void Function(String) onChanged,
  TextEditingController constroller
  ) {

  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
    child: Container(
 
      padding: EdgeInsets.all(10),
         decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        
        border: Border.all(color: Colors.black),
      ),
child: TextField(
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: inputText
  ),
  onChanged: onChanged,
)
    )
    );
}

