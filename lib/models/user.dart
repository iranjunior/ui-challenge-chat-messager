import 'dart:convert';

import 'package:chat_messager/models/models.dart';

class UserModel {
  String name;
  String image;
  DateTime lastLogin;

  UserModel({
    required this.name,
    required this.image,
    required this.lastLogin,
  });

  factory UserModel.me() {
    return UserModel(
      name: 'Iran Junior',
      image: 'assets/profile',
      lastLogin: DateTime.now(),
    );
  }

  UserModel copyWith({
    String? name,
    String? image,
    DateTime? lastLogin,
  }) {
    return UserModel(
      name: name ?? this.name,
      image: image ?? this.image,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'lastLogin': lastLogin.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      image: map['image'],
      lastLogin: DateTime.fromMillisecondsSinceEpoch(map['lastLogin']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserModel(name: $name, image: $image, lastLogin: $lastLogin)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.image == image &&
        other.lastLogin == lastLogin;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ lastLogin.hashCode;
}
