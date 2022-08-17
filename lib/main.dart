import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 'p1',
      title: 'Apple',
      amount: 1.75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'c1',
      title: 'TankTop',
      amount: 5.25,
      date: DateTime.now(),
    ),
  ];

  // Input Work
  // Input values are always strings by default
  // late String titleController;
  // late String amountController;

  // Controllers also are very useful,
  // since they listen for input then save it
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Playground'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // This is just a prestyled container that
          // can wrap around other,more important widgets
          const Card(
            color: Colors.greenAccent,
            elevation: 5,
            // Card will always take the size of its child
            // this means that you have to space it using
            // another Container widget.
            child: SizedBox(
              width: double.infinity,
              child: Text('Chart will be here!'),
            ),
          ),

          Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                // puts button on the right
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    // the controller will now track the value for you
                    controller: titleController,
                    // onChanged: (value) => titleController = value,
                    decoration: const InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: amountController,
                    // onChanged: (value) => amountController = value,
                    decoration: const InputDecoration(labelText: 'Amount'),
                  ),

                  // Submit Button
                  TextButton(
                    onPressed: () {
                      print(titleController);
                      print(amountController);
                    },
                    child: const Text(
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                      'Add Transaction',
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Transaction List
          Column(
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
          ),
        ],
      ),
    );
  }
}
