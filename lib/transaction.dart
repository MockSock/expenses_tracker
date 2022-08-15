class Transaction {
  final String id;
  final String title;
  final double amount;
  // this is non-primative data type, that comes shipped with flutter
  final DateTime date;

  // Constructor
  Transaction({this.id, this.title, this.amount, this.date});
}
