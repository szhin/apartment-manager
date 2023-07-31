import 'package:flutter/material.dart';

class InkWellText extends StatelessWidget {
  final String text;
  final double margin;
  final bool isValid;
  final bool isCorrectEmail;
  final Function onTap;

  const InkWellText({
    super.key,
    required this.text,
    required this.margin,
    required this.isValid,
    required this.isCorrectEmail,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isValid
        ? const Color.fromARGB(255, 7, 126, 225)
        : const Color.fromRGBO(165, 216, 255, 1);

    return InkWell(
      onTap: () => {
        if (isCorrectEmail)
          {
            onTap(),
          }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
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
