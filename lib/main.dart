import 'package:edu_guard/ui/constants/colors.dart';
import 'package:edu_guard/ui/features/accueil.dart';
import 'package:edu_guard/ui/registration_connexion/registration/screen/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: myBlueMarine,
);
const MaterialColor customSwatchColor = MaterialColor(
  0xFF4169E1,
  <int, Color>{
    50: Color(0xFF333333),
    100: Color(0xFFB0C4DE),
    200: Color(0xFF778899),
    300: Color(0xFF5A5E6B),
    400: Color(0xFF483D8B),
    500: Color(0xFF4169E1),
    600: Color(0xFF3A5FCD),
    700: Color(0xFF364DB0),
    800: Color(0xFF2F4F4F),
    900: Color(0xFF1E90FF),
  },
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(primarySwatch: customSwatchColor).copyWith(
          scaffoldBackgroundColor: myGris,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: GoogleFonts.raleway(),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: GoogleFonts.raleway(),
            ),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Accueil();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Registration();
          },
        ),
      ),
    ),
  );
}
