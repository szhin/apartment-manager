import 'package:apartment_manager/models/apartment.dart';
import 'package:apartment_manager/screens/apartment/apartment_screen.dart';
import 'package:flutter/material.dart';

import '../../../models/account.dart';

class ApartmentItem extends StatelessWidget {
  final Apartment apartment;
  final Account accountLogin;
  const ApartmentItem({
    super.key,
    required this.apartment,
    required this.accountLogin,
  });

  void toApartmentScreen(BuildContext context, Account accoutnLogin) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ApartmentScreen(
          apartment: apartment,
          accountLogin: accountLogin,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity, // Chiều rộng bằng 100% phần tử cha
          constraints:
              const BoxConstraints(maxHeight: 400), // Giới hạn chiều cao là 400
          child: FractionallySizedBox(
            widthFactor: 1.0, // Chiều rộng bằng 100% phần tử cha
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(48), // Border radius của hình ảnh
              child: Image.asset(
                apartment.imagePath,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: Container(
              color: Colors.transparent.withOpacity(0.3),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Text(
            apartment.title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: TextButton(
            onPressed: () {
              toApartmentScreen(
                context,
                accountLogin,
              );
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white, // Màu nền của button
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(25.0, 10.0, 25, 10.0),
              child: Text(
                'Take a look',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
