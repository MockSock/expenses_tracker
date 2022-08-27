import 'package:flutter/material.dart';

import '../models/transaction.dart';

// This will stay stateless since it is just
// displaying data that is passed down
class FinanceChart extends StatelessWidget {
  FinanceChart(this.recentTransactions);

  final List<Transaction> recentTransactions;
  List<Map<String, Object>> get groupedTransactionValues {
    // 7 is the length that index will take from
    return List.generate(7, (index) {
      // return a map
      return {'day': 'T', 'amount': '9.99'};
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
