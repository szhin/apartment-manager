import 'dart:ui';

import 'package:apartment_manager/models/apartment.dart';
import 'package:apartment_manager/widgets/apartment_info.dart';
import 'package:flutter/material.dart';

class ApartmentScreen extends StatelessWidget {
  final Apartment apartment;

  const ApartmentScreen({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(apartment.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: ClipRRect(
              child: Container(
                color: Colors.transparent.withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
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
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: ApartmentInfo(apartment: apartment),
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    icon: const Icon(Icons.arrow_back),
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Go Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
