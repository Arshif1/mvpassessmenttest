import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/Model/product.dart';
import 'package:mvpassessmenttest/ViewModel/cart_view_model.dart';
import 'package:provider/provider.dart';


class ProductTile extends StatelessWidget {
  
  String productName;
 bool isIncart;
 int quantity;
 Product product;


 ProductTile({required this.productName, required this.isIncart, required this.quantity, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);

   return GridTile(
    child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey
          ),
          child: Center(child: Text('No image', style: TextStyle(color: Colors.brown),)),
        ),
        SizedBox(height: 6,),
        Row(
          children: [
        Text(productName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
        SizedBox(width: 30,),
 if (isIncart) 
  Container(
    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(2.5)
    ),
    child: Text('In cart', style: TextStyle(color: Colors.white),),
  )
          ]
        ),
    
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          ElevatedButton(
            onPressed: () => cartViewModel.toNavigateToCheckOutScreen(context, product),
            child: Text('Buy Now')),
            ElevatedButton(
            onPressed: () => cartViewModel.addProduct(product), 
            child: Text("Add to Cart")),
        ],
      ),
      Column(
        children: [
          IconButton(
            onPressed: ()=> cartViewModel.addProduct(product), 
            icon: Icon(Icons.add)),
            Text(quantity.toString()),
            IconButton(
              onPressed: () => cartViewModel.removeProduct(product), 
              icon: Icon(Icons.remove))

        ],
      )

    ],
  )
       

      ],
    ));
  }

}