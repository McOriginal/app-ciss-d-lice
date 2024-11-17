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
  @override
  Widget build(BuildContext context) {
    // #############################""
    bool isChecked = false;
// #############################""

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset('assets/images/loginbg.png'),
          Center(
            child: Column(
              children: [
                Text(
                  'Connecter vous à votre compte',
                  style: GoogleFonts.karla(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black54,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.person_outline,
                            color: Colors.black54,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Nom complet",
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black54,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.email_outlined,
                            color: Colors.black54,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Adresse email",
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black54,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.phone_outlined,
                            color: Colors.black54,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Numéro de téléhone",
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black54,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Container(
                        height: 10,
                        width: 10,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(
                            Icons.lock_outline,
                            color: Colors.black54,
                            size: 25,
                          ),
                        ),
                      ),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Mot de passe",
                      hintStyle: const TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      checkColor: Colors.white,
                      activeColor: Colors.orange,
                      side: const BorderSide(
                        width: 1,
                        color: Colors.orange,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Se souvenir de moi",
                      style: GoogleFonts.karla(
                        color: Colors.orange,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "S'inscrire",
                      style: GoogleFonts.karla(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    text: "Vous avez déjà un compte ?:  ",
                    style: GoogleFonts.karla(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: "se conneter compte",
                          style: GoogleFonts.karla(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
