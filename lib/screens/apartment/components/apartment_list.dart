import 'package:apartment_manager/models/apartment.dart';
import 'package:flutter/material.dart';

import 'apartment_item.dart';

class ApartmentList extends StatefulWidget {
  final List<Apartment> currentApartments;
  const ApartmentList({super.key, required this.currentApartments});

  @override
  State<ApartmentList> createState() => _ApartmentListState();
}

class _ApartmentListState extends State<ApartmentList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.currentApartments.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return ApartmentItem(apartment: widget.currentApartments[index]);
      },
    );
  }
}
