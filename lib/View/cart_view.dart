import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/Model/product.dart';
import 'package:mvpassessmenttest/View/Checkout%20Views/add_payment_view.dart';
import 'package:mvpassessmenttest/View/Checkout%20Views/shipping_address_add_view.dart';
import 'package:mvpassessmenttest/Reusable_Components/build_editable_field.dart';

import '../Reusable_Components/build_field.dart';

class CartView extends StatelessWidget {

  String shippingAddress = '23 Main Street, Apt 4B, Springfield, IL 62704, USA';
String paymentMethod = 'UPI';

  List<Map<String, dynamic>> sampleData = [
  {
    'title': 'Items',
    'value': 'AED 1000.0',
    'titleStyle': TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    'valueStyle': TextStyle(fontSize: 14, color: Colors.green),
  },
  {
    'title': 'Delivery:',
    'value': 'AED 0.0',
    'titleStyle': TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),
    'valueStyle': TextStyle(fontSize: 14, fontWeight: FontWeight.w600,),
  },
  {
    'title': 'Order Total',
    'value': 'AED 1000.0',
    'titleStyle': TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    'valueStyle': TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
  },
];
  CartView({super.key, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customFieldContainerWithMultipleRows(data: sampleData),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
         child:  Text('Shipping Address:',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          ),
          customEditableField(
              inputText: shippingAddress,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShippingAddressAddView()));
              }),

                    const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
         child:  Text('Payment Method:',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          ),
          customEditableField(
              inputText: paymentMethod,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddPaymentView()));
              }),
              SizedBox(height: 25,),
              Center(
                child: ElevatedButton(onPressed: () {}, 
                                  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12), // Padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners
    ),
  ),
                child: Text('Place Order')),
              )
        ],
      ),
    );
  }
}
