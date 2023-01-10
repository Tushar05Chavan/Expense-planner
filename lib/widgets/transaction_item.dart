import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactions,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${transactions.amount}')),
          ),
        ),
        title: Text(
          transactions.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle:
            Text(DateFormat.yMMMd().format(transactions.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? ElevatedButton.icon(
                onPressed: () => deleteTx(transactions.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text(
                  'Delete',
                  style:
                      TextStyle(color: Theme.of(context).errorColor),
                ))
            : IconButton(
                onPressed: () => deleteTx(transactions.id),
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor),
      ),
    );
  }
}