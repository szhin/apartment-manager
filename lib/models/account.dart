String tableAccounts = 'tableAccounts';

class AccountFields {
  static String id = '_id';
  static String username = 'username';
  static String password = 'password';
  static String email = 'email';
  static String name = 'name';
  static String phoneNumber = 'phoneNumber';
  static String amountMoney = 'amountMoney';
  // static String bookedApartments = 'bookedApartments';

  static final List<String> values = [
    id,
    username,
    password,
    email,
    name,
    phoneNumber,
    amountMoney
    // bookedApartments
  ];
}

class Account {
  final int? id;
  final String username;
  final String password;
  final String email;
  final String name;
  final String phoneNumber;
  double amountMoney;
  // final List<Apartment>? bookedApartments;

  Account({
    this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.name,
    required this.phoneNumber,
    required this.amountMoney,
    // this.bookedApartments,
  });

  static Account fromJson(Map<String, Object?> json) => Account(
        id: json[AccountFields.id] as int?,
        username: json[AccountFields.username] as String,
        password: json[AccountFields.password] as String,
        email: json[AccountFields.email] as String,
        name: json[AccountFields.name] as String,
        phoneNumber: json[AccountFields.phoneNumber] as String,
        amountMoney: json[AccountFields.amountMoney] as double,
        // bookedApartments: (json[AccountFields.bookedApartments] as List?)
        //     ?.map((apartmentJson) =>
        //         Apartment.fromJson(apartmentJson as Map<String, Object?>))
        //     .toList(),
      );

  Map<String, Object?> toJson() => {
        AccountFields.id: id,
        AccountFields.username: username,
        AccountFields.password: password,
        AccountFields.email: email,
        AccountFields.name: name,
        AccountFields.phoneNumber: phoneNumber,
        AccountFields.amountMoney: amountMoney,
        // AccountFields.bookedApartments:
        //     bookedApartments?.map((apartment) => apartment.toJson()).toList(),
      };
  Account copy({
    int? id,
    String? username,
    String? password,
    String? email,
    String? name,
    String? phoneNumber,
    double? amountMoney,
    // List<Apartment>? bookedApartments,
  }) =>
      Account(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        amountMoney: amountMoney ?? this.amountMoney,
        // bookedApartments: bookedApartments ?? this.bookedApartments,
      );

  // Account addBookedApartment(Apartment apartment) {
  //   List<Apartment> updatedBookedApartments =
  //       List.from(bookedApartments as Iterable);
  //   updatedBookedApartments.add(apartment);

  //   return copy(bookedApartments: updatedBookedApartments);
  // }
}
