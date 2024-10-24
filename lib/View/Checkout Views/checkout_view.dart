import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/ViewModel/checkout_view_model.dart';
import 'package:provider/provider.dart';

import '../../Reusable_Components/build_field.dart';

class CheckoutView extends StatelessWidget{
   CheckoutView({super.key, });

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

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Column(
      children: [
        customFieldContainerWithMultipleRows(data: sampleData),
        SizedBox(height: 10,),
        customFieldContainerWithMultipleRows(data: sampleData),
      ],
    )
  );
}
}




//   @override
//   Widget build(BuildContext context) {
// return Scaffold(
//   appBar: AppBar(),
// body: Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     Text(productName, style: TextStyle(fontSize: 18, color: Colors.black),),
// SizedBox(height: 10,),
// TextField(
//   onChanged: (value) {
//     Provider.of<CheckoutViewModel>(listen: false, context).updateShippingAddress(value);
//   },
//  decoration: InputDecoration(
//   border: OutlineInputBorder(),
//   hintText: 'Enter your Shipping Address'
//  ),



// ),
// SizedBox(height: 10,),

// Text('Payment Method', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// _buildPaymentSelectionOption(context),
// SizedBox(height: 10,)
//   ],
// ),
// );
//   }
// }


