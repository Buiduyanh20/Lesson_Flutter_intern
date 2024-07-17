import 'package:flutter/foundation.dart';

class Friend {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? image;

  Friend({this.id, this.email, this.firstName, this.lastName, this.image});

  // Chuyển đổi từ JSON sang đối tượng Dart
  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      image: json['avatar'],
    );
  }

  // Chuyển đổi từ đối tượng Dart sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': image,
    };
  }
}
