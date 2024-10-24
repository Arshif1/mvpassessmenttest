import 'package:flutter/material.dart';
import 'package:mvpassessmenttest/ViewModel/cart_view_model.dart';
import 'package:provider/provider.dart';
import '../ViewModel/products_home_view_model.dart';
import '../Reusable_Components/product_grid_tile.dart';

class ProductsHomeView extends StatelessWidget {

  final ProductsHomeViewModel productsHomeViewModel = ProductsHomeViewModel();
  @override
  Widget build(BuildContext context) {

    final cartViewModel = Provider.of<CartViewModel>(context); 
    
return Scaffold(
body: GridView.builder(
  padding: EdgeInsets.all(10),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productsHomeViewModel.products.length,
        itemBuilder: (context, index) {
          final product = productsHomeViewModel.products[index];
          final isInCart = cartViewModel.isinCart(product);
          final quantity = cartViewModel.getQuantity(product);
          return GestureDetector(
            onTap: () => productsHomeViewModel.navigateTodetailView(context, product),
               child: ProductTile(productName: product.name, isIncart: isInCart, quantity: quantity, product: product,)
          );
      
        },
),
);
  }

}

