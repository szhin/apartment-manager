import 'package:apartment_manager/screens/sign_in/email_screen.dart';
import 'package:flutter/material.dart';

class LoadingToEmail extends StatefulWidget {
  const LoadingToEmail({super.key});

  @override
  State<LoadingToEmail> createState() => _LoadingToEmailState();
}

class _LoadingToEmailState extends State<LoadingToEmail> {
  @override
  void initState() {
    super.initState();
    timerProcessData();
  }

  void timerProcessData() async {
    await Future.delayed(const Duration(seconds: 2));
    toEmailScreen();
  }

  void toEmailScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
