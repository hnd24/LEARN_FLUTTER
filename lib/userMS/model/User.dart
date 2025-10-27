class User {
  int? id;
  String name;
  String email;
  String password;
  String? avatar;
  DateTime dateOfBirth;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.avatar,
    required this.dateOfBirth,
  });

  // Chuyển đối tượng thành Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
      'dateOfBirth': dateOfBirth.toIso8601String(),
    };
  }

  // Tạo đối tượng từ Map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      avatar: map['avatar'],
      dateOfBirth: DateTime.parse(map['dateOfBirth']),
    );
  }

  // Phương thức sao chép với các trường có thể thay đổi
  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? avatar,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
      dateOfBirth: dateOfBirth,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, avatar: $avatar, dateOfBirth: $dateOfBirth}';
  }
}
