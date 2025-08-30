class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String? avatar;
  final DateTime createdAt;
  final List<String> favoriteProperties;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    this.avatar,
    required this.createdAt,
    this.favoriteProperties = const [],
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'],
      avatar: map['avatar'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      favoriteProperties: List<String>.from(map['favoriteProperties'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'avatar': avatar,
      'createdAt': createdAt,
      'favoriteProperties': favoriteProperties,
    };
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? avatar,
    DateTime? createdAt,
    List<String>? favoriteProperties,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      createdAt: createdAt ?? this.createdAt,
      favoriteProperties: favoriteProperties ?? this.favoriteProperties,
    );
  }
}
