import 'package:flutter/material.dart';

class SettingComponent extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const SettingComponent({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Color.fromARGB(255, 232, 236, 239),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.black,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              onTap();
            },
          ),
        ),
      ],
    );
  }
}
