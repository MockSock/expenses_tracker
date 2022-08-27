import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

// This will stay stateless since it is just
// displaying data that is passed down
class FinanceChart extends StatelessWidget {
  FinanceChart(this.recentTransactions);

  // get the last seven days so it can be displayed
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get groupedTransactionValues {
    // 7 is the length that index will take from
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        // will now display based on the seven days
        // if index = 1 then that would be yesterday
        Duration(days: index),
      );

      double totalSum;

      // i stands for Iteration
      for (var i = 0; i < recentTransactions.length; i++) {}
      // return a map
      // the E special constructor gives a shortcut for weekday
      return {'day': DateFormat.E(weekday), 'amount': '9.99'};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
