import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/features/authentication/models/sign_up_model.dart';
import 'package:snapp/features/authentication/models/snapp_user.dart';
import 'package:snapp/features/authentication/services/authentication_service/firebase_authentication_service.dart';

final authenticationServiceProvider = Provider<AuthenticationService>(
  (ref) => FirebaseAuthenticationService(),
);

abstract class AuthenticationService {
  Future<SnappUser> signIn(String identifier, String password);

  Future<void> signUp(SignUpModel model);
}
