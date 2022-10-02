import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // Why change to Stateless?

  // Simply put, the parent widget will rebuild this widget,
  // making this being stateful redundant and unneeded clutter
  TransactionList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    // This automatically gives scrolling functionality, but needs
    // a container that gives it a fixed height, otherwise it is infinite
    return SizedBox(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  style: Theme.of(context).textTheme.bodyText1,
                  'No Transactions Added Yet',
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'empty-list',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          // Still runs this builder for some reason
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                // index will now track the specific trnasaction,
                // letting flutter call for data based on the index
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
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                            // \ is an escape character
                            // This makes it fixed to two decimal points, so it looks like currency
                            "\$${transactions[index].amount.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              transactions[index].title,
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
                              DateFormat.yMMMd()
                                  .format(transactions[index].date),
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Delete button
                      IconButton(
                        icon: const Icon(Icons.delete),
                        // defaults to red but an be changed in theme
                        color: Theme.of(context).errorColor,
                        onPressed: deleteTransaction(transactions[index].id),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
