import 'package:flutter/material.dart';
import 'package:flutter_s2/ecommerce/data/models/product_model.dart';
import 'package:flutter_s2/ecommerce/utils/app_text_styles.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEGg8Y_NUI1J88Dp3l_9XiPRX7HqUPPT7lKg&s'),radius: 45,),
          Text('Rice with chicken',style: AppTextStyles.titleTextStyle,), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('4000', style: AppTextStyles.numbersTextStyle,), 
                GestureDetector(child: Image.asset('assets/add_to_cart_icon.png'), onTap: (){},)
              ],
            ),
          )
        ],
      ),
    );
  }
}