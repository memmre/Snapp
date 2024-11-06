import 'package:flutter/material.dart';

@immutable
class SnappUser {
  final String id;
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String username;
  final String? imageURL;
  final String? about;
  final DateTime createdAt;

  const SnappUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.username,
    required this.imageURL,
    required this.about,
    required this.createdAt,
  });

  factory SnappUser.fromMap(Map<String, dynamic> map) {
    return SnappUser(
      id: map['id'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      emailAddress: map['email_address'],
      username: map['username'],
      imageURL: map['image_url'],
      about: map['about'],
      createdAt: (map['created_at']).toDate(),
    );
  }

  SnappUser copyWith({
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? username,
    String? imageURL,
    String? about,
  }) {
    return SnappUser(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      username: username ?? this.username,
      imageURL: imageURL ?? this.imageURL,
      about: about ?? this.about,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email_address': emailAddress,
      'username': username,
      'image_url': imageURL,
      'about': about,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
