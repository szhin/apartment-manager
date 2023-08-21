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
  late Account accountLogin;
  final emailController = TextEditingController();
  bool _isEmailValid = false;
  // if email same in database, _isCorrect = true
  bool _isEmailCorrect = false;
  bool _isPressed = false;
  String warningMessage = '';

  @override
  void initState() {
    super.initState();
    _resetState();
  }

  void _resetState() {
    setState(() {
      emailController.clear();
      _isPressed = false;
      _isEmailCorrect = false;
      _isEmailValid = false;
    });
  }

  void _checkEmailFormat(String email) {
    setState(() {
      if (EmailValidator.validate(email)) {
        _isEmailValid = EmailValidator.validate(email);
        _isPressed = false;
        warningMessage = '';
        _checkCorrectEmail(emailController.text);
      } else {
        warningMessage = 'Invalid email format';
      }
    });
  }

  void _checkCorrectEmail(String text) async {
    List<Account> accounts = await DatabaseAccount.instance.readAllAccounts();
    bool emailFound = false;

    for (var i = 0; i < accounts.length; i++) {
      if (text == accounts[i].email) {
        accountLogin = accounts[i];
        emailFound = true;
        break;
      }
    }

    setState(() {
      _isEmailCorrect = emailFound;
      _isEmailCorrect
          ? warningMessage = ''
          : warningMessage = 'Email address not found';
    });
  }

  ////////////////////// Route screen/////////////////////////
  void toPasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordScreen(accountLogin: accountLogin),
      ),
    ).then(
      (_) => {
        _resetState(),
      },
    );
  }

  void toCreateAccountScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateAccount(),
      ),
    );
  }

  ///////////////////////////////////////////////////////////
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
              _isPressed
                  ? Text(
                      warningMessage,
                      style: const TextStyle(color: Colors.red),
                    )
                  : const Text(
                      '',
                      style: TextStyle(color: Colors.red),
                    ),
              MyTextField(
                controller: emailController,
                hintText: 'Type your email',
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
                onTap: () {
                  setState(() {
                    _isPressed = true;
                  });
                  if (_isEmailCorrect) {
                    toPasswordScreen(context);
                  }
                },
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      toCreateAccountScreen(context);
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
      ),
    );
  }
}
