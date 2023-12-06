import 'package:eduguard/ui/accueil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiverCanDispose extends StatefulWidget {
  const ReceiverCanDispose({super.key});

  @override
  State<ReceiverCanDispose> createState() => _ReceiverCanDisposeState();
}

class _ReceiverCanDisposeState extends State<ReceiverCanDispose>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            width / 20,
            width / 4,
            width / 20,
            width / 4,
          ),
          child: Card(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ScaleTransition(
                    scale: _animation,
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        "assets/images/smile.jpg",
                        height: width,
                        width: width / 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(width / 20),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/eduguard_logo_01.png",
                        width: width / 3,
                        height: width / 3,
                      ),
                      SizedBox(
                        height: width / 20,
                      ),
                      Column(
                        children: [
                          Text(
                            "Succès de l'opération",
                            style: GoogleFonts.raleway(
                              color: const Color(0xFF333333),
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(
                            height: width / 30,
                          ),
                          Text(
                            "Votre demande a été bien reçu. Un retour vous sera "
                            "fait, pour confirmation",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: const Color(0xFF4169E1),
                            ),
                          ),
                          SizedBox(
                            height: width / 40,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (_) => const Accueil(),
                                  ),
                                  (route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xDD4169E1),
                              ),
                              child: Text(
                                "Compris",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
