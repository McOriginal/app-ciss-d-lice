import 'package:cisse_delice/ui/productModal.dart';

class Cart {
  final String id;
  final String userId;
  final String productName;
  final int productPrice;
  final String productImage;
  final Category productCategory;

  Cart({
    required this.id,
    required this.userId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productCategory,
  });
}

const List userCart = [];
