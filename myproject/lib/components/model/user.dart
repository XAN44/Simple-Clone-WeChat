class User {
  final int id;
  final String name;
  final String avatar;

  User({required this.id, required this.name, required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], avatar: json['avatar']);
  }
}
