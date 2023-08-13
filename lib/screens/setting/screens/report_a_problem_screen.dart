import 'package:apartment_manager/screens/setting/components/leading_appbar_setting.dart';
import 'package:apartment_manager/screens/setting/components/title_appbar_setting.dart';
import 'package:flutter/material.dart';

import '../../../models/account.dart';
import '../../../widgets/menu_bottom.dart';

class ReportAProblemScreen extends StatelessWidget {
  final String title;
  final Account accountLogin;
  const ReportAProblemScreen(
      {super.key, required this.title, required this.accountLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          title: TitleAppBarSetting(title: title, isComponent: true),
          centerTitle: true,
          leading: const LeadingAppBarSetting(isComponent: true),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuBottom(accountLogin: accountLogin),
          ],
        ),
      ),
    );
  }
}
