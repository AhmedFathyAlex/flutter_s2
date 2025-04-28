import 'dart:developer';

class ProductModel {
  String? imageUrl;
  String? name;
  double? price;
  bool? isFavourite;
  String? description;
  String? category;
  double? rate;
  int? rateCount;

  ProductModel({this.imageUrl, this.isFavourite, this.name, this.price});

  ProductModel.fromJson(Map json) {
    name = json['title'];
    price = json['price'] * 1.0;
    imageUrl = json['image'];
    description = json['description'];
    category = json['category'];
    rate = json['rating']['rate'] * 1.0;
    rateCount = json['rating']['count'];

  }

  printInfo(){
    log('$name \n $price \n $description \n $category \n $rate \n $rateCount');
  }
}
/**{
  "id": 1,
  "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
  "price": 109.95,
  "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  "category": "men's clothing",
  "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  "rating": {
    "rate": 3.9,
    "count": 120
  }
} */
