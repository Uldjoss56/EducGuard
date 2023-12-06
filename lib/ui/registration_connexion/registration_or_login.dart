import 'package:eduguard/ui/registration_connexion/login.dart';
import 'package:eduguard/ui/registration_connexion/registration/screen/registration.dart';
import 'package:eduguard/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationOrLogin extends StatelessWidget {
  const RegistrationOrLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(
                  width: width * 0.1,
                ),
                Image.asset(
                  'assets/logo/logo.png',
                  width: 250,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Commençons",
              style: GoogleFonts.radley(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: myGrisFonce,
              ),
            ),
            SizedBox(
              width: width * 0.6,
              child: Text(
                "Connectez vous pour profiter des fonctionnalités",
                style: GoogleFonts.radley(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: myGrisFonce,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 60),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              child: const Text("Se connecter"),
            ),
            const SizedBox(
              height: 2,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 70),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Registration(),
                  ),
                );
              },
              child: const Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}
