String tableTransactionsHistory = 'tableTransactionsHistory';

class TransactionHistoryFields {
  static String id = '_id';
  static String date = 'date';
  static String nameApartment = 'nameApartment';
  static String amount = 'amount';

  static final List<String> values = [
    id,
    date,
    nameApartment,
    amount,
  ];
}

class TransactionHistory {
  final int? id;
  final DateTime date;
  final String nameApartment;
  double amount;

  TransactionHistory({
    this.id,
    required this.date,
    required this.nameApartment,
    required this.amount,
  });

  static TransactionHistory fromJson(Map<String, Object?> json) =>
      TransactionHistory(
        id: json[TransactionHistoryFields.id] as int?,
        date: json[TransactionHistoryFields.date] as DateTime,
        nameApartment: json[TransactionHistoryFields.nameApartment] as String,
        amount: json[TransactionHistoryFields.amount] as double,
      );

  Map<String, Object?> toJson() => {
        TransactionHistoryFields.id: id,
        TransactionHistoryFields.date: date,
        TransactionHistoryFields.nameApartment: nameApartment,
        TransactionHistoryFields.amount: amount,
      };

  TransactionHistory copy({
    int? id,
    DateTime? date,
    String? nameApartment,
    double? amount,
  }) =>
      TransactionHistory(
        id: id ?? this.id,
        date: date ?? this.date,
        nameApartment: nameApartment ?? this.nameApartment,
        amount: amount ?? this.amount,
      );
}
