import 'package:cisse_delice/cart/cart_list.dart';
import 'package:cisse_delice/product/productDetail.dart';
import 'package:cisse_delice/product/product_home.dart';
import 'package:cisse_delice/ui/productModal.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      Row(
                        children: [
                          const Icon(
                            Icons.place_outlined,
                            size: 40,
                            color: AppColors.whiteColor,
                          ),
                          Text(
                            "Bamako, Golf",
                            style: GoogleFonts.karla(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ClipOval(
                              child: SizedBox(
                                height: 50,
                                child: Image.asset("assets/images/user.jpg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Bonjour, Mohamed ! \n que voulez-vous aujourd'hui",
                        style: GoogleFonts.karla(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                border: Border.all(
                                    color: AppColors.accentColor, width: 1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.search_outlined,
                                    color: AppColors.accentColor,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Rechercher",
                                  hintStyle: TextStyle(
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.dataset_sharp,
                                  size: 35,
                                  color: AppColors.whiteColor,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
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
                                                      product.isFavorite =
                                                          !product.isFavorite;
                                                    });
                                                  },
                                                  child: Icon(
                                                    product.isFavorite
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
                                                        product.isFavorite =
                                                            !product.isFavorite;
                                                      });
                                                    },
                                                    child: Icon(
                                                      product.isFavorite
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
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.white,
          elevation: 3,
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.black,
            indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
            onTap: (value) {},
            tabs: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
              ),
              const Icon(
                Icons.favorite_outline,
                size: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartList(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.shopping_basket_outlined,
                  size: 30,
                ),
              ),
              const Icon(
                Icons.person_outline,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
