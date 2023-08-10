import 'package:apartment_manager/screens/sign_in/account/components/leading_appbar_setting.dart';
import 'package:apartment_manager/screens/sign_in/account/components/setting_component.dart';
import 'package:apartment_manager/screens/sign_in/account/components/title_appbar_setting.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/about_us_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/edit_profile_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/help_center_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/language_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/notifications_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/password_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/payment_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/report_a_problem_screen.dart';
import 'package:apartment_manager/screens/sign_in/account/screens/security_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void toEditProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(title: 'Edit profile'),
      ),
    );
  }

  void toPasswordScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreenSetting(title: 'Password'),
      ),
    );
  }

  void toPaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PaymentScreen(title: 'Payment'),
      ),
    );
  }

  void toNotificationsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NotificationsScreen(title: 'Notifications'),
      ),
    );
  }

  void toSecurityScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecurityScreen(title: 'Security'),
      ),
    );
  }

  void toLanguageScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LanguageScreen(title: 'Language'),
      ),
    );
  }

  void toHelpCenterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HelpCenterScreen(title: 'Help center'),
      ),
    );
  }

  void toAboutUsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutUsScreen(title: 'About us'),
      ),
    );
  }

  void toReportAProblemScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const ReportAProblemScreen(title: 'Report a problem'),
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
                toEditProfileScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.lock,
              title: 'Password',
              onTap: () {
                toPasswordScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.payment,
              title: 'Payment',
              onTap: () {
                toPaymentScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                toNotificationsScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.security,
              title: 'Security',
              onTap: () {
                toSecurityScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.language,
              title: 'Language',
              onTap: () {
                toLanguageScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.help_center,
              title: 'Help center',
              onTap: () {
                toHelpCenterScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.info,
              title: 'About us',
              onTap: () {
                toAboutUsScreen(context);
              },
            ),
            SettingComponent(
              icon: Icons.report,
              title: 'Report a problem',
              onTap: () {
                toReportAProblemScreen(context);
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
                      // Handle row tap if needed
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
