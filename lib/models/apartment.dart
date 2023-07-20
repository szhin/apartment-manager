import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class Apartment {
  final String id;
  final String title;
  final DateTime date;
  final String price;
  final String imagePath;
  final bool recommended;
  final String address;
  final String description;

  Apartment({
    required this.title,
    required this.date,
    required this.price,
    required this.imagePath,
    required this.recommended,
    required this.address,
    required this.description,
  }) : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}
