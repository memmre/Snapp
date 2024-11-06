import 'package:flutter/foundation.dart';

@immutable
class Credential {
  final String identifier;
  final String password;

  const Credential({
    required this.identifier,
    required this.password,
  });

  Credential copyWith({
    String? identifier,
    String? password,
  }) {
    return Credential(
      identifier: identifier ?? this.identifier,
      password: password ?? this.password,
    );
  }
}
