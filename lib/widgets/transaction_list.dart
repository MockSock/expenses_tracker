import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // Why change to Stateless?

  // Simply put, the parent widget will rebuild this widget,
  // making this being stateful redundant and unneeded clutter
  TransactionList({Key? key, required this.transactions}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    // This automatically gives scrolling functionality
    return ListView(
      // this allows a list of objects to become
      // widgets via a function within map
      children: transactions.map((tx) {
        return Card(
          // Always think "What shoud be inside my Widget"
          // This helps plan the layout of the widgets and
          // keeps you moving in a concrete direction
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber,
                    width: 2,
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  // \ is an escape character
                  "\$${tx.amount}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.amber,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      tx.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      // Easiest way to format and return as string
                      DateFormat.yMMMd().format(tx.date),
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
