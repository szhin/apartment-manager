import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class Apartment {
  Apartment({
    required this.title,
    required this.date,
    required this.price,
    required this.imagePath,
    required this.recommended,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final DateTime date;
  final double price;
  final String imagePath;
  final bool recommended;

  String get formattedDate {
    return formatter.format(date);
  }
}
