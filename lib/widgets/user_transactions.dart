import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../Model/transaction.dart';
import 'new-transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       // NewTransaction(_addNewTransaction),
        //TransactionList(_userTransactions),
      ],
    );
  }
}
