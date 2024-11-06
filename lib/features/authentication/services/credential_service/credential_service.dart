import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/features/authentication/models/credential.dart';
import 'package:snapp/features/authentication/services/credential_service/secure_credential_service.dart';

final credentialServiceProvider = Provider<CredentialService>(
  (ref) => SecureCredentialService(),
);

abstract class CredentialService {
  Future<void> deleteCredentials();

  Future<Credential> getCredentials();

  Future<void> saveCredentials(
    String identifier,
    String password,
  );
}
