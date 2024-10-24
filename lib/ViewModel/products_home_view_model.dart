import 'package:flutter/material.dart';
import '../View/product_detail_view.dart';
import '../View/cart_view.dart';
import '../Model/product.dart';

class ProductsHomeViewModel {
final description = 'Stay ahead of time with the Classic ChronoWatch, where elegance meets performance. Designed for individuals who value both style and precision, this timepiece combines premium craftsmanship with modern functionality.Stay ahead of time with the Classic ChronoWatch, where elegance meets performance. Designed for individuals who value both style and precision, this timepiece combines premium craftsmanship with modern functionality.';

late final List<Product> products;

ProductsHomeViewModel() {
  products = [
    Product(1, description, 'watch1', 100, ''),
    Product(2, description, 'watch2', 100, ''),
    Product(3, description, 'watch3', 100, ''),
    Product(4, description, 'watch4', 100, ''),
    Product(5, description, 'watch5', 100, ''),
    Product(6, description, 'watch6', 100, ''),
    Product(7, description, 'watch7', 100, ''),
    Product(8, description, 'watch8', 100, ''),
    Product(9, description, 'watch9', 100, ''),
    Product(10, description, 'watch10', 100, ''),
    ];

}

    void navigateTodetailView(BuildContext context, Product product) {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => ProductDetailView(product: product)));
    }

    void navigateTocartView(BuildContext context) {
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context,) => CartView()));
    }


}
