import 'package:flutter/material.dart';
import 'package:snapp/core/constants/application_strings.dart';

@immutable
class CustomException implements Exception {
  final String code;
  final String message;

  const CustomException({
    required this.code,
    required this.message,
  });

  @override
  String toString() => message;
}

class Exceptions {
  static CustomException networkError = CustomException(
    code: 'network-error',
    message: ApplicationStrings.networkErrorMessage,
  );
  static CustomException unknownError = CustomException(
    code: 'unknown-error',
    message: ApplicationStrings.unknownErrorMessage,
  );

  // Authentication Service Exceptions
  static CustomException emailAddressInUseError = CustomException(
    code: 'email-address-in-use',
    message: ApplicationStrings.emailAddressInUseErrorMessage,
  );
  static CustomException invalidCredentialError = CustomException(
    code: 'invalid-credential',
    message: ApplicationStrings.invalidCredentialErrorMessage,
  );
  static CustomException usernameInUseError = CustomException(
    code: 'username-in-use',
    message: ApplicationStrings.usernameInUseErrorMessage,
  );

  // Credential Service Exceptions
  static CustomException deleteCredentialError = CustomException(
    code: 'delete-credential-error',
    message: ApplicationStrings.deleteCredentialErrorMessage,
  );
  static CustomException getCredentialError = CustomException(
    code: 'get-credential-error',
    message: ApplicationStrings.getCredentialErrorMessage,
  );
  static CustomException saveCredentialError = CustomException(
    code: 'save-credential-error',
    message: ApplicationStrings.saveCredentialErrorMessage,
  );
}
