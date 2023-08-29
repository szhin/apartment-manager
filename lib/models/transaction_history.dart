String tableTransactionsHistory = 'tableTransactionsHistory';

class TransactionHistoryFields {
  static String id = '_id';
  static String date = 'date';
  static String nameApartment = 'nameApartment';
  static String amount = 'amount';
  static String type = 'type';
  static String username = 'username';

  static final List<String> values = [
    id,
    date,
    nameApartment,
    amount,
    type,
    username,
  ];
}

class TransactionHistory {
  final int? id;
  final DateTime date;
  final String nameApartment;
  double amount;
  final String type;
  final String username;

  TransactionHistory({
    this.id,
    DateTime? date,
    required this.nameApartment,
    required this.amount,
    required this.type,
    required this.username,
  }) : date = date ?? DateTime.now();

  static TransactionHistory fromJson(Map<String, Object?> json) =>
      TransactionHistory(
        id: json[TransactionHistoryFields.id] as int?,
        date: DateTime.parse(json[TransactionHistoryFields.date] as String),
        nameApartment: json[TransactionHistoryFields.nameApartment] as String,
        amount: json[TransactionHistoryFields.amount] as double,
        type: json[TransactionHistoryFields.type] as String,
        username: json[TransactionHistoryFields.username] as String,
      );

  Map<String, Object?> toJson() => {
        TransactionHistoryFields.id: id,
        TransactionHistoryFields.date: date.toIso8601String(),
        TransactionHistoryFields.nameApartment: nameApartment,
        TransactionHistoryFields.amount: amount,
        TransactionHistoryFields.type: type,
        TransactionHistoryFields.username: username,
      };

  TransactionHistory copy({
    int? id,
    DateTime? date,
    String? nameApartment,
    double? amount,
    String? type,
    String? username,
  }) =>
      TransactionHistory(
        id: id ?? this.id,
        date: date ?? this.date,
        nameApartment: nameApartment ?? this.nameApartment,
        amount: amount ?? this.amount,
        type: type ?? this.type,
        username: username ?? this.username,
      );
}
