import 'package:apartment_manager/components/inkwell_text.dart';
import 'package:apartment_manager/components/my_textfield.dart';
import 'package:apartment_manager/models/account.dart';
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
  String textInformFilled = '';

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
      textInformFilled = '';
    });
  }

  void addAccount() async {
    // Check same information
    List<Account> accounts = await DatabaseAccount.instance.readAllAccounts();
    bool isSameInfo = accounts.any((account) =>
        account.email == email.text || account.username == username.text);

    setState(() {
      _isSameInfo = isSameInfo;
    });

    // add account
    if (_isAllFieldsFilled && !_isSameInfo && _isEmailValid) {
      Account newAccount = Account(
        username: username.text,
        password: password.text,
        email: email.text,
        name: name.text,
        phoneNumber: phone.text,
        amountMoney: 0.0,
      );
      setState(() {
        textInformFilled = '';
      });
      await DatabaseAccount.instance.addAccount(newAccount);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoadingToEmail(),
        ),
      );
    } else if (!_isAllFieldsFilled) {
      setState(() {
        textInformFilled = 'All fields must be filled';
      });
    }
  }

  void _checkAllFieldFilled() {
    bool allChecked = name.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        email.text.isNotEmpty &&
        username.text.isNotEmpty &&
        password.text.isNotEmpty;
    setState(() {
      _isAllFieldsFilled = allChecked;
    });
  }

  // void _checkDifferentInformation() async {}

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
                onChanged: (text) {
                  final trimmedText =
                      text.replaceAll('  ', ' '); // Remove whitespaces
                  name.text = trimmedText;
                  name.selection = TextSelection.fromPosition(
                    TextPosition(offset: trimmedText.length),
                  );
                },
                icon: Icons.people,
                keyboardType: false,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: phone,
                hintText: 'Phone number',
                onChanged: (text) {
                  final trimmedText =
                      text.replaceAll(' ', ''); // Remove whitespaces
                  phone.text = trimmedText;
                  phone.selection = TextSelection.fromPosition(
                    TextPosition(offset: trimmedText.length),
                  );
                },
                icon: Icons.phone,
                keyboardType: true,
              ),
              const SizedBox(height: 18),
              !_isEmailValid && email.text.isNotEmpty
                  ? const Text(
                      'Invalid email format',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : const SizedBox(height: 0),
              MyTextField(
                controller: email,
                hintText: 'Email address',
                onChanged: (text) {
                  final trimmedText =
                      text.replaceAll(' ', ''); // Remove whitespaces
                  email.text = trimmedText;
                  email.selection = TextSelection.fromPosition(
                    TextPosition(offset: trimmedText.length),
                  );
                  _checkEmailFormat(text);
                },
                icon: Icons.email,
                keyboardType: false,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: username,
                hintText: 'Username',
                onChanged: (text) {
                  final trimmedText =
                      text.replaceAll(' ', ''); // Remove whitespaces
                  username.text = trimmedText;
                  username.selection = TextSelection.fromPosition(
                    TextPosition(offset: trimmedText.length),
                  );
                },
                icon: Icons.people_alt,
                keyboardType: false,
              ),
              const SizedBox(height: 18),
              MyTextField(
                controller: password,
                hintText: 'Password',
                obscureText: true,
                onChanged: (text) {
                  final trimmedText =
                      text.replaceAll(' ', ''); // Remove whitespaces
                  password.text = trimmedText;
                  password.selection = TextSelection.fromPosition(
                    TextPosition(offset: trimmedText.length),
                  );
                },
                icon: Icons.password,
                keyboardType: false,
              ),
              !_isAllFieldsFilled
                  ? Text(
                      textInformFilled,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : const SizedBox(height: 0),
              _isSameInfo
                  ? const Text(
                      'Username or email already exists',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : const SizedBox(height: 0),
              const SizedBox(height: 32),
              InkWellText(
                text: 'Create Account',
                margin: 0,
                isValidEmail: _isEmailValid,
                onTap: () async {
                  _checkAllFieldFilled();
                  addAccount();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
