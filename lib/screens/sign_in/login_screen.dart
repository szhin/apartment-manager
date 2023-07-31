import 'dart:ui';

import 'package:apartment_manager/components/inkwell_image_text.dart';
import 'package:apartment_manager/screens/sign_in/email_screen.dart';
import 'package:flutter/material.dart';

import '../../components/inkwell_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void toEmailScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: ClipRRect(
              child: Container(
                color: Colors.transparent.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 52),
                      const Text(
                        "Welcome back to our app!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Please sign in to access your account",
                        style: TextStyle(
                          color: Color.fromARGB(205, 85, 84, 84),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const InkWellImageText(
                        text: 'Continue with Google',
                        imagePath: 'assets/images/login/google.png',
                        margin: 20.0,
                      ),
                      const SizedBox(height: 10),
                      const InkWellImageText(
                        text: 'Continue with Apple',
                        imagePath: 'assets/images/login/apple.png',
                        margin: 20.0,
                      ),
                      const SizedBox(height: 10),
                      InkWellText(
                        text: 'Continue with Email',
                        margin: 20,
                        isValid: true,
                        isCorrectEmail: true,
                        onTap: () {
                          toEmailScreen(context);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
