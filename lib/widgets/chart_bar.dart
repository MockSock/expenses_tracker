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
          // allows for widgets to stack on top of
          // each other creating a three dimentional space
          child: Stack(
            children: <Widget>[
              // Bottom to top
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}