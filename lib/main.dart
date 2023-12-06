import 'package:eduguard/ui/onboarding/begin.dart';
import 'package:eduguard/ui/registration_connexion/login.dart';
import 'package:eduguard/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: myBlueMarine,
);

const MaterialColor customSwatchColor = MaterialColor(
  0xFF4169E1,
  <int, Color>{
    50: Color(0xFFE6E6FA),
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('first_time') ?? true;

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
    (_) {
      runApp(
        ProviderScope(
          child: MainApp(
            isFirstTime: isFirstTime,
          ),
        ),
      );
    },
  );

  if (isFirstTime) {
    await prefs.setBool('first_time', false);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.isFirstTime,
  });
  final bool isFirstTime;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: customSwatchColor).copyWith(
        //scaffoldBackgroundColor: myGris,
        textTheme: const TextTheme().copyWith(
          titleLarge: GoogleFonts.raleway(color: Colors.black),
          bodyMedium: GoogleFonts.raleway(),
        ),
        colorScheme: kColorScheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: GoogleFonts.raleway(),
            backgroundColor: myBlueRoyal,
            foregroundColor: Colors.white,
          ),
        ),
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
      home: isFirstTime ? const Begin() : const Login(),
    );
  }
}
