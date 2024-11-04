import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  String? userUuid;
  String email;
  String username;
  String? password;
  String? role;

  Profile({
    required this.email,
    required this.password,
    this.userUuid,
    required this.username,
    required this.role,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      email: json['email'],
      password: json['password'],
      userUuid: json['userUuid'],
      username: json['username'],
      role: json['role'],
    );
  }
}
