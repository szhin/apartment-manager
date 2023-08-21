import 'package:apartment_manager/screens/accounts_data/accounts_data_screen.dart';
import 'package:apartment_manager/screens/apartment/find_apartment_screen.dart';
import 'package:flutter/material.dart';

import '../models/account.dart';

class LoadingScreen extends StatefulWidget {
  final Account accountLogin;

  const LoadingScreen({super.key, required this.accountLogin});

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
        builder: (context) => widget.accountLogin.username != 'admin'
            ? FindApartmentScreen(
                accountLogin: widget.accountLogin,
              )
            : const AccountsDataScreen(),
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
