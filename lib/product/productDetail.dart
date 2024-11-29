import 'package:cisse_delice/cart/cart_list.dart';
import 'package:cisse_delice/cart/cart_madal.dart';
import 'package:cisse_delice/product/productModal.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/favorite_modal.dart';
import 'package:cisse_delice/users/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int totalItems =
      currentUser['cart'].fold(0, (sum, item) => sum + item.quantity);

  void addToCart() {
    bool productExists =
        currentUser['cart'].any((cartItem) => cartItem.id == widget.product.id);
    if (productExists) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Cet produit existe dèjà dans le panier",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else {
      // Récupération de current User
      String userId = currentUser['id'];
      String userName = currentUser['name'];
      String email = currentUser['email'];
      int phone = currentUser['phone'];
      String pass = currentUser['passWord'];
      List<Cart> userCart = currentUser['cart'];
      List userFavorite = currentUser['favorite'];

      userCart.add(
        Cart(
          id: widget.product.id,
          userId: userId,
          productName: widget.product.name,
          productPrice: widget.product.price,
          productImage: widget.product.imageUrl,
          productCategory: widget.product.categoryId,
          quantity: 1,
        ),
      );

      // Ajout de l'utilisateur dans le panier
      carts.add(
        User(
          id: userId,
          name: userName,
          email: email,
          phone: phone,
          passWord: pass,
          cart: userCart,
          favorite: userFavorite,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Produit ajouter Avec succès",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.accentColor,
        ),
      );
      setState(() {
        totalItems =
            currentUser['cart'].fold(0, (sum, item) => sum + item.quantity);
      });
      print(currentUser['cart']);
    }
  }

  // ################### addToFavorite fonction

  void addToFavorite() {
    bool productExists = currentUser['favorite']
        .any((cartItem) => cartItem.id == widget.product.id);
    if (productExists) {
      // Suppression du produit des favoris
      currentUser['favorite']
          .removeWhere((cartItem) => cartItem.id == widget.product.id);
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Produit supprimé dans votre liste de favoris",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return; // Sortie de la fonction après la suppression
    } else {
      // Récupération de current User
      String userId = currentUser['id'];
      String userName = currentUser['name'];
      String email = currentUser['email'];
      int phone = currentUser['phone'];
      String pass = currentUser['passWord'];
      List<Cart> userCart = currentUser['cart'];
      List userFavorite = currentUser['favorite'];

      userFavorite.add(Favorite(
        id: widget.product.id,
        name: widget.product.name,
        price: widget.product.price,
        imageUrl: widget.product.imageUrl,
        isFavorite: widget.product.isFavorite,
        categoryId: widget.product.categoryId,
        description: widget.product.description,
      ));
      usersFavorites.add(
        User(
          id: userId,
          name: userName,
          email: email,
          phone: phone,
          passWord: pass,
          cart: userCart,
          favorite: userFavorite,
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Produit ajouter dans vos favorite Avec succès",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.accentColor,
        ),
      );
      setState(() {
        print(currentUser['favorite']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/detail.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(top: 25, left: 30),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: 40,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartList(),
                            ),
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(top: 25, left: 30),
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.shopping_basket,
                              size: 40,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    top: 7,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          '$totalItems',
                          style: GoogleFonts.karla(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Catégorie: ',
                    style: GoogleFonts.karla(
                      color: AppColors.secondaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    widget.product.categoryId.toUpperCase(),
                    style: GoogleFonts.karla(
                      color: AppColors.primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.product.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.product.name,
                        style: GoogleFonts.karla(
                          color: AppColors.primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${widget.product.price} F',
                        style: GoogleFonts.karla(
                          color: AppColors.secondaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                addToFavorite();
                              });
                            },
                            child: Icon(
                              currentUser['favorite'].any((cartItem) =>
                                      cartItem.id == widget.product.id)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              size: 35,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.product.description,
                    style: GoogleFonts.karla(
                      color: AppColors.secondaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: addToCart,
              child: Center(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.5,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(blurRadius: 1, offset: Offset(0, 1)),
                      ]),
                  child: Center(
                    child: Text(
                      "Ajouter au panier",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.karla(
                        color: AppColors.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
