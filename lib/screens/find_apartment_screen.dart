import 'package:apartment_manager/data/apartment_data.dart';
import 'package:apartment_manager/widgets/apartment_item.dart';
import 'package:flutter/material.dart';

class FindApartmentScreen extends StatelessWidget {
  const FindApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 59, 46),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.adb,
              color: Colors.white,
            ),
            SizedBox(width: 4),
            Text(
              'Shin.',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
                  onTap: () {},
                  child: Text(
                    'Recommend',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'New',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'All',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: shinApartments.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ApartmentItem(apartment: shinApartments[index]),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
