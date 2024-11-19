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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image.asset("assets/images/...")
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
                        ),
                        Text(
                          "Bamako, Golf",
                          style: GoogleFonts.karla(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search_outlined,
                                  color: Colors.black,
                                ),
                                hintText: "Voir les courses",
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
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
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Icon(
                                Icons.dataset_sharp,
                                size: 35,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Container(
                                  height: 120,
                                  width: 200,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        const Spacer(),
                                        const SizedBox(
                                          height: 50,
                                          width: 100,
                                          child: Icon(
                                            Icons.food_bank,
                                            size: 50,
                                          ),
                                        ),
                                        Text(
                                          "food catégorie",
                                          style: GoogleFonts.karla(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
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
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 150,
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 1,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: const Stack(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              "assets/images/bg3.jpg"),
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star_rate_rounded,
                                                size: 30,
                                                color: Colors.blue,
                                              ),
                                              Icon(
                                                Icons.star_rate_rounded,
                                                size: 30,
                                                color: Colors.blue,
                                              ),
                                              Icon(
                                                Icons.star_rate_rounded,
                                                size: 30,
                                                color: Colors.blue,
                                              ),
                                              Icon(
                                                Icons.star_rate_rounded,
                                                size: 30,
                                                color: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
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
