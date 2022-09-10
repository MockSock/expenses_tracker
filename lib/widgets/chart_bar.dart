import 'dart:html';

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double totalBudgetPercent;

  ChartBar(this.label, this.spendingAmount, this.totalBudgetPercent);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Say spending total for day with no decimals
        Text('\$${spendingAmount.toStringAsFixed(0)}'),
        // For spacing
        const SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
