import 'package:apartment_manager/screens/setting/components/leading_appbar_setting.dart';
import 'package:apartment_manager/screens/setting/components/setting_component.dart';
import 'package:apartment_manager/screens/setting/components/title_appbar_setting.dart';
import 'package:apartment_manager/screens/setting/screens/about_us_screen.dart';
import 'package:apartment_manager/screens/setting/screens/delete_account_screen.dart';
import 'package:apartment_manager/screens/setting/screens/edit_profile_screen.dart';
import 'package:apartment_manager/screens/setting/screens/help_center_screen.dart';
import 'package:apartment_manager/screens/setting/screens/language_screen.dart';
import 'package:apartment_manager/screens/setting/screens/notifications_screen.dart';
import 'package:apartment_manager/screens/setting/screens/password_screen.dart';
import 'package:apartment_manager/screens/setting/screens/payment_screen.dart';
import 'package:apartment_manager/screens/setting/screens/report_a_problem_screen.dart';
import 'package:apartment_manager/screens/setting/screens/security_screen.dart';
import 'package:flutter/material.dart';

import '../../models/account.dart';

class SettingScreen extends StatelessWidget {
  final Account accountLogin;
  const SettingScreen({super.key, required this.accountLogin});

  void toEditProfileScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          title: 'Edit profile',
          accountLogin: accountLogin,
        ),
      ),
    );
  }

  void toPasswordScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordScreenSetting(
            title: 'Password', accountLogin: accountLogin),
      ),
    );
  }

  void toPaymentScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PaymentScreen(title: 'Payment', accountLogin: accountLogin),
      ),
    );
  }

  void toNotificationsScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationsScreen(
            title: 'Notifications', accountLogin: accountLogin),
      ),
    );
  }

  void toSecurityScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SecurityScreen(title: 'Security', accountLogin: accountLogin),
      ),
    );
  }

  void toLanguageScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            LanguageScreen(title: 'Language', accountLogin: accountLogin),
      ),
    );
  }

  void toHelpCenterScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HelpCenterScreen(title: 'Help center', accountLogin: accountLogin),
      ),
    );
  }

  void toAboutUsScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AboutUsScreen(title: 'About us', accountLogin: accountLogin),
      ),
    );
  }

  void toReportAProblemScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportAProblemScreen(
            title: 'Report a problem', accountLogin: accountLogin),
      ),
    );
  }

  void toDeleteAccountScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeleteAccountScreen(
            title: 'Delete account', accountLogin: accountLogin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          title:
              const TitleAppBarSetting(title: 'Settings', isComponent: false),
          centerTitle: true,
          leading: const LeadingAppBarSetting(isComponent: false),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SettingComponent(
              icon: Icons.people,
              title: 'Edit profile',
              onTap: () {
                toEditProfileScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.lock,
              title: 'Password',
              onTap: () {
                toPasswordScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.payment,
              title: 'Payment',
              onTap: () {
                toPaymentScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                toNotificationsScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.security,
              title: 'Security',
              onTap: () {
                toSecurityScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                toLanguageScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.help_center,
              title: 'Help center',
              onTap: () {
                toHelpCenterScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.info,
              title: 'About us',
              onTap: () {
                toAboutUsScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.report,
              title: 'Report a problem',
              onTap: () {
                toReportAProblemScreen(context, accountLogin);
              },
            ),
            SettingComponent(
              icon: Icons.logout,
              title: 'Sign out',
              onTap: () {},
            ),
            Column(
              children: [
                const Divider(
                  color: Color.fromARGB(255, 232, 236, 239),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ListTile(
                    leading: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Delete account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      toDeleteAccountScreen(context, accountLogin);
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
