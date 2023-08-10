import 'package:apartment_manager/screens/setting/components/leading_appbar_setting.dart';
import 'package:apartment_manager/screens/setting/components/title_appbar_setting.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  final String title;
  const LanguageScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          title: TitleAppBarSetting(title: title, isComponent: true),
          centerTitle: true,
          leading: const LeadingAppBarSetting(isComponent: true),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
