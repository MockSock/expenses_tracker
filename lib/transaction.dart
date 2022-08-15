class Transaction {
  final String id;
  final String title;
  final double amount;
  // this is non-primative data type, that comes shipped with flutter
  final DateTime date;

  // Constructor
  // Unless the value is given above, the properties will always
  // need the required tag, so that when it is called the value is given
  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
