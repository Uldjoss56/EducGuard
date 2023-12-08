import 'package:eduguard/ui/accueil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseCursusType extends StatefulWidget {
  const ChooseCursusType({super.key});

  @override
  State<ChooseCursusType> createState() => _ChooseCursusTypeState();
}

class _ChooseCursusTypeState extends State<ChooseCursusType> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: width / 3,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const Accueil(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Color(
                      0xFF4169E1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                    color: Color(0xDD333333),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "Souscrire à une assurance",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
