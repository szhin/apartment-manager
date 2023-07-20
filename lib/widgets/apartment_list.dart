import 'package:apartment_manager/models/apartment.dart';
import 'package:flutter/material.dart';

import 'apartment_item.dart';

class ApartmentList extends StatelessWidget {
  final List<Apartment> currentApartments;

  const ApartmentList({super.key, required this.currentApartments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: currentApartments.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ApartmentItem(apartment: currentApartments[index]),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
