import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../models/account.dart';
import '../../../models/transaction.dart';
import '../../../widgets/menu_bottom.dart';
import '../../payment/top_up_screen.dart';
import '../../payment/transfer_screen.dart';
import '../../payment/withdraw_screen.dart';
import '../components/leading_appbar_setting.dart';
import '../components/title_appbar_setting.dart';

class PaymentScreen extends StatefulWidget {
  final Account accountLogin;
  final String title;
  const PaymentScreen(
      {super.key, required this.accountLogin, required this.title});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    void toTopUpScreen(BuildContext context) async {
      final updatedAmount = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TopUpScreen(
            title: 'Top up',
            accountLogin: widget.accountLogin,
          ),
        ),
      );

      if (updatedAmount != null) {
        setState(() {
          widget.accountLogin.amountMoney = updatedAmount;
        });
      }
    }

    void toTransferScreen(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransferScreen(
            title: 'Transfer',
            accountLogin: widget.accountLogin,
          ),
        ),
      );
    }

    void toWithdrawScreen(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WithdrawScreen(
            title: 'Withdraw',
            accountLogin: widget.accountLogin,
          ),
        ),
      );
    }

    List<Transaction> transactions = [
      Transaction(
        date: DateTime.now().subtract(
          const Duration(days: 2),
        ),
        nameApartment: 'Payment for rent',
        amount: -1000.0,
      ),
      Transaction(
        date: DateTime.now().subtract(
          const Duration(days: 1),
        ),
        nameApartment: 'Grocery shopping',
        amount: -50.0,
      ),
      Transaction(
        date: DateTime.now(),
        nameApartment: 'Salary deposit',
        amount: 2000.0,
      ),

      // Thêm các giao dịch khác tại đây
    ];
    transactions.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: TitleAppBarSetting(title: widget.title, isComponent: true),
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
                            'Current balance',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '\$ ${widget.accountLogin.amountMoney}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Bank account: 0000  0000  0000  0000',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      toTopUpScreen(context);
                                    },
                                    icon: const Icon(
                                      Icons.input,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                  const Text(
                                    'Top up',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      toWithdrawScreen(context);
                                    },
                                    icon: const Icon(
                                      Icons.output,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                  const Text(
                                    'Withdraw',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      toTransferScreen(context);
                                    },
                                    icon: const Icon(
                                      Icons.transfer_within_a_station,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                  const Text(
                                    'Transfer',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.qr_code,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                  const Text(
                                    'QR',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.qr_code_2,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                  ),
                                  const Text(
                                    'Scan',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 35),
                          const Divider(
                            color: Colors.black,
                            height: 1,
                            thickness: 1,
                          ),
                          const SizedBox(height: 28),
                          const Text(
                            'Transaction history',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              Transaction transaction = transactions[index];
                              return Card(
                                color: const Color.fromARGB(255, 252, 241, 243),
                                elevation: 2,
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                child: ListTile(
                                  title: Text(transaction.nameApartment),
                                  subtitle: Text(
                                    '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                                  ),
                                  trailing: Text(
                                    '\$${transaction.amount.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: transaction.amount < 0
                                          ? Colors.red
                                          : Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 85,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          MenuBottom(accountLogin: widget.accountLogin),
        ],
      ),
    );
  }
}
