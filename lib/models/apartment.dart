import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

class ApartmentFields {
  static String id = '_id';
  static String title = 'title';
  static String date = 'date';
  static String price = 'price';
  static String imagePath = 'imagePath';
  static String recommended = 'recommended';
  static String address = 'address';
  static String description = 'description';

  static final List<String> values = [
    id,
    title,
    date,
    price,
    imagePath,
    recommended,
    address,
    description
  ];
}

class Apartment {
  final String id;
  final String title;
  final DateTime date;
  final double price;
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

  Map<String, Object?> toJson() => {
        ApartmentFields.id: id,
        ApartmentFields.title: title,
        ApartmentFields.date: date,
        ApartmentFields.price: price,
        ApartmentFields.imagePath: imagePath,
        ApartmentFields.recommended: recommended,
        ApartmentFields.address: address,
        ApartmentFields.description: description,
        // ... (các trường khác)
      };

  static Apartment fromJson(Map<String, Object?> json) => Apartment(
        title: json[ApartmentFields.title] as String,
        date: json[ApartmentFields.date] as DateTime,
        price: json[ApartmentFields.price] as double,
        imagePath: json[ApartmentFields.imagePath] as String,
        recommended: json[ApartmentFields.recommended] as bool,
        address: json[ApartmentFields.address] as String,
        description: json[ApartmentFields.description] as String,
      );
}
