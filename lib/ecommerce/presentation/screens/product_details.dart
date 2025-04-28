import 'package:flutter/material.dart';
import 'package:flutter_s2/bmi/app_colors.dart';
import 'package:flutter_s2/ecommerce/data/models/product_model.dart';
import 'package:flutter_s2/ecommerce/utils/app_text_styles.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key , required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name!),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.imageUrl!, height: 300,),
            SizedBox(height: 20),
            Text('${product.price} \$',style: AppTextStyles.numbersTextStyle,),
            Text(product.name!,style: AppTextStyles.labelTextStyle,), 
            SizedBox(height: 10),
            Text(product.description!,style: AppTextStyles.titleTextStyle,),
            SizedBox(height: 10),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${product.rate}'),
                Icon(Icons.star,color: Colors.amber,), 
                Text('(${product.rateCount})', style: AppTextStyles.numbersTextStyle.copyWith(
                  color: AppColors.grey
                ),),
              ],
             ) , 
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}