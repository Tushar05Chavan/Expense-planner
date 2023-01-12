import 'dart:io';

import 'package:expense_planner/widgets/adaptive_flatbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx) {
    print('Constructor new transaction widget');
  }
  final Function addTx;

  @override
  State<NewTransaction> createState() {
    print('Creates new transaction widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _NewTransactionState(){
    print('Constructor new transaction');
  }

  @override
  void initState(){
    print('initstate()');
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  onSubmitted: (_) => _submitData,
                  // onChanged: (value) {
                  //   titleInput= value;
                  // },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData,
                  // onChanged: (value) {
                  //   amountInput= value;

                  // },
                ),
                Container(
                  height: 70,
                  child: Row(children: [
                    Expanded(
                        child: Text(_selectedDate == null
                            ? 'No Date Chosen'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}  ')),
                    AdaptiveFlatButton(_presentDatePicker, 'Choose Date')
                  ]),
                ),
                ElevatedButton(
                  onPressed: (() {
                    _submitData(); // print(amountInput);
                  }),
                  child: Text(
                    'Add Transaction',
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
