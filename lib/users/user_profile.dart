import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/user_modal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          // ######################## Box user Image
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white70,
                  Colors.white,
                  Colors.white,
                ],
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/user.jpg'),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),

            // ########################### ARROW BACK
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
                        margin: const EdgeInsets.only(left: 30),
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

                  // ###################### USER CIRCLE INFOS ##############
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                      border: Border.all(
                        width: 1,
                        color: AppColors.primaryColor,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.grey,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        currentUser['name'][0],
                        style: GoogleFonts.karla(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentUser['email'],
                    style: GoogleFonts.karla(
                      fontSize: 25,
                      color: AppColors.whiteColor,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // ############################ USER INFORMATIONS ###################
          Container(
            height: MediaQuery.of(context).size.height / 2,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Votre Nom:",
                      style: GoogleFonts.karla(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      currentUser['name'].split(' ')[0],
                      style: GoogleFonts.karla(
                        fontSize: 14,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Votre Prénom:",
                      style: GoogleFonts.karla(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      currentUser['name'].split(' ')[1],
                      style: GoogleFonts.karla(
                        fontSize: 14,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Numéro de Téléphone:",
                      style: GoogleFonts.karla(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      currentUser['phone'].toString(),
                      style: GoogleFonts.karla(
                        fontSize: 14,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Adresse Email:",
                      style: GoogleFonts.karla(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      currentUser['email'],
                      style: GoogleFonts.karla(
                        fontSize: 14,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
