import 'package:cisse_delice/cart/cart_madal.dart';

class User {
  final String id;
  final String name;
  final String email;
  final int phone;
  final String passWord;
  final List<Cart> cart;
  final List favorite;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.passWord,
    required this.cart,
    required this.favorite,
  });
}

final List users = [];

final currentUser = {};

final List usersFavorites = [];
