import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transation.dart';
import './models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String newTractTitle, double newTractAmount) {
    final newTract = Transaction(
      // Ususally you want to generate a unique
      // value but the date works for now
      id: DateTime.now().toString(),
      title: newTractTitle,
      amount: newTractAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTract);
    });
  }

  // Always will need the context of where the widget should go
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        // needs its own context
        builder: (bCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Playground'),

        // We can add action buttons here,
        // and make core features easier to access
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      // this widget can only be on the Body element
      // it needs other widgets to set the height of
      // the scroll functionality, so this place is best
      body: SingleChildScrollView(
        child: Column(
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

            TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
      // Just adding it down here to help
      // visualize how the app will look
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
