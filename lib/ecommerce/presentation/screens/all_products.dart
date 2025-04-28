import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_s2/ecommerce/data/models/product_model.dart';
import 'package:flutter_s2/ecommerce/presentation/screens/cart_screen.dart';
import 'package:flutter_s2/ecommerce/presentation/widgets/product_card.dart';
import 'package:flutter_s2/ecommerce/presentation/widgets/search_text_field.dart';
import 'package:flutter_s2/ecommerce/utils/app_colors.dart';
import 'package:flutter_s2/ecommerce/utils/app_text_styles.dart';
import 'package:http/http.dart' as http;
import 'package:badges/badges.dart' as badges;

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<ProductModel> products = [];
  Set<ProductModel> cart = {};


  @override
  initState(){
  super.initState();
  _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Icon(Icons.menu, color:AppColors.orange ,size: 30 ,), 
                badges.Badge(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CartScreen(products: cart.toList());
                    }));
                  },
                  showBadge: cart.isNotEmpty,
                  badgeContent: Text('${cart.length}'),
                  child: GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CartScreen(products: cart.toList());
                    }));
                    },
                    child: Icon(Icons.shopping_cart, color:AppColors.orange,size: 30,)),
                ),
                
              ],) , 
              SizedBox(height: 20,),
              Text('Hello Ahmed, What fruit salad combo you want today?' , 
              style: AppTextStyles.labelTextStyle
              ), 
              SizedBox(height: 20,), 
              Row(
                children: [
                  Expanded(child: SearchTextField(), flex: 5,),
                  SizedBox(width: 40,),
                  Expanded(child: Icon(Icons.tune))
                ],
              ) , 
              SizedBox(height: 30,), 
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Recommended Combo' , 
                style: AppTextStyles.labelTextStyle
                ),
              ), 
              SizedBox(height: 15,),
              Expanded(
                child: SizedBox(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return ProductCard(productModel: products[index]  ,
                       onAddToCart: () {
                        setState(() {
                           cart.add(products[index]);
                        });
                       
                      },);
                    },
                    itemCount: products.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _fetchProducts()async{
     var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
     // get - Post - Put - DELETE 
     // baseUrl/method

      List listOfProductsMaps = jsonDecode(response.body); 
      log('Products length before : ${products.length}');

      for(var map in listOfProductsMaps){
        // data extraction
        var model = ProductModel.fromJson(map);
        
        setState(() {
           products.add(model);
        });
       
      }

      log('Products length after : ${products.length}');
      products.first.printInfo();
  }


}