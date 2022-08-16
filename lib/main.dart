import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Playground'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // This is just a prestyled container that
          // can wrap around other,more important widgets
          Card(
            color: Colors.greenAccent,
            elevation: 5,
            // Card will always take the size of its child
            // this means that you have to space it using
            // another Container widget.
            child: Container(
              width: double.infinity,
              child: Text('Chart will be here!'),
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
                        // color goes here with the rest of the decorations
                        color: Colors.greenAccent,
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
                          color: Colors.blueGrey,
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
                            tx.date.toString(),
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
