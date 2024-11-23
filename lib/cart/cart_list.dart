import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Card(
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
                        image: const DecorationImage(
                          image: AssetImage("assets/images/user.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 55),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pizz",
                            style: GoogleFonts.karla(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "1500 F",
                            style: GoogleFonts.karla(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: ElevatedButton(
                            onPressed: () {},
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
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(),
                          child: Center(
                            child: Text(
                              "1",
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
                            onPressed: () {},
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
                      ],
                    )
                  ],
                )),
          ),
          const SizedBox(height: 322),
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
                bottom: 50,
                left: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "10 éléments",
                          style: GoogleFonts.karla(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Total: ",
                              style: GoogleFonts.karla(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Text(
                              "10 000 F",
                              style: GoogleFonts.karla(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: AppColors.accentColor,
                              ),
                            ),
                          ],
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
