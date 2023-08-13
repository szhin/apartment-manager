import 'package:apartment_manager/data/apartment_data.dart';
import 'package:apartment_manager/models/account.dart';
import 'package:apartment_manager/models/apartment.dart';
import 'package:apartment_manager/screens/setting/setting_screen.dart';
import 'package:apartment_manager/screens/apartment/components/apartment_list.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FindApartmentScreen extends StatefulWidget {
  Account accountLogin;
  FindApartmentScreen({super.key, required this.accountLogin});

  @override
  State<FindApartmentScreen> createState() => _FindApartmentScreenState();
}

class _FindApartmentScreenState extends State<FindApartmentScreen> {
  List<Apartment> currentApartments = shinApartments;
  List<Apartment> recommendApartments = [];
  List<Apartment> newApartments = [];
  DateTime twoMonthAgo = DateTime.now().subtract(const Duration(days: 60));

  Color blackColor = Colors.black;
  Color greyColor = Colors.grey;

  bool isRecommendSelected = false;
  bool isNewSelected = false;
  bool isAllSelected = true;

  // initialize value for recommendApartments & newApartments
  @override
  void initState() {
    super.initState();
    recommendApartments =
        shinApartments.where((apartment) => apartment.recommended).toList();
    newApartments = shinApartments
        .where((apartment) => apartment.date.isAfter(twoMonthAgo))
        .toList();
  }

  // Function to change the currentApartments value
  void kindApartments(List<Apartment> selectedKindApartments) {
    setState(() {
      currentApartments = selectedKindApartments;
    });
  }

  void toSettingScreen(BuildContext context, Account accountLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingScreen(accountLogin: accountLogin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(255, 12, 59, 46),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.adb,
              color: Colors.black,
            ),
            SizedBox(width: 4),
            Text(
              'Shin.',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 30),
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, ${widget.accountLogin.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    toSettingScreen(context, widget.accountLogin);
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 6,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 31, 119, 94),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Text(
                      'Find\nApartments',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                    ),
                  ],
                ),
                Container(
                  width: 64,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white, // Set the background color to white
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 234, 229, 229), // Set the border color to black
                      width: 10, // Set the border width
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(
                    child: Transform.rotate(
                      angle:
                          270 * 3.1415926535 / 180, // Góc xoay tính theo radian
                      child: const Icon(
                        Icons.tune,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    isAllSelected = true;
                    isRecommendSelected = false;
                    isNewSelected = false;
                    kindApartments(shinApartments);
                  },
                  child: Text(
                    'All',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: isAllSelected ? blackColor : greyColor,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isRecommendSelected = true;
                    isAllSelected = false;
                    isNewSelected = false;
                    kindApartments(recommendApartments);
                  },
                  child: Text(
                    'Recommend',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: isRecommendSelected ? blackColor : greyColor,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isNewSelected = true;
                    isRecommendSelected = false;
                    isAllSelected = false;
                    kindApartments(newApartments);
                  },
                  child: Text(
                    'New',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: isNewSelected ? blackColor : greyColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ApartmentList(
              currentApartments: currentApartments,
              accountLogin: widget.accountLogin,
            ),
          ],
        ),
      ),
    );
  }
}
