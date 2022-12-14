import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  // This is to store chosen dates for different transactions
  DateTime? _chosenDate;

  // This is a simple refactor to reduce redundency
  void submitData() {
    // we can now use these variables to check for values
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    // Validation
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _chosenDate == null) {
      // empty returns stop the funtion before
      // the rest of the code is ran
      return;
    }

    widget.addTransaction(enteredTitle, enteredAmount, _chosenDate);

    // When the new transaction is made,
    // it will get rid of the form
    Navigator.of(context).pop();
  }

  void datePicker() {
    // This will show an overlay that
    // allows the date to be picked
    showDatePicker(
      context: context,
      // Need a start point for user to manipulate
      initialDate: DateTime.now(),
      // just giving a dummy older date
      // this is january 1st 2019
      firstDate: DateTime(2019),
      // last day should always be the current day
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // Since this is a future, we have a loading message
      // Now we can verify data being changed and processes finishing
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _chosenDate = pickedDate;
      });
    });

    print('Loading Date');
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
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              // needs paranthesis for when validation is there so it runs
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              // Allows the keyboard to be locked to a number pad
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              // convention states that you use an underscore
              // to use on one time variables like this parameter
              onSubmitted: (_) => submitData(),
            ),

            // Date Picker Button
            // Will take up as much
            // space as possible
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    _chosenDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_chosenDate!)}',
                  ),
                  TextButton(
                    onPressed: datePicker,
                    child: const Text(
                      'Pick a Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),

            // Submit Button
            ElevatedButton(
              onPressed: submitData,
              child: const Text(
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
