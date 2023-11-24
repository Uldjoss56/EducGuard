import 'package:edu_guard/common/widgets/text_form_field_card.dart';
import 'package:edu_guard/common/widgets/text_form_field_for_password.dart';
import 'package:edu_guard/ui/constants/colors.dart';
import 'package:edu_guard/ui/features/accueil.dart';
import 'package:edu_guard/ui/registration_connexion/registration/screen/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGris,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: myGris,
        title: Text(
          "Se connecter",
          style: Theme.of(context).copyWith().textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldCard(
                  hintText: "Email",
                  controller: _mailController,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains("@gmail.com")) {
                      return "Email invalide";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldForPassword(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mot de passe invalide";
                    }
                    return null;
                  },
                  hintText: "Mot de passe",
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 110,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const Accueil();
                        },
                      ),
                    );
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      try {
                        /*
                          await authService.connectUser(
                          email: _mailController.text,
                          password: _passwordController.text,
                        );
                        */
                        setState(() {});
                      } catch (error) {
                        /*ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
                          ),
                        );*/
                      }
                    }
                  },
                  child: Text(
                    "Se connecter",
                    style: GoogleFonts.raleway(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous n'aviez pas déjà un compte?",
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Registration(),
                          ),
                        );
                      },
                      child: const Text("S'inscrire"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
