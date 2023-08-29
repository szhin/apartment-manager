import 'package:apartment_manager/models/apartment.dart';
import 'package:apartment_manager/screens/payment/book_now_screen.dart';
import 'package:apartment_manager/services/database_transaction_history.dart';
import 'package:flutter/material.dart';

import '../../../models/account.dart';

class ApartmentInfo extends StatefulWidget {
  final Apartment apartment;
  final Account accountLogin;

  const ApartmentInfo({
    Key? key,
    required this.apartment,
    required this.accountLogin,
  }) : super(key: key);

  @override
  _ApartmentInfoState createState() => _ApartmentInfoState();
}

class _ApartmentInfoState extends State<ApartmentInfo> {
  bool booked = false;
  int daysPaymentAgain = 0;
  DateTime nextDayPayment = DateTime.now();
  String warning = '';

  @override
  void initState() {
    super.initState();
    changedBooked();
    warning = '';
  }

  void toBookNowScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookNowScreen(
          title: 'Book Now',
          accountLogin: widget.accountLogin,
          apartment: widget.apartment,
        ),
      ),
    );
  }

  Future<void> changedBooked() async {
    final allTransactions =
        await DatabaseTransactionHistory.instance.readAllTransactionHistorys();
    final transactionsBooked = allTransactions
        .where(
          (transaction) =>
              transaction.username == widget.accountLogin.username &&
              transaction.nameApartment == widget.apartment.title,
        )
        .toList();

    setState(() {
      booked = transactionsBooked.isNotEmpty ? true : false;
      if (booked) {
        for (var i = 0; i < allTransactions.length; i++) {
          if (allTransactions[i].username == widget.accountLogin.username &&
              allTransactions[i].nameApartment == widget.apartment.title) {
            final now = DateTime.now();
            final paymentDate = allTransactions[i].date;

            final difference = now.difference(paymentDate);
            final nextPaymentDate = paymentDate.add(const Duration(days: 30));

            nextDayPayment = nextPaymentDate;
            daysPaymentAgain = 30 - difference.inDays;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.adb,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 4),
                Text(
                  'Shin.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.apartment.title,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.apartment.address,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.apartment.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 168, 173, 182)
                            .withOpacity(0.4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.bed,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Bedrooms',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 168, 173, 182)
                            .withOpacity(0.4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.bathroom,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Bathrooms',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 168, 173, 182)
                            .withOpacity(0.4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.car_crash,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Parking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 168, 173, 182)
                            .withOpacity(0.4),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.pool,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Pool',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  warning,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${widget.apartment.price}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 236, 192, 49),
                          fontSize: 32),
                    ),
                    booked
                        ? Text(
                            'Next payment in $daysPaymentAgain days',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 236, 192, 49),
                                fontSize: 14),
                          )
                        : const Text(
                            'Month',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    if (daysPaymentAgain == 0) {
                      toBookNowScreen(context);
                    } else {
                      setState(() {
                        warning =
                            'Next payment date: ${nextDayPayment.day}/${nextDayPayment.month}/${nextDayPayment.year}';
                      });
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: booked
                        ? Colors.black
                        : Colors.white, // Màu nền của button
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25, 10.0),
                    child: booked
                        ? Text(
                            daysPaymentAgain == 0 ? 'Pay' : 'Booked',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 236, 192, 49),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text(
                            'Book Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
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
