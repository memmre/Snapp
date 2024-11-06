import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/core/extensions/navigator_extension.dart';
import 'package:snapp/core/extensions/snackbar_extension.dart';
import 'package:snapp/features/authentication/models/sign_in_model.dart';
import 'package:snapp/features/authentication/models/snapp_user.dart';
import 'package:snapp/features/authentication/services/authentication_service/authentication_service.dart';
import 'package:snapp/features/authentication/services/credential_service/credential_service.dart';
import 'package:snapp/features/authentication/view_models/session_view_model.dart';
import 'package:snapp/features/feed/views/pages/feed_page.dart';

final signInProvider = StateNotifierProvider<SignInViewModel, SignInModel>(
  (ref) => SignInViewModel(),
);

class SignInViewModel extends StateNotifier<SignInModel> {
  SignInViewModel() : super(SignInModel());

  void onIdentifierChanged(String? text) {
    state = state.copyWith(identifier: text?.trim());
  }

  void onPasswordChanged(String? text) {
    state = state.copyWith(password: text?.trim());
  }

  void setPasswordObscurity(bool? value) {
    state = state.copyWith(obscurePassword: value);
  }

  void setSaveSession(bool? value) {
    state = state.copyWith(saveSession: value);
  }

  void onSignInButtonPressed({
    required BuildContext context,
    required GlobalKey<FormState> key,
    required WidgetRef ref,
  }) async {
    try {
      if (!(key.currentState?.validate() ?? false)) return;

      SnappUser user = await ref
          .read(authenticationServiceProvider)
          .signIn(state.identifier, state.password);

      if (state.saveSession) {
        await ref
            .read(credentialServiceProvider)
            .saveCredentials(state.identifier, state.password);
      }

      ref.read(sessionProvider.notifier).setCurrentUser(user);

      if (context.mounted) context.pushReplacement(FeedPage());
    } catch (e) {
      if (context.mounted) {
        context.showErrorSnackbar(
          content: Text(e.toString()),
        );
      }
    }
  }
}
