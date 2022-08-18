import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this.addTransaction);
  // Input Work
  // Input values are always strings by default

  // Controllers also are very useful,
  // since they listen for input then save it
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
            ),

            // Submit Button
            TextButton(
              onPressed: () {
                addTransaction();
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
    );
  }
}
