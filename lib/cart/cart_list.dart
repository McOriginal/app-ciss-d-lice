import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  // Calculer le nombre total d'éléments et le total
  int totalItems =
      currentUser['cart'].fold(0, (sum, item) => sum + item.quantity);
  double totalPrice = currentUser['cart']
      .fold(0.0, (sum, item) => sum + (item.productPrice * item.quantity));

  // Afficher le nombre total d'éléments et le total

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cart.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
              Positioned(
                top: 60,
                right: 130,
                child: Text(
                  "Mon Panier",
                  style: GoogleFonts.karla(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: currentUser['cart'].length,
                itemBuilder: (context, index) {
                  final cartItem = currentUser['cart'][index];
                  int quantity = cartItem.quantity;

                  return Card(
                    elevation: 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 120,
                          margin: const EdgeInsets.only(
                            right: 20,
                            top: 5,
                            bottom: 5,
                            left: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(cartItem.productImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.productName,
                                style: GoogleFonts.karla(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "${cartItem.productPrice} F",
                                style: GoogleFonts.karla(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                      cartItem.quantity = quantity;
                                      // Recalculer le nombre total d'éléments et le total
                                      totalItems = currentUser['cart'].fold(0,
                                          (sum, item) => sum + item.quantity);
                                      totalPrice = currentUser['cart'].fold(
                                          0.0,
                                          (sum, item) =>
                                              sum +
                                              (item.productPrice *
                                                  item.quantity));
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    elevation: 1,
                                    padding: const EdgeInsets.all(2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: AppColors.whiteColor,
                                    size: 26,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Text(
                                    "$quantity",
                                    style: GoogleFonts.karla(
                                      color: AppColors.accentColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) {
                                        quantity--;
                                        cartItem.quantity = quantity;
                                        // Recalculer le nombre total d'éléments et le total
                                        totalItems = currentUser['cart'].fold(0,
                                            (sum, item) => sum + item.quantity);
                                        totalPrice = currentUser['cart'].fold(
                                            0.0,
                                            (sum, item) =>
                                                sum +
                                                (item.productPrice *
                                                    item.quantity));
                                      }
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.whiteColor,
                                    elevation: 1,
                                    padding: const EdgeInsets.all(2),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: AppColors.primaryColor,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cart_bottom.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quantité: ",
                          style: GoogleFonts.karla(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.accentColor,
                          ),
                        ),
                        Text(
                          "$totalItems",
                          style: GoogleFonts.karla(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Total: ",
                          style: GoogleFonts.karla(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: AppColors.accentColor,
                          ),
                        ),
                        Text(
                          "${totalPrice.toStringAsFixed(2)} F",
                          style: GoogleFonts.karla(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),

                    //  ######################## Valider Bouton
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 130,
                        height: 50,
                        margin: const EdgeInsets.only(top: 17, left: 30),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Valider",
                                style: GoogleFonts.karla(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const Icon(
                                Icons.near_me,
                                size: 30,
                                color: AppColors.accentColor,
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
    );
  }
}
