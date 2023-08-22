import 'package:apartment_manager/models/transaction_history.dart';
import 'package:apartment_manager/services/database_transaction_history.dart';
import 'package:flutter/material.dart';

class TransactionsDataScreen extends StatefulWidget {
  const TransactionsDataScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransactionDataPageState createState() => _TransactionDataPageState();
}

class _TransactionDataPageState extends State<TransactionsDataScreen> {
  late List<TransactionHistory> transactionHistory;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshAccounts();
  }

  @override
  void dispose() {
    DatabaseTransactionHistory.instance.close();
    super.dispose();
  }

  Future refreshAccounts() async {
    setState(() => isLoading = true);

    transactionHistory =
        await DatabaseTransactionHistory.instance.readAllTransactionHistorys();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Transactions List'),
        ),
        body: FutureBuilder<List<TransactionHistory>>(
          future:
              DatabaseTransactionHistory.instance.readAllTransactionHistorys(),
          builder: (BuildContext context,
              AsyncSnapshot<List<TransactionHistory>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<TransactionHistory> transactionsHistory = snapshot.data!;

            if (transactionsHistory.isEmpty) {
              return const Center(
                child: Text('No transaction in list'),
              );
            }

            return ListView.builder(
              itemCount: transactionsHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(transactionsHistory[index].type),
                  subtitle: Row(
                    children: [
                      Text(transactionsHistory[index].date.toString()),
                      Text(transactionsHistory[index].amount.toString())
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
}
