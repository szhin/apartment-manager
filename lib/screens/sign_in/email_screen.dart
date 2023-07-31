import 'package:apartment_manager/components/inkwell_text.dart';
import 'package:apartment_manager/components/my_textfield.dart';
import 'package:apartment_manager/data/accounts_info.dart';
import 'package:apartment_manager/screens/sign_in/password_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isCorrectEmailUsername = false;

  void _checkEmailFormat(String email) {
    setState(() {
      if (EmailValidator.validate(email)) {
        _isEmailValid = EmailValidator.validate(email);
        _checkCorrectEmailUsername(email);
      }
    });
  }

  void _checkCorrectEmailUsername(String text) {
    setState(() {
      for (var i = 0; i < accountsInfo.length; i++) {
        if (text == accountsInfo[i].email) {
          _isCorrectEmailUsername = true;
        }
      }
    });
  }

  void screenEmailToPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
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
              'Your business\nemail address',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            MyTextField(
              controller: usernameController,
              hintText: 'Username or email',
              obscureText: false,
              onChanged: (text) {
                _checkEmailFormat(text);
              },
            ),
            const SizedBox(height: 24),
            InkWellText(
              text: 'Continue',
              margin: 0,
              isValid: _isEmailValid,
              isCorrectEmail: _isCorrectEmailUsername,
              onTap: () {
                screenEmailToPassword(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
