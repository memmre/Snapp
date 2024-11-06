import 'package:snapp/core/extensions/navigator_extension.dart';
import 'package:snapp/features/authentication/models/credential.dart';
import 'package:snapp/features/authentication/models/snapp_user.dart';
import 'package:snapp/features/authentication/services/authentication_service/authentication_service.dart';
import 'package:snapp/features/authentication/services/credential_service/credential_service.dart';
import 'package:snapp/features/authentication/view_models/session_view_model.dart';
import 'package:snapp/features/authentication/views/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/features/feed/views/pages/feed_page.dart';

final splashProvider = Provider<SplashViewModel>(
  (ref) => SplashViewModel(
    authenticationService: ref.watch(authenticationServiceProvider),
    credentialService: ref.watch(credentialServiceProvider),
  ),
);

class SplashViewModel {
  final AuthenticationService authenticationService;
  final CredentialService credentialService;

  SplashViewModel({
    required this.authenticationService,
    required this.credentialService,
  });

  Future<void> checkCredentials({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    try {
      final Credential credential = await credentialService.getCredentials();

      SnappUser user = await authenticationService.signIn(
        credential.identifier,
        credential.password,
      );

      ref.watch(sessionProvider.notifier).setCurrentUser(user);

      if (context.mounted) {
        context.pushReplacement(const FeedPage());
      }
    } catch (e) {
      if (context.mounted) {
        context.pushReplacement(const SignInPage());
      }
    }
  }
}
