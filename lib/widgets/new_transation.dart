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

  // This is a simple refactor to reduce redundency
  void submitData() {
    addTransaction(
      titleController.text,
      double.parse(amountController.text),
    );
  }

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
              onSubmitted: (_) => submitData,
            ),
            TextField(
              // Allows the keyboard to be locked to a number pad
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              // convention states that you use an underscore
              // to use on one time variables like this parameter
              onSubmitted: (_) => submitData,
            ),

            // Submit Button
            TextButton(
              onPressed: () => submitData(),
              child: Text(
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
