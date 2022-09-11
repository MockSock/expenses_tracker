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
              Container(
                // can also use Color.fromRGBO()
                // to make custom colors
                color: Colors.blueGrey,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15)),
              ),
              // This box will now be a portion of
              // its parent widget in size
              FractionallySizedBox(
                // this is so as the budget gets used up more, the box fills
                heightFactor: totalBudgetPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
