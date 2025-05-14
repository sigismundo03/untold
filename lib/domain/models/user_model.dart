class UserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.password,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      password: password ?? this.password,
    );
  }
}
