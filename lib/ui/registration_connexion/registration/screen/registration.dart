import 'package:edu_guard/common/widgets/text_form_field_card.dart';
import 'package:edu_guard/common/widgets/text_form_field_for_password.dart';
import 'package:edu_guard/ui/constants/colors.dart';
import 'package:edu_guard/ui/registration_connexion/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _telController.dispose();
    _mailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

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
          "S'inscrire",
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
                  hintText: "Nom",
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nom invalide";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldCard(
                  hintText: "Numéro de téléphone",
                  controller: _telController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Numéro invalide";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
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
                  height: 15,
                ),
                TextFormFieldForPassword(
                  validator: (value) {
                    if (value!.isEmpty || value != _passwordController.text) {
                      return "Mot de passe invalide";
                    }
                    return null;
                  },
                  hintText: "Confirmer mot de passe",
                  controller: _confirmPasswordController,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 130,
                      vertical: 10,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return const Login();
                        },
                      ),
                    );
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();

                      try {
                        /*
                       await authService.createUser(
                          email: _mailController.text,
                          name: _nameController.text,
                          password: _passwordController.text,
                          phone: _telController.text,
                        );*/
                      } catch (error) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(error.toString()),
                        ));
                      }

                      /*FutureBuilder<void>(
                        future: userService.createUser(
                          {
                            'name': _nameController.text,
                            'email': _mailController.text,
                            'password': _passwordController.text,
                            'phone': _telController.text,
                          },
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(snapshot.error.toString()),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                          return const Accueil();
                        },
                      );*/
                    }
                  },
                  child: Text(
                    "S'inscrire",
                    style: GoogleFonts.raleway(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon/logo_google.png',
                        width: 20,
                      ),
                      label: const Text('Google'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon/logo_facebook.png',
                        width: 20,
                      ),
                      label: const Text('Facebook'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous aviez déjà un compte?",
                      style: GoogleFonts.radley(
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                      child: const Text("Se connecter"),
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
