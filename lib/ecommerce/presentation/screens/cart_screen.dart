import 'package:flutter/material.dart';
import 'package:flutter_s2/ecommerce/data/models/product_model.dart';
import 'package:flutter_s2/ecommerce/presentation/widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, required this.products});
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),),
      body: Center(
        child: ListView.builder(
        itemCount: products.length, 
        itemBuilder: (context, index) {
          return ProductCard(productModel: products[index]);
        },
        ),
      ),
    );
  }
}