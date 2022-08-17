import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => TransactionListState();
}

class TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
