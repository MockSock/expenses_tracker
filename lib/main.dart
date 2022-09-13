import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        // Swatch will automatically generate
        // different shades of the color given

        // The tutorial uses accent color, which is
        // deprecated, and offers a different set of
        // coloring options, so study later
        primarySwatch: Colors.green,

        // Now use the font from pubspec.yaml
        fontFamily: 'Quicksand',
        // now anything that is a title will be themed as such
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              bodyText1: const TextStyle(
                // fill out rest later
                fontSize: 14,
              ),
            ),
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

  // getter for recent transactions
  List<Transaction> get _recentTransaction {
    // when a certain condition is fulfilled,
    // a new list is made for those specific items
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
      // makes an iterable like above to a list
    }).toList();
  }

  void _addNewTransaction(String newTractTitle, double newTractAmount) {
    final newTract = Transaction(
      // Usually you want to generate a unique
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
          // This makes it so the new transaction can be canceled out of
          // and
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),

        // We can add action buttons here,
        // and make core features easier to access
        actions: <Widget>[
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FinanceChart(_userTransactions),
          TransactionList(transactions: _userTransactions),
        ],
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
