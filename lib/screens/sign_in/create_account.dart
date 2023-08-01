import 'package:apartment_manager/components/inkwell_text.dart';
import 'package:apartment_manager/components/my_textfield.dart';
import 'package:apartment_manager/data/accounts_info.dart';
import 'package:apartment_manager/screens/loading_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  bool _isAllFieldsFilled = false;
  bool _isEmailValid = false;
  bool _isSameInfo = false;

  void _checkEmailFormat(String email) {
    setState(() {
      _isEmailValid = EmailValidator.validate(email);
    });
  }

  void toLoadingScreen(BuildContext context) {
    _checkAllFieldFilled();
    if (_isAllFieldsFilled && !_isSameInfo && _isEmailValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoadingScreen(),
        ),
      );
    }
  }

  void _checkAllFieldFilled() {
    setState(() {
      _isAllFieldsFilled = name.text.isNotEmpty &&
          email.text.isNotEmpty &&
          phone.text.isNotEmpty &&
          password.text.isNotEmpty &&
          username.text.isNotEmpty;
      if (_isAllFieldsFilled) {
        _checkDifferentInformation();
      }
      _checkEmailFormat(email.text);
    });
  }

  void _checkDifferentInformation() {
    setState(() {
      _isSameInfo = false;
      for (var i = 0; i < accountsInfo.length; i++) {
        if (accountsInfo[i].email == email.text ||
            accountsInfo[i].username == username.text) {
          _isSameInfo = true;
          break;
        }
      }
    });
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.adb,
                    color: Colors.black,
                    size: 32,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Shin.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              MyTextField(
                controller: name,
                hintText: 'Your name',
                obscureText: false,
                onChanged: () {},
                icon: Icons.people,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: phone,
                hintText: 'Phone number',
                obscureText: false,
                onChanged: () {},
                icon: Icons.phone,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: email,
                hintText: 'Email address',
                obscureText: false,
                onChanged: (text) {
                  _checkEmailFormat(text);
                },
                icon: Icons.email,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: username,
                hintText: 'Username',
                obscureText: false,
                onChanged: () {},
                icon: Icons.people_alt,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: password,
                hintText: 'Password',
                obscureText: true,
                onChanged: () {},
                icon: Icons.password,
              ),
              const SizedBox(height: 18),
              InkWellText(
                text: 'Create Account',
                margin: 0,
                isValidEmail: _isEmailValid,
                isCorrect: true,
                onTap: () {
                  toLoadingScreen(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
