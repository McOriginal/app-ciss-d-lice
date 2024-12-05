import 'package:cisse_delice/bottom_nav_bar.dart';
import 'package:cisse_delice/cart/cart_madal.dart';
import 'package:cisse_delice/product/productDetail.dart';
import 'package:cisse_delice/product/product_home.dart';
import 'package:cisse_delice/product/productModal.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/favorite_modal.dart';
import 'package:cisse_delice/users/user_modal.dart';
import 'package:cisse_delice/users/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ################### addToFavorite fonction

  void addToFavorite(product) {
    bool productExists =
        currentUser['favorite'].any((cartItem) => cartItem.id == product.id);
    if (productExists) {
      // Suppression du produit des favoris
      currentUser['favorite']
          .removeWhere((cartItem) => cartItem.id == product.id);
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
        id: product.id,
        name: product.name,
        price: product.price,
        imageUrl: product.imageUrl,
        isFavorite: product.isFavorite,
        categoryId: product.categoryId,
        description: product.description,
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
            // ######################## HEADER IMAGES #######################
            Stack(
              children: [
                const Image(
                  image: AssetImage("assets/images/home.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ####################### HEADER TEXT #################
                      Row(
                        children: [
                          const Icon(
                            Icons.warehouse_outlined,
                            size: 40,
                            color: AppColors.whiteColor,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Bienvenue",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.karla(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UserProfile(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                    width: 1,
                                    color: AppColors.secondaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 10,
                                      offset: Offset(0, 2),
                                      color: AppColors.whiteColor,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    currentUser['name'][0],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.karla(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // #################### USER HEADER ###################
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currentUser['name'].split(' ')[0],
                              style: GoogleFonts.karla(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Text(
                              "que voulez-vous aujourd'hui",
                              style: GoogleFonts.karla(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // #################### LOGO ###################
                      const Center(
                        child: SizedBox(
                          child: Image(
                            image: AssetImage('assets/images/logo.png'),
                            width: 170,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // ###################################### CATEGORIES LIST VIEW ##############
                      Text(
                        "Catégorie des produits",
                        style: GoogleFonts.karla(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                        ),
                      ),

                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final categorie = categories[index];
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: Card(
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    height: 120,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(categorie.imageUrl),
                                        opacity: 0.7,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        categorie.name,
                                        style: GoogleFonts.karla(
                                          fontSize: 25,
                                          color: AppColors.secondaryColor,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 10),

                      // #################################### POPULAR LIST VIEW ###################
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Les plus populaire',
                              style: GoogleFonts.karla(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    final product = products[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetail(product: product),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        margin: const EdgeInsets.all(10),
                                        child: Stack(
                                          children: [
                                            const Image(
                                              image: AssetImage(
                                                "assets/images/rectangle2.png",
                                              ),
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              height: double.infinity,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: Image(
                                                image: AssetImage(
                                                  product.imageUrl,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  product.name,
                                                  style: GoogleFonts.karla(
                                                    fontSize: 25,
                                                    color: AppColors
                                                        .secondaryColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  '${product.price} F',
                                                  style: GoogleFonts.karla(
                                                    fontSize: 25,
                                                    color: AppColors.whiteColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      addToFavorite(product);
                                                    });
                                                  },
                                                  child: Icon(
                                                    currentUser['favorite'].any(
                                                            (cartItem) =>
                                                                cartItem.id ==
                                                                product.id)
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 35,
                                                    color: AppColors.whiteColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(height: 10),

                            // #######################3 EN PROMOTION LIST VIEW ######################
                            Text(
                              'En promotion',
                              style: GoogleFonts.karla(
                                fontSize: 25,
                                fontWeight: FontWeight.w900,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products
                                      .where((e) => e.price <= 500)
                                      .length,
                                  itemBuilder: (context, index) {
                                    final product = products
                                        .where((e) => e.price <= 500)
                                        .toList()[index];

                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetail(product: product),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.3,
                                        margin: const EdgeInsets.all(10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: AppColors.primaryColor,
                                              ),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 3,
                                                  spreadRadius: 1,
                                                  color: Colors.grey,
                                                  offset: Offset(1, 2),
                                                ),
                                              ]),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Image(
                                                  image: AssetImage(
                                                    product.imageUrl,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    product.name,
                                                    style: GoogleFonts.karla(
                                                      fontSize: 25,
                                                      color: AppColors
                                                          .secondaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    '${product.price} F',
                                                    style: GoogleFonts.karla(
                                                      fontSize: 25,
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text(
                                                    '${product.price * 2} F',
                                                    style: GoogleFonts.karla(
                                                      fontSize: 25,
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 25,
                                                right: 15,
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Container(
                                                    height: 3,
                                                    width: 60,
                                                    color:
                                                        AppColors.accentColor,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        addToFavorite(product);
                                                      });
                                                    },
                                                    child: Icon(
                                                      currentUser['favorite']
                                                              .any((cartItem) =>
                                                                  cartItem.id ==
                                                                  product.id)
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_outline,
                                                      size: 35,
                                                      color: AppColors
                                                          .secondaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // ############################ GO TO ALL PRODUCT VIEW BOUTON #######################
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProductHome(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 4,
                              shadowColor: Colors.grey,
                              padding: const EdgeInsets.all(10),
                              backgroundColor: AppColors.primaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Explorer plus",
                                  style: GoogleFonts.karla(
                                    color: AppColors.whiteColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const Icon(
                                  Icons.navigate_next,
                                  size: 25,
                                  color: AppColors.whiteColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
