import 'package:flutter/material.dart';
import 'package:flutter_s2/ecommerce/data/models/product_model.dart';
import 'package:flutter_s2/ecommerce/utils/app_text_styles.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key , required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name!),),
      body: Column(
        children: [
          Image.network(product.imageUrl!, height: 300,),
          Text(product.name!,style: AppTextStyles.labelTextStyle,), 
          Text(product.description!,style: AppTextStyles.titleTextStyle,),
        ],
      ),
    );
  }
}