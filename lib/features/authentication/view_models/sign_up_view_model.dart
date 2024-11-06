import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/core/constants/application_strings.dart';
import 'package:snapp/core/extensions/navigator_extension.dart';
import 'package:snapp/core/extensions/snackbar_extension.dart';
import 'package:snapp/features/authentication/models/sign_up_model.dart';
import 'package:snapp/features/authentication/services/authentication_service/authentication_service.dart';
import 'package:snapp/features/authentication/services/credential_service/credential_service.dart';
import 'package:snapp/features/authentication/views/pages/sign_in_page.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignUpModel>(
  (ref) => SignUpViewModel(),
);

class SignUpViewModel extends StateNotifier<SignUpModel> {
  SignUpViewModel() : super(SignUpModel());

  void onFirstNameChanged(String? text) {
    state = state.copyWith(firstName: text?.trim());
  }

  void onLastNameChanged(String? text) {
    state = state.copyWith(lastName: text?.trim());
  }

  void onEmailAddressChanged(String? text) {
    state = state.copyWith(emailAddress: text?.trim());
  }

  void onUsernameChanged(String? text) {
    state = state.copyWith(username: text?.trim());
  }

  void onPasswordChanged(String? text) {
    state = state.copyWith(password: text?.trim());
  }

  void onConfirmationPasswordChanged(String? text) {
    state = state.copyWith(confirmationPassword: text?.trim());
  }

  void setPasswordObscurity(bool? value) {
    state = state.copyWith(obscurePassword: value);
  }

  void setConfirmationPasswordObscurity(bool? value) {
    state = state.copyWith(obscureConfirmationPassword: value);
  }

  void onSignUpButtonPressed({
    required BuildContext context,
    required GlobalKey<FormState> key,
    required WidgetRef ref,
  }) async {
    try {
      if (!(key.currentState?.validate() ?? false)) return;

      if (state.password != state.confirmationPassword) {
        context.showErrorSnackbar(
          content: Text(ApplicationStrings.passwordMismatchErrorMessage),
        );
        return;
      }

      await ref.read(authenticationServiceProvider).signUp(state);

      await ref
          .read(credentialServiceProvider)
          .saveCredentials(state.emailAddress, state.password);

      if (context.mounted) context.pushReplacement(SignInPage());
    } catch (e) {
      if (context.mounted) {
        context.showErrorSnackbar(
          content: Text(e.toString()),
        );
      }
    }
  }
}
