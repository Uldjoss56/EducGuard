import 'package:eduguard/ui/registration_connexion/registration_or_login.dart';
import 'package:eduguard/utils/constants/colors.dart';
import 'package:eduguard/utils/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final Widget _selectedContainer = Container(
    width: 17,
    height: 8,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(15),
    ),
  );
  final Widget _notSelectedContainer = ClipOval(
    child: Container(
      width: 12,
      height: 10,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(141, 0, 0, 0),
            Color(0xFFC8CBCE),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: PageView.builder(
        itemCount: onboardingData.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          currentIndex = index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    onboardingData[index]['pathToImg'].toString(),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      onboardingData[index]['text'].toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index == 0 ? _selectedContainer : _notSelectedContainer,
                      const SizedBox(
                        width: 10,
                      ),
                      index == 1 ? _selectedContainer : _notSelectedContainer,
                      const SizedBox(
                        width: 10,
                      ),
                      index == 2 ? _selectedContainer : _notSelectedContainer,
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myBlueMarine,
        onPressed: () {
          if (currentIndex < onboardingData.length - 1) {
            setState(() {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          } else if (currentIndex == onboardingData.length - 1) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const RegistrationOrLogin(),
            ));
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
