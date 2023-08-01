import 'package:apartment_manager/components/inkwell_text.dart';
import 'package:apartment_manager/components/my_textfield.dart';
import 'package:apartment_manager/data/accounts_info.dart';
import 'package:apartment_manager/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final passwordController = TextEditingController();
  bool _isCorrectPassword = false;

  void _checkCorrectPassword(String password) {
    setState(() {
      for (var i = 0; i < accountsInfo.length; i++) {
        if (password == accountsInfo[i].password) {
          _isCorrectPassword = true;
        }
      }
    });
  }

  void screenPasswordToLoading(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoadingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            const Text(
              'Enter your\npassword',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            MyTextField(
              controller: passwordController,
              hintText: 'Your password',
              obscureText: true,
              onChanged: (password) {
                _checkCorrectPassword(password);
              },
              icon: Icons.lock,
            ),
            const SizedBox(height: 24),
            InkWellText(
              text: 'Continue',
              margin: 0,
              isValidEmail: true,
              isCorrect: _isCorrectPassword,
              onTap: () {
                screenPasswordToLoading(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
