import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Playground'),

        // We can add action buttons here,
        // and make core features easier to access
        actions: <Widget>[
          IconButton(
            onPressed: () {},
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

            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
