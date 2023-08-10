import 'package:apartment_manager/screens/apartment/find_apartment_screen.dart';
import 'package:flutter/material.dart';

import '../models/account.dart';

// ignore: must_be_immutable
class LoadingScreen extends StatefulWidget {
  Account accountLogin;

  LoadingScreen({super.key, required this.accountLogin});

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
        builder: (context) => FindApartmentScreen(
          accountLogin: widget.accountLogin,
        ),
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
