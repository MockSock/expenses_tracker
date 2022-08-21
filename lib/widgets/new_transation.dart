import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // Why make this change?

  // Simply, widgets are treated differently than states
  // State information is saved and can be brought back, so
  // now when a user is clicking bewteen text fields, the
  // information within them is saved.
  NewTransaction(this.addTransaction);
  final Function addTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // Input Work
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  // This is a simple refactor to reduce redundency
  void submitData() {
    // we can now use these variables to check for values
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // Validation
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      // empty returns stop the funtion before
      // the rest of the code is ran
      return;
    }

    widget.addTransaction(enteredTitle, enteredAmount);

    // When the new transaction is made,
    // it will get rid of the form
    Navigator.of(context).pop();
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
              // needs paranthesis for when validation is there so it runs
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              // Allows the keyboard to be locked to a number pad
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              // convention states that you use an underscore
              // to use on one time variables like this parameter
              onSubmitted: (_) => submitData(),
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
