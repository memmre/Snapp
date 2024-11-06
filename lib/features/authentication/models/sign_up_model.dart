import 'package:flutter/material.dart';
import 'package:snapp/core/constants/application_colors.dart';

class SignUpModel {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String username;
  final String password;
  final String confirmationPassword;
  final bool obscurePassword;
  final bool obscureConfirmationPassword;

  SignUpModel({
    this.firstName = '',
    this.lastName = '',
    this.emailAddress = '',
    this.username = '',
    this.password = '',
    this.confirmationPassword = '',
    this.obscurePassword = true,
    this.obscureConfirmationPassword = true,
  });

  Color get avatarColor {
    int value = 0;
    for (int i = 0; i < firstName.length; i++) {
      value += firstName[i].codeUnitAt(0);
    }
    for (int i = 0; i < lastName.length; i++) {
      value += lastName[i].codeUnitAt(0);
    }
    int index = value % ApplicationColors.transparentColors.length;
    return ApplicationColors.transparentColors[index];
  }

  String get avatarText {
    String? first = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    String? second = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    return '$first$second';
  }

  SignUpModel copyWith({
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? username,
    String? password,
    String? confirmationPassword,
    bool? obscurePassword,
    bool? obscureConfirmationPassword,
  }) {
    return SignUpModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      emailAddress: emailAddress ?? this.emailAddress,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmationPassword: confirmationPassword ?? this.confirmationPassword,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmationPassword:
          obscureConfirmationPassword ?? this.obscureConfirmationPassword,
    );
  }
}
