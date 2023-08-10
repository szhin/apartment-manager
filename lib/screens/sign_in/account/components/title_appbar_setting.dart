import 'package:flutter/material.dart';

class TitleAppBarSetting extends StatelessWidget {
  final String title;
  final bool isComponent;

  const TitleAppBarSetting({
    super.key,
    required this.title,
    required this.isComponent,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isComponent ? Colors.white : Colors.black,
      ),
    );
  }
}
