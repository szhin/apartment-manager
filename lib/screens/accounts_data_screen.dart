import 'package:flutter/material.dart';
import 'package:apartment_manager/models/account.dart';
import 'package:apartment_manager/services/database_account.dart';

class AccountsDataScreen extends StatelessWidget {
  const AccountsDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account List'),
      ),
      body: FutureBuilder<List<Account>>(
        future: DatabaseAccount.instance.readAllAccounts(),
        builder: (BuildContext context, AsyncSnapshot<List<Account>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No accounts available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AccountsDataScreen(),
  ));
}
