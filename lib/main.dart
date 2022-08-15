import 'package:flutter/material.dart';

import 'package:expenses_tracker/transaction.dart';

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
  final List<Transaction> transaction = [];

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
