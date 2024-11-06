import 'package:flutter/material.dart';
import 'package:snapp/core/constants/application_colors.dart';

extension SnackbarExtensions on BuildContext {
  void showSnackbar({
    required content,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: content,
      ),
    );
  }

  void showErrorSnackbar({required Widget content}) {
    showSnackbar(
      backgroundColor: ApplicationColors.red,
      content: content,
    );
  }

  void showInformationSnackbar({required Widget content}) {
    showSnackbar(
      backgroundColor: ApplicationColors.blue,
      content: content,
    );
  }

  void showSuccessSnackbar({required Widget content}) {
    showSnackbar(
      backgroundColor: ApplicationColors.green,
      content: content,
    );
  }
}
