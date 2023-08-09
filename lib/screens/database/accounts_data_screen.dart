import 'package:apartment_manager/models/account.dart';
import 'package:apartment_manager/services/database_account.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  late List<Account> accounts;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshAccounts();
  }

  @override
  void dispose() {
    DatabaseAccount.instance.close();

    super.dispose();
  }

  Future refreshAccounts() async {
    setState(() => isLoading = true);

    accounts = await DatabaseAccount.instance.readAllAccounts();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Accounts List'),
        ),
        body: FutureBuilder<List<Account>>(
          future: DatabaseAccount.instance.readAllAccounts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Account>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<Account> accounts = snapshot.data!;

            if (accounts.isEmpty) {
              return const Center(
                child: Text('No accounts in list'),
              );
            }

            return ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(accounts[index].name),
                  subtitle: Text(accounts[index].email),
                );
              },
            );
          },
        ),
      );
}

// class AccountsDataScreen extends StatelessWidget {
//   const AccountsDataScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//       ),
//       body: Center(
//         child: FutureBuilder<List<Account>>(
//           future: DatabaseAccount.instance.readAllAccounts(),
//           builder:
//               (BuildContext context, AsyncSnapshot<List<Account>> snapshot) {
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: Text('Loading....'),
//               );
//             }
//             return snapshot.data!.isEmpty
//                 ? const Center(child: Text('No accounts in list'))
//                 : ListView(
//                     children: snapshot.data!.map((account) {
//                       return Center(
//                         child: ListTile(
//                           title: Text(account.name),
//                           textColor: Colors.red,
//                         ),
//                       );
//                     }).toList(),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
