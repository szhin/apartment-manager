import 'package:apartment_manager/components/inkwell_text.dart';
import 'package:apartment_manager/components/my_textfield.dart';
import 'package:apartment_manager/screens/sign_in/create_account.dart';
import 'package:apartment_manager/screens/sign_in/password_screen.dart';
import 'package:apartment_manager/services/database_account.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../models/account.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final usernameController = TextEditingController();
  bool _isEmailValid = false;
  bool _isCorrectEmail = false;

  void _checkEmailFormat(String email) {
    setState(() {
      if (EmailValidator.validate(email)) {
        _isEmailValid = EmailValidator.validate(email);
        _checkCorrectEmailUsername(email);
      }
    });
  }

  void _checkCorrectEmailUsername(String text) async {
    List<Account> accounts = await DatabaseAccount.instance.readAllAccounts();
    setState(() {
      for (var i = 0; i < accounts.length; i++) {
        if (text == accounts[i].email) {
          _isCorrectEmail = true;
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

  void screenEmailToCreateAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateAccount(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
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
                  icon: Icons.email,
                ),
                const SizedBox(height: 24),
                InkWellText(
                  text: 'Continue',
                  margin: 0,
                  isValidEmail: _isEmailValid,
                  isCorrect: _isCorrectEmail,
                  onTap: () {
                    screenEmailToPassword(context);
                  },
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        screenEmailToCreateAccount(context);
                      },
                      child: const Text(
                        'New user? Create an account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
