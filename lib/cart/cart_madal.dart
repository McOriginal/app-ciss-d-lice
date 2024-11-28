import 'package:cisse_delice/product/productModal.dart';

class Cart {
  final String id;
  final String userId;
  final String productName;
  final int productPrice;
  final String productImage;
  final String productCategory;
  int quantity;

  Cart({
    required this.id,
    required this.userId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productCategory,
    required this.quantity,
  });
}

final List carts = [];
