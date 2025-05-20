import '../../data/model/user_response_model.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? password;
  final String? firebaseUID;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.password,
    this.firebaseUID,
    
  });

  factory UserModel.fromJsonUserResponse(UserResponseModel user) {
    return UserModel(
      id: user.id ?? 0,
      name: user.username ?? '',
      email: user.email ?? '',
      photoUrl: user.profilePicture ??
          'https://cdn.pixabay.com/photo/2016/11/29/13/14/attractive-1869761_960_720.jpg',
      firebaseUID: user.firebaseUID ?? '',
    

    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      photoUrl: json['photoUrl'] ??
          'https://cdn.pixabay.com/photo/2016/11/29/13/14/attractive-1869761_960_720.jpg',
      firebaseUID: json['firebaseUID'] ?? '',
      
      
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
        'firebaseUID': firebaseUID,
        
      };

  UserModel copyWith({
    int? id,
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
