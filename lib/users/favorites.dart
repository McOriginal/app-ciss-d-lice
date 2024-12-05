import 'package:cisse_delice/cart/cart_list.dart';
import 'package:cisse_delice/cart/cart_madal.dart';
import 'package:cisse_delice/product/productDetail.dart';
import 'package:cisse_delice/product/productModal.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  //  ############# Total des éléments de panier

  int totalItems = currentUser['cart'].fold(
    0,
    (sum, item) => sum + item.quantity,
  );
  //  ############# Total des éléments de panier

  // ################### Fontion d'ajout de panier

  void addToCart(product) {
    bool productExists =
        currentUser['cart'].any((cartItem) => cartItem.id == product.id);
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
          id: uuid.v4(),
          userId: userId,
          productName: product.name,
          productPrice: product.price,
          productImage: product.imageUrl,
          productCategory: product.categoryId,
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

// ################### Fontion d'ajout de panier

// ################### addToFavorite fonction

  void removeToFavorite(product) {
    bool productExists =
        currentUser['favorite'].any((cartItem) => cartItem.id == product.id);
    if (productExists) {
      // Suppression du produit des favoris
      currentUser['favorite']
          .removeWhere((cartItem) => cartItem.id == product.id);
      ScaffoldMessengerState().clearSnackBars();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 2,
                    color: Colors.grey,
                  ),
                ]),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 40,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width / 2,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 20,
                              right: -30,
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/top.png"),
                                    fit: BoxFit.cover,
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
                                    margin: const EdgeInsets.only(
                                        top: 25, left: 30),
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
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Mes produits préférés !",
                    style: GoogleFonts.karla(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          currentUser['favorite'].isNotEmpty
              ? Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      mainAxisExtent: 320,
                    ),
                    shrinkWrap: true,
                    itemCount: currentUser['favorite'].length,
                    // Utilisation de la liste filtrée
                    itemBuilder: (context, index) {
                      final product =
                          currentUser['favorite'][index]; // Produit filtré
                      return Card(
                        elevation: 2,
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(product.imageUrl),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: GoogleFonts.karla(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    'Catégorie/ ${product.categoryId}',
                                    style: GoogleFonts.karla(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  Text(
                                    '${product.price} F',
                                    style: GoogleFonts.karla(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.accentColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      removeToFavorite(product);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete_forever,
                                    size: 35,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () {
                                  addToCart(product);
                                  setState(() {
                                    totalItems = currentUser['cart'].fold(
                                        0, (sum, item) => sum + item.quantity);
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.secondaryColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.add_outlined,
                                      size: 30,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Text(
                    "Aucun produit trouvé dans votre favorite !",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.karla(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
        ],
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}
