import 'package:apartment_manager/components/inkwell_text.dart';
import 'package:apartment_manager/components/my_textfield.dart';
import 'package:apartment_manager/models/account.dart';
import 'package:apartment_manager/screens/sign_in/email_screen.dart';
import 'package:apartment_manager/services/database_account.dart';
import 'package:apartment_manager/widgets/loading_to_email.dart';
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

  @override
  void initState() {
    super.initState();
    name.clear();
    username.clear();
    password.clear();
    email.clear();
    phone.clear();
    _resetState();
  }

  void _resetState() {
    setState(() {
      _isAllFieldsFilled = false;
      _isEmailValid = false;
      _isSameInfo = false;
    });
  }

  void addAccount(BuildContext context) async {
    _checkAllFieldFilled();
    _checkDifferentInformation();
    print('\n\n\n');
    print('_isSameInfo1');
    print(_isSameInfo);
    print('_isAllFieldsFilled');
    print(_isAllFieldsFilled);
    print('_isEmailValid');
    print(_isEmailValid);
    print('\n\n\n');
    if (_isAllFieldsFilled && !_isSameInfo && _isEmailValid) {
      Account newAccount = Account(
        username: username.text,
        password: password.text,
        email: email.text,
        name: name.text,
        phoneNumber: phone.text,
        amountMoney: 0.0,
      );
      await DatabaseAccount.instance.addAccount(newAccount);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const EmailScreen(),
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
    });
  }

  void _checkDifferentInformation() async {
    List<Account> accounts = await DatabaseAccount.instance.readAllAccounts();
    bool isSameInfo = accounts.any((account) =>
        account.email == email.text || account.username == username.text);
    print('\n\n\n');
    print(_isSameInfo);
    print(isSameInfo);
    print('\n\n\n');

    setState(() {
      _isSameInfo = isSameInfo;
      print(_isSameInfo);
    });
  }

  void _checkEmailFormat(String email) {
    setState(() {
      _isEmailValid = EmailValidator.validate(email);
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
                onChanged: () {},
                icon: Icons.people,
                keyboardType: false,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: phone,
                hintText: 'Phone number',
                onChanged: () {},
                icon: Icons.phone,
                keyboardType: true,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: email,
                hintText: 'Email address',
                onChanged: (text) {
                  _checkEmailFormat(text);
                },
                icon: Icons.email,
                keyboardType: false,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: username,
                hintText: 'Username',
                onChanged: () {},
                icon: Icons.people_alt,
                keyboardType: false,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: password,
                hintText: 'Password',
                obscureText: true,
                onChanged: () {},
                icon: Icons.password,
                keyboardType: false,
              ),
              const SizedBox(height: 32),
              InkWellText(
                text: 'Create Account',
                margin: 0,
                isValidEmail: _isEmailValid,
                onTap: () async {
                  addAccount(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
