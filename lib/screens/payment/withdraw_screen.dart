import 'dart:ui';

import 'package:apartment_manager/screens/setting/components/leading_appbar_setting.dart';
import 'package:apartment_manager/screens/setting/components/title_appbar_setting.dart';
import 'package:apartment_manager/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';

import '../../../models/account.dart';
import '../../components/inkwell_text.dart';
import '../../services/database_account.dart';

class WithdrawScreen extends StatefulWidget {
  final String title;
  final Account accountLogin;
  const WithdrawScreen(
      {super.key, required this.title, required this.accountLogin});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  String selectedCurrency = 'USD';
  bool _isExceeded = false;
  final amount = TextEditingController();

  void toChangedCurrency(String newCurrency) {
    if (newCurrency != selectedCurrency) {
      setState(() {
        selectedCurrency = newCurrency;
      });
    }
  }

  Future<void> updateAccountAmount() async {
    try {
      final double newAmount =
          widget.accountLogin.amountMoney - double.parse(amount.text);
      if (newAmount >= 0) {
        await DatabaseAccount.instance
            .updateAmountMoney(widget.accountLogin.id!, newAmount);
        setState(() {
          widget.accountLogin.amountMoney = newAmount;
          amount.text = '';
        });
        Navigator.pop(context, newAmount);
      } else {
        _isExceeded = true;
        setState(() {
          amount.text = '';
        });
      }
    } catch (e) {
      print("Error updating account amount: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: TitleAppBarSetting(
            title: widget.title,
            isComponent: true,
          ),
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
          const Positioned(
            top: 10,
            bottom: 0,
            right: 0,
            left: 0,
            child: ClipRRect(
                // ... (phần trang trí khác)
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
                            'Choose cards',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                constraints:
                                    const BoxConstraints(maxHeight: 400),
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(32),
                                    child: Image.asset(
                                      'assets/images/credit_card.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 95,
                                left: 22,
                                child: Text(
                                  '****  ****  ****  1121',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 18,
                                left: 22,
                                child: Text(
                                  '\$${widget.accountLogin.amountMoney}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Amount',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _isExceeded
                              ? const Text(
                                  'Exceed the amount in your card',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                )
                              : const Text(''),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Enter amount:',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    Text(
                                      'Max \$20,000.00',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    DropdownButton<String>(
                                      value: selectedCurrency,
                                      onChanged: (newValue) {
                                        toChangedCurrency(newValue.toString());
                                      },
                                      items: ['USD', 'EUR', 'GBP', 'JPY']
                                          .map((currency) {
                                        return DropdownMenuItem<String>(
                                          value: currency,
                                          child: Text(currency),
                                        );
                                      }).toList(),
                                      underline: Container(),
                                      dropdownColor: Colors.grey[100],
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(0),
                                        height: 50,
                                        child: TextField(
                                          controller: amount,
                                          onChanged: (number) {},
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          decoration: InputDecoration(
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(14),
                                                bottom: Radius.circular(14),
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 196, 196, 196),
                                              ),
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(14),
                                                bottom: Radius.circular(14),
                                              ),
                                            ),
                                            fillColor: const Color.fromRGBO(
                                                243, 245, 247, 1),
                                            filled: true,
                                            hintText: 'Amount',
                                            hintStyle: TextStyle(
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 35),
                          InkWellText(
                            text: 'Withdraw Money',
                            margin: 0,
                            isValidEmail: true,
                            onTap: () {
                              updateAccountAmount();
                            },
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
