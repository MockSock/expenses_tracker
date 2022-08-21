// This widget will manage the state
// of the other two transaction files
import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transation.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
