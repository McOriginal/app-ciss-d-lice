import 'package:cisse_delice/home.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/top2.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Form
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Créer un nouveau compte',
                    style: GoogleFonts.karla(
                      color: AppColors.accentColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Full Name Field
                  _buildTextField(
                    hintText: "Nom complet",
                    icon: Icons.person_outlined,
                  ),

                  // Phone Number Field
                  _buildTextField(
                    hintText: "Téléphone",
                    icon: Icons.phone_outlined,
                  ),

                  // Email Address Field
                  _buildTextField(
                    hintText: "Adresse email",
                    icon: Icons.email_outlined,
                  ),

                  // Password Field
                  _buildTextField(
                    hintText: "Mot de passe",
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),

                  const SizedBox(height: 10),

                  // Remember Me Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor: Colors.orange,
                      ),
                      Text(
                        "Se souvenir de moi",
                        style: GoogleFonts.karla(
                          color: AppColors.accentColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  // Signup Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      "S'inscrire",
                      style: GoogleFonts.karla(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Redirect to Login
                  RichText(
                    text: TextSpan(
                      text: "Vous avez un compte ? ",
                      style: GoogleFonts.karla(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Se connecter",
                          style: GoogleFonts.karla(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            // Footer
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bottom.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black54),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black26),
        ),
      ),
    );
  }
}
