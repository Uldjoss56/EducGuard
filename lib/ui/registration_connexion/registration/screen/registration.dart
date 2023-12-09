import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eduguard/common/widgets/text_form_field_card.dart';
import 'package:eduguard/common/widgets/text_form_field_for_password.dart';
import 'package:eduguard/data/services/auth_service.dart';
import 'package:eduguard/ui/registration_connexion/login.dart';
import 'package:eduguard/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

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
  AuthService authService = AuthService();

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _nameController.dispose();
    _telController.dispose();
    _mailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  bool loading = false;

  Future<bool> checkInternetConnectivity() async {
    if (_connectionStatus != ConnectivityResult.none) {
      try {
        final response = await http.get(Uri.parse("https://www.google.com"));
        if (response.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } catch (e) {
        return false;
      }
    } else {
      print("He");
      return false;
    }
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
                    final bool connect = await checkInternetConnectivity();
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      setState(() {
                        loading = true;
                      });
                      if (connect) {
                        try {
                          final String state = await authService.createUser(
                            email: _mailController.text,
                            name: _nameController.text,
                            password: _passwordController.text,
                            phone: _telController.text,
                          );

                          if (state.contains("Enregistre")) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Color(0xFF146CC2),
                                content: Text(
                                  "Inscription réussie",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ),
                            );
                          }
                        } catch (error) {
                          setState(() {
                            loading = true;
                          });
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(error.toString()),
                          ));
                        }
                      } else {
                        setState(() {
                          loading = false;
                        });
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Internet non disponible"),
                          ),
                        );
                      }
                    }
                  },
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
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
