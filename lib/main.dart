import 'package:flutter/material.dart';

import './models/transaction_list.dart';

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
                      print(titleController.text);
                      print(amountController.text);
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
          TransactionList(),
        ],
      ),
    );
  }
}
