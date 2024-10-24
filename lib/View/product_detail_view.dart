import 'package:flutter/material.dart';
import '../Model/product.dart';

class ProductDetailView extends StatefulWidget {
  final Product product;

  ProductDetailView({super.key, required this.product});
  
  @override
  State<StatefulWidget> createState() => _ProductDetailViewState();
  
}

class _ProductDetailViewState extends State<ProductDetailView> {
  
int currentImageIndex = 0;
bool isFavorite = false;
double rating = 0;

  final List<String> imagePaths = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
         
              child: PageView.builder(
                itemCount: imagePaths.length,
                onPageChanged: (index) {
                  setState(() {
                    currentImageIndex = index;
                  });
                },
                itemBuilder: 
                (context, index) {
                  return Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
                  );
                }
                ),
            ),
SizedBox(height: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagePaths.asMap().entries.map(
              (entry) {
                return Container(
                  height: 8,
                  width: 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
shape: BoxShape.circle,
color: entry.key == currentImageIndex ? Colors.black : Colors.grey,
                  ),
                );
              }
              ).toList(),
          )
          ],
        ),
      )
    );
  }

}
