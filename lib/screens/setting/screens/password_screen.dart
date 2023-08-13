import 'dart:ui';

import 'package:apartment_manager/screens/setting/components/leading_appbar_setting.dart';
import 'package:apartment_manager/screens/setting/components/title_appbar_setting.dart';
import 'package:apartment_manager/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';

import '../../../components/inkwell_text.dart';
import '../../../components/my_textfield.dart';
import '../../../models/account.dart';

class PasswordScreenSetting extends StatelessWidget {
  final String title;
  final Account accountLogin;

  const PasswordScreenSetting(
      {super.key, required this.title, required this.accountLogin});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: TitleAppBarSetting(title: title, isComponent: true),
          centerTitle: true,
          leading: const LeadingAppBarSetting(isComponent: true),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: ClipRRect(
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 10,
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
                  height: MediaQuery.of(context).size.height * 0.57,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 32, right: 20, bottom: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Old password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            controller: name,
                            hintText: 'Password',
                            obscureText: true,
                            onChanged: () {},
                            icon: Icons.lock,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'New password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            controller: name,
                            hintText: 'New password',
                            obscureText: true,
                            onChanged: () {},
                            icon: Icons.lock,
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Minimum 8 characters',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Confirm new password',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            controller: name,
                            hintText: 'Confirm new password',
                            obscureText: true,
                            onChanged: () {},
                            icon: Icons.lock,
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Minimum 8 characters',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 35),
                          InkWellText(
                            text: 'Change password',
                            margin: 0,
                            isValidEmail: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          MenuBottom(accountLogin: accountLogin),
        ],
      ),
    );
  }
}
