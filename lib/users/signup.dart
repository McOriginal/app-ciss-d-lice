import 'package:cisse_delice/product/productModal.dart';
import 'package:cisse_delice/ui/ui_modal.dart';
import 'package:cisse_delice/users/login.dart';
import 'package:cisse_delice/users/user_modal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signup() {
    String email = _emailController.text.trim();
    String name = _nameController.text.trim();

    final userExists = users.any((user) => user.email == email);
    final userNameExists = users.any((user) => user.name == name);

    if (!_formKey.currentState!.validate() ||
        _phoneController.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Erreur dans les informations fournies",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    } else if (userExists || userNameExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Email ou Nom existe déjà, veuillez choisir un autre Nom ou email",
            style: TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
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
    // Ajout de l'utilisateur après un délai de 5 secondes
    Future.delayed(const Duration(seconds: 5), () {
      users.add(
        User(
          id: uuid.v4(),
          name: _nameController.text,
          email: _emailController.text,
          phone: int.parse(_phoneController.text),
          passWord: _passwordController.text,
          cart: [],
          favorite: [],
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    });
    print(users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: const Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage("assets/images/top2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            // Form
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.7,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
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
                            controller: _nameController,
                            validator: (value) {
                              if (value!.length < 5 || value.isEmpty) {
                                return "Le nom doit être supérieur à 4 caractère";
                              }
                              return null;
                            }),

                        // Phone Number Field
                        _buildTextField(
                            hintText: "Téléphone",
                            icon: Icons.phone_outlined,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "Veuillez entrez un numéro de téléphone"
                                  : null;
                            }),

                        // Email Address Field
                        _buildTextField(
                          hintText: "Adresse email",
                          icon: Icons.email_outlined,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            // Vérification de l'email avec une expression régulière
                            final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                            if (value!.isEmpty) {
                              return "Veuillez entrer une adresse email";
                            } else if (!regex.hasMatch(value)) {
                              return "Veuillez entrer une adresse email valide";
                            }
                            return null; // Retourne null si la validation réussit
                          },
                        ),

                        // Password Field
                        _buildTextField(
                            hintText: "Mot de passe",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 4) {
                                return "Veuillez entrez un mot de passe supérieur à (4) caractère";
                              } else {
                                return null;
                              }
                            }),

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
                          onPressed: signup,
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
                ),
              ),
            ),
            // Footer

            const Align(
              alignment: Alignment.bottomLeft,
              child: Image(
                image: AssetImage("assets/images/bottom.png"),
                fit: BoxFit.cover,
                height: 220,
                width: double.infinity,
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
    required TextEditingController controller,
    required String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.black54),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black26),
        ),
        validator: validator,
      ),
    );
  }
}
