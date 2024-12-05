import 'package:cisse_delice/home.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cisse_delice/users/user_modal.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // #############################""
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late bool isChecked = false;
// #############################""

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erreur dans les informations fournies")),
      );
      return;
    }

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    bool userExists =
        users.any((user) => user.email == email && user.passWord == password);

    if (!userExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Email ou mot de passe incorrect",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final connectedUSer = users.firstWhere((user) => user.email == email);

    currentUser['id'] = connectedUSer.id;
    currentUser['name'] = connectedUSer.name;
    currentUser['email'] = connectedUSer.email;
    currentUser['phone'] = connectedUSer.phone;
    currentUser['passWord'] = connectedUSer.passWord;
    currentUser['cart'] = connectedUSer.cart;
    currentUser['favorite'] = connectedUSer.favorite;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const AlertDialog(
            title: Text(
              "Patientez s'il vous plaît",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primaryColor,
              ),
            ),
            content: SizedBox(
              width: 70,
              height: 70,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          );
        });
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Stack(
                children: [
                  const Positioned(
                    bottom: 30,
                    left: 60,
                    child: Image(
                      image: AssetImage("assets/images/top.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Connecter vous à votre compte',
                        style: GoogleFonts.karla(
                          color: AppColors.accentColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black54,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(left: 5),
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
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.black54,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              margin: const EdgeInsets.only(left: 5),
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
                            checkColor: AppColors.whiteColor,
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
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Se souvenir de moi",
                            style: GoogleFonts.karla(
                              color: AppColors.accentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        margin: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: login,
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Se connecter",
                            style: GoogleFonts.karla(
                              color: AppColors.whiteColor,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          text: "Vous n'avez pas de compte ? ",
                          style: GoogleFonts.karla(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: " Créer un compte",
                                style: GoogleFonts.karla(
                                    color: AppColors.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage(),
                                      ),
                                    );
                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 9),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3.6,
              child: const Stack(
                children: [
                  Positioned(
                    top: 5,
                    right: 50,
                    child: Image(
                      image: AssetImage("assets/images/bottom.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
