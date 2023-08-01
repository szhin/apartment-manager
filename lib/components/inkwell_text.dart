import 'package:flutter/material.dart';

class InkWellText extends StatelessWidget {
  final String text;
  final double margin;
  final bool isValidEmail;

  // isValidEmail to check validity of email format
  // (_isEmailValid = EmailValidator.validate(email))
  final bool isCorrect;
  // isCorrect to check the similarity between
  // text and password or text or email in database
  final Function onTap;

  const InkWellText({
    super.key,
    required this.text,
    required this.margin,
    required this.isValidEmail,
    required this.isCorrect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // If inkwell not have contain Email, parameter = true
    final color = isValidEmail
        ? const Color.fromARGB(255, 7, 126, 225)
        : const Color.fromRGBO(165, 216, 255, 1);

    return InkWell(
      onTap: () => {
        if (isCorrect)
          {
            onTap(),
          }
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        margin: EdgeInsets.symmetric(horizontal: margin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
