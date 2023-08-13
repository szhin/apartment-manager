import 'package:apartment_manager/screens/apartment/find_apartment_screen.dart';
import 'package:apartment_manager/screens/setting/screens/payment_screen.dart';
import 'package:apartment_manager/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';

import '../models/account.dart';

class MenuBottom extends StatelessWidget {
  final Account accountLogin;
  const MenuBottom({super.key, required this.accountLogin});

  void toFindScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FindApartmentScreen(
          accountLogin: accountLogin,
        ),
      ),
    );
  }

  void toPaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentScreen(
          title: 'Payment',
          accountLogin: accountLogin,
        ),
      ),
    );
  }

  void toSettingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingScreen(
          accountLogin: accountLogin,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: Container(
        margin: const EdgeInsets.only(right: 20.0, left: 20.0),
        height: 72.0,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0),
            bottom: Radius.circular(40.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                toFindScreen(context);
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                toPaymentScreen(context);
              },
              icon: const Icon(
                Icons.payment,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                toSettingScreen(context);
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
