import 'package:cisse_delice/ui/productModal.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
              child: Align(
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
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Catégorie:',
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
                      fontSize: 30,
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
                                widget.product.isFavorite =
                                    !widget.product.isFavorite;
                              });
                            },
                            child: Icon(
                              widget.product.isFavorite
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
              onTap: () {},
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





// Container(
                      //   height: 40,
                      //   width: 40,
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: AppColors.whiteColor,
                      //       elevation: 1,
                      //       padding: const EdgeInsets.all(10),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //     ),
                      //     child: const Icon(
                      //       Icons.remove,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   height: 40,
                      //   width: 40,
                      //   decoration: const BoxDecoration(),
                      //   child: Center(
                      //     child: Text(
                      //       "1",
                      //       style: GoogleFonts.karla(
                      //         color: AppColors.accentColor,
                      //         fontSize: 25,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   height: 40,
                      //   width: 40,
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.orange,
                      //       elevation: 1,
                      //       padding: const EdgeInsets.all(10),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(15),
                      //       ),
                      //     ),
                      //     child: const Icon(
                      //       Icons.add,
                      //       color: Colors.black,
                      //     ),
                      //   ),
                      // ),