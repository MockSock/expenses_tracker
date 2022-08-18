// This widget will manage the state
// of the other two transaction files
import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transation.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'p1',
      title: 'Apple',
      amount: 1.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'c1',
      title: 'TankTop',
      amount: 5.25,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String newTractTitle, double newTractAmount) {
    final newTract = Transaction(
      // Ususally you want to generate a unique
      // value but the date works for now
      id: DateTime.now().toString(),
      title: newTractTitle,
      amount: newTractAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTract);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // New Transaction Area
        NewTransaction(_addNewTransaction),

        // Transaction List
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}
