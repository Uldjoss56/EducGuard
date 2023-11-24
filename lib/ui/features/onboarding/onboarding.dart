import 'package:edu_guard/ui/constants/colors.dart';
import 'package:edu_guard/ui/constants/data.dart';
import 'package:edu_guard/ui/registration_connexion/registration_or_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int index = 0;
  bool cliOnFirstCicle = true;
  bool cliOnSecondCicle = false;
  bool cliOnThirdCicle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(onboardingData[index]['pathToImg'].toString()),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  onboardingData[index]['text'].toString(),
                  style: GoogleFonts.raleway(
                    color: myGrisFonce,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        cliOnFirstCicle = true;
                        cliOnSecondCicle = false;
                        cliOnThirdCicle = false;
                        index = 0;
                      });
                    },
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: cliOnFirstCicle
                          ? myBlueRoyal
                          : const Color(0xFFC8CBCE),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        cliOnSecondCicle = true;
                        cliOnFirstCicle = false;
                        cliOnThirdCicle = false;
                        index = 1;
                      });
                    },
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: cliOnSecondCicle
                          ? myBlueRoyal
                          : const Color(0xFFC8CBCE),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        cliOnThirdCicle = true;
                        cliOnFirstCicle = false;
                        cliOnSecondCicle = false;
                        index = 2;
                      });
                    },
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: cliOnThirdCicle
                          ? myBlueRoyal
                          : const Color(0xFFC8CBCE),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myBlueMarine,
        onPressed: () {
          if (index != 2) {
            setState(() {
              index++;
              if (index == 0) {
                cliOnFirstCicle = true;
                cliOnSecondCicle = false;
                cliOnThirdCicle = false;
              } else if (index == 1) {
                cliOnFirstCicle = false;
                cliOnSecondCicle = true;
                cliOnThirdCicle = false;
              } else if (index == 2) {
                cliOnFirstCicle = false;
                cliOnSecondCicle = false;
                cliOnThirdCicle = true;
              }
            });
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const RegistrationOrLogin(),
              ),
            );
          }
        },
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
