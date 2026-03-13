class User {
  final int? id;
  final String email;
  final String username;
  final String password;
  final String firstname;
  final String lastname;
  final String phone;
  final String city;
  final String street;
  final int? number;
  final String zipcode;

  User({
    this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.phone,
    this.city = '',
    this.street = '',
    this.number,
    this.zipcode = '',
  });

  String get fullName => '$firstname $lastname';

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'] ?? {};
    final address = json['address'] ?? {};
    return User(
      id: json['id'],
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      firstname: name['firstname'] ?? '',
      lastname: name['lastname'] ?? '',
      phone: json['phone'] ?? '',
      city: address['city'] ?? '',
      street: address['street'] ?? '',
      number: address['number'],
      zipcode: address['zipcode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'name': {'firstname': firstname, 'lastname': lastname},
      'phone': phone,
      'address': {
        'city': city,
        'street': street,
        'number': number ?? 0,
        'zipcode': zipcode,
        'geolocation': {'lat': '0', 'long': '0'},
      },
    };
  }
}
