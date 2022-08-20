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
    // we can now use these variables to check for values
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // Check for data
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      // empty returns stop the funtion before the rest of the code is ran
      return;
    }

    addTransaction(enteredTitle, enteredAmount);
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
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
