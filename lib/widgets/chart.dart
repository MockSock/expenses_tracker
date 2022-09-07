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
      final weekDay = DateTime.now().subtract(
        // will now display based on the seven days
        // if index = 1 then that would be yesterday
        Duration(days: index),
      );

      double totalSum = 0.0;

      // i stands for Iterationan and this was the approach used because it is language agnostic
      for (var i = 0; i < recentTransactions.length; i++) {
        // This now breaks down the timestamps by the day, month, and year
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          // This takes the amount value and adds it to the current sum for the bar
          totalSum += recentTransactions[i].amount;
        }
      }
      // return a map
      // the E special constructor gives a shortcut for weekday
      return {'day': DateFormat.E(weekDay).format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        // now show values that were derived
        children: groupedTransactionValues.map((data) {
          return Text(
            '${data['day']}: ${data['amount']}',
          );
        }).toList(),
      ),
    );
  }
}
