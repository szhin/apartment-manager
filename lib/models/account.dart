String tableAccounts = 'accounts';

class AccountFields {
  static String id = '_id';
  static String username = 'username';
  static String password = 'password';
  static String email = 'email';
  static String name = 'name';
  static String phoneNumber = 'phoneNumber';

  static final List<String> values = [
    id,
    username,
    password,
    email,
    name,
    phoneNumber,
  ];
}

class Account {
  final int? id;
  final String username;
  final String password;
  final String email;
  final String name;
  final String phoneNumber;
  final double amountMoney;

  const Account({
    this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.name,
    required this.phoneNumber,
    this.amountMoney = 0,
  });

  static Account fromJson(Map<String, Object?> json) => Account(
        id: json[AccountFields.id] as int?,
        username: json[AccountFields.username] as String,
        password: json[AccountFields.password] as String,
        email: json[AccountFields.email] as String,
        name: json[AccountFields.name] as String,
        phoneNumber: json[AccountFields.phoneNumber] as String,
        amountMoney: json['amountMoney'] as double? ?? 0,
      );

  Map<String, Object?> toJson() => {
        AccountFields.id: id,
        AccountFields.username: username,
        AccountFields.password: password,
        AccountFields.email: email,
        AccountFields.name: name,
        AccountFields.phoneNumber: phoneNumber,
        'amountMoney': amountMoney,
      };
  Account copy({
    int? id,
    String? username,
    String? password,
    String? email,
    String? name,
    String? phoneNumber,
  }) =>
      Account(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );
}
