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
  final List<Transaction> transaction = [
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
          Card(
            color: Colors.blueGrey,
            child: Text('Transactions will go here!'),
          ),
        ],
      ),
    );
  }
}
