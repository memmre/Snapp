import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:snapp/features/authentication/models/credential.dart';
import 'package:snapp/features/authentication/services/credential_service/credential_service.dart';

class SecureCredentialService implements CredentialService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<void> deleteCredentials() async {
    try {
      await _storage.delete(key: 'identifier');
      await _storage.delete(key: 'password');
    } catch (e) {
      debugPrint('SecureCredentialService.deleteCredentials: $e');
      throw Exception();
    }
  }

  @override
  Future<Credential> getCredentials() async {
    try {
      final String? identifier = await _storage.read(key: 'identifier');
      final String? password = await _storage.read(key: 'password');
      return Credential(identifier: identifier!, password: password!);
    } catch (e) {
      debugPrint('SecureCredentialService.getCredentials: $e');
      throw Exception();
    }
  }

  @override
  Future<void> saveCredentials(String identifier, String password) async {
    try {
      await _storage.write(key: 'identifier', value: identifier);
      await _storage.write(key: 'password', value: password);
    } catch (e) {
      debugPrint('SecureCredentialService.saveCredentials: $e');
      throw Exception();
    }
  }
}
