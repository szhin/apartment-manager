import 'dart:ui';

import 'package:apartment_manager/screens/setting/components/leading_appbar_setting.dart';
import 'package:apartment_manager/screens/setting/components/title_appbar_setting.dart';
import 'package:apartment_manager/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';

import '../../../components/my_textfield.dart';
import '../../../models/account.dart';

class EditProfileScreen extends StatelessWidget {
  final String title;
  final Account accountLogin;

  const EditProfileScreen(
      {super.key, required this.title, required this.accountLogin});

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final username = TextEditingController();
    final email = TextEditingController();
    final bio = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: TitleAppBarSetting(title: title, isComponent: true),
          centerTitle: true,
          leading: const LeadingAppBarSetting(isComponent: true),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: ClipRRect(
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 10,
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.57,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 32, right: 20, bottom: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Edit profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            controller: name,
                            hintText: 'Your name',
                            obscureText: false,
                            onChanged: () {},
                            icon: Icons.people,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Username',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            controller: username,
                            hintText: 'Username',
                            obscureText: false,
                            onChanged: () {},
                            icon: Icons.people,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          MyTextField(
                            controller: email,
                            hintText: 'Email',
                            obscureText: false,
                            onChanged: () {},
                            icon: Icons.email,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Bio',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: bio,
                            minLines: 4,
                            maxLines: 4,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 196, 196, 196),
                                ),
                              ),
                              fillColor: Color.fromRGBO(243, 245, 247, 1),
                              filled: true,
                              hintText: 'Short bio',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          MenuBottom(accountLogin: accountLogin),
        ],
      ),
    );
  }
}
