import 'package:flutter/material.dart';

// This will stay stateless since it is just
// displaying data that is passed down
class FinanceChart extends StatelessWidget {
  // Method to geenerate spending bars
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
