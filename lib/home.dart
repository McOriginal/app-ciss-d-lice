import 'package:cisse_delice/product/productDetail.dart';
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
                          children: [
                            Text(
                              'Mueilleur vente',
                              style: GoogleFonts.karla(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 200,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
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
                                            MediaQuery.of(context).size.width /
                                                1.3,
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
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
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
            tabs: const [
              Icon(
                Icons.home_outlined,
                size: 30,
              ),
              Icon(
                Icons.favorite_outline,
                size: 30,
              ),
              Icon(
                Icons.shopping_basket_outlined,
                size: 30,
              ),
              Icon(
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
