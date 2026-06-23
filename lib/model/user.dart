class User {
  static const collectionName = 'users';

  final String id;
  final String name;
  final String email;
  final String? image;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.image,
  });

  User copyWith({String? id, String? name, String? email, String? image}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }

  User.fromFirestore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        image: data['image'],
      );

  Map<String, dynamic> toFirestore() {
    return {'id': id, 'name': name, 'email': email, 'image': image};
  }
}
