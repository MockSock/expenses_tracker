import 'package:flutter/material.dart';

// This will stay stateless since it is just
// displaying data that is passed down
class FinanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Text('I am the chart!'),
    );
  }
}
