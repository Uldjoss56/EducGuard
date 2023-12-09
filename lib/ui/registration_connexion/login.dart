import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eduguard/common/widgets/text_form_field_card.dart';
import 'package:eduguard/common/widgets/text_form_field_for_password.dart';
import 'package:eduguard/connectivity.dart';
import 'package:eduguard/data/services/auth_service.dart';
import 'package:eduguard/providers/user.dart';
import 'package:eduguard/ui/accueil.dart';
import 'package:eduguard/ui/registration_connexion/registration/model/authentificated_user.dart';
import 'package:eduguard/ui/registration_connexion/registration/screen/registration.dart';
import 'package:eduguard/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  final connectivity = MyConnectivity();

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
                    final connect = await checkInternetConnectivity();
                    if (_formkey.currentState!.validate()) {
                      // _formkey.currentState!.save();
                      // setState(() {
                      //   loading = true;
                      // });
                      // if (connect) {
                      //   try {
                      //     final String response = await authService.connectUser(
                      //       email: _mailController.text,
                      //       password: _passwordController.text,
                      //     );
                      //     if (response.contains("Connecte")) {
                      //       // ignore: use_build_context_synchronously
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //           //backgroundColor: Color(0xFF4169E1),
                      //           content: Text("Connecté"),
                      //         ),
                      //       );

                      //       setState(() {
                      //         loading = false;
                      //       });

                      //       final User user = authService.getUser();
                      //       final userNotifier =
                      //           ref.read(userProvider.notifier);
                      //       userNotifier.updateUser(user);
                      //       // ignore: use_build_context_synchronously
                      //       Navigator.of(context).pushReplacement(
                      //         MaterialPageRoute(
                      //           builder: (context) => Accueil(
                      //             user: user,
                      //           ),
                      //         ),
                      //       );
                      //     } else {
                      //       setState(() {
                      //         loading = false;
                      //       });
                      //       // ignore: use_build_context_synchronously
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           content: Text(response),
                      //         ),
                      //       );
                      //     }
                      //   } catch (error) {
                      //     setState(() {
                      //       loading = false;
                      //     });
                      //     // ignore: use_build_context_synchronously
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(
                      //         content: Text(error.toString()),
                      //       ),
                      //     );
                      //   }
                      // } else {
                      //   setState(() {
                      //     loading = false;
                      //   });
                      //   // ignore: use_build_context_synchronously
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text("Internet non disponible"),
                      //     ),
                      //   );
                      // }
                    }
                  },
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
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
