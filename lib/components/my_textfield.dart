import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Function onChanged;
  final IconData icon;
  final bool keyboardType;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged,
    required this.icon,
    this.keyboardType = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextField(
        controller: controller,
        onChanged: (text) {
          onChanged(text);
        },
        obscureText: obscureText,
        keyboardType: keyboardType
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
              bottom: Radius.circular(14),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 196, 196, 196),
            ),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(14),
              bottom: Radius.circular(14),
            ),
          ),
          fillColor: const Color.fromRGBO(243, 245, 247, 1),
          filled: true,
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
