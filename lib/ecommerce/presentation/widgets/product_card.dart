import 'package:flutter/material.dart';
import 'package:flutter_s2/ecommerce/data/models/product_model.dart';
import 'package:flutter_s2/ecommerce/presentation/screens/product_details.dart';
import 'package:flutter_s2/ecommerce/utils/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
         MaterialPageRoute(builder: (context){
          return ProductDetails(product: productModel);
        } ));
      }, child: Container(
        margin: EdgeInsets.all(8),
        height: 220,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(backgroundImage: 
            NetworkImage(productModel.imageUrl!),radius: 45,),
            Text(productModel.name!,style: AppTextStyles.titleTextStyle,maxLines: 3,), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(productModel.price.toString(), style: AppTextStyles.numbersTextStyle,), 
                  GestureDetector(child: Image.asset('assets/add_to_cart_icon.png'), onTap: (){},)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}