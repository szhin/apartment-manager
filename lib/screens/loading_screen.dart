import 'package:flutter/material.dart';

import 'find_apartment_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    timerProcessData();
  }

  void timerProcessData() async {
    await Future.delayed(const Duration(seconds: 2));
    toFindApartmentScreen();
  }

  void toFindApartmentScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FindApartmentScreen(),
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
