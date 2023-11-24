import 'package:edu_guard/ui/constants/colors.dart';
import 'package:edu_guard/ui/features/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class Begin extends StatelessWidget {
  const Begin({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: myBlueMarine,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.4,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/logo/logo_white.png',
                  width: 250,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.3,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Onboarding(),
                  ),
                );
              },
              child: const Text("Commencer"),
            ),
          ],
        ),
      ),
    );
  }
}
