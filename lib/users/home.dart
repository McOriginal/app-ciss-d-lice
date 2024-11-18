import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        Spacer(),
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
                                suffixIcon: const Icon(
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
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
