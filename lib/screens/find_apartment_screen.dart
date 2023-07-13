import 'package:flutter/material.dart';

class FindApartmentScreen extends StatelessWidget {
  const FindApartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.adb),
            SizedBox(width: 4),
            Text(
              'Shin.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
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
                        color: const Color.fromARGB(235, 188, 122, 15),
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
            const SizedBox(
              height: 30,
            ),
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
                    'All',
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
