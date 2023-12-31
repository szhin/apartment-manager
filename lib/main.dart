import 'package:apartment_manager/screens/sign_in/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    headlineLarge: GoogleFonts.robotoSlab(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: GoogleFonts.robotoSlab(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // remove the red banner
      theme: theme,
      home: const LoginScreen(),
      // home: const TransactionsDataScreen(),
    );
  }
}
