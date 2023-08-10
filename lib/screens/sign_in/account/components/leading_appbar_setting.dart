import 'package:flutter/material.dart';

class LeadingAppBarSetting extends StatelessWidget {
  final bool isComponent;

  const LeadingAppBarSetting({
    super.key,
    required this.isComponent,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      color: isComponent ? Colors.white : Colors.black,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
