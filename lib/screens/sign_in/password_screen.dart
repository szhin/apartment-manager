import 'package:apartment_manager/components/inkwell_text.dart';
import 'package:apartment_manager/components/my_textfield.dart';
import 'package:apartment_manager/models/account.dart';
import 'package:apartment_manager/widgets/loading_screen.dart';
import 'package:apartment_manager/services/database_account.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final passwordController = TextEditingController();
  bool _isCorrectPassword = false;
  bool _isPressed = false;
  late Account accountLogin;
  String _warningMessage = 'Wrong password';

  @override
  void initState() {
    super.initState();
    _resetState();
  }

  void _resetState() {
    setState(() {
      passwordController.clear();
      _isCorrectPassword = false;
      _isPressed = false;
      _warningMessage = 'Wrong password';
    });
  }

  void _checkCorrectPassword(String password) async {
    List<Account> accounts = await DatabaseAccount.instance.readAllAccounts();
    setState(() {
      _isCorrectPassword = false;
      _isPressed = false;
      for (var i = 0; i < accounts.length; i++) {
        if (password == accounts[i].password) {
          _isCorrectPassword = true;
          accountLogin = accounts[i];
          break;
        }
      }
    });
  }

  ////////////////////// Route screen/////////////////////////
  void toLoadingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(
          accountLogin: accountLogin,
        ),
      ),
    ).then(
      (_) => _resetState(),
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
                'Enter your\npassword',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                _isPressed ? _warningMessage : '',
                style: const TextStyle(color: Colors.red),
              ),
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
                onTap: () {
                  setState(() {
                    _isPressed = true;
                  });
                  if (_isCorrectPassword) {
                    _warningMessage = '';
                    toLoadingScreen(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
