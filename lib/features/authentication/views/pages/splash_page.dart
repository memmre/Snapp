import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/features/authentication/view_models/splash_view_model.dart';
import 'package:snapp/features/main/views/components/application_icon.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SplashViewModel viewModel = ref.watch(splashProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.checkCredentials(context: context, ref: ref);
    });

    return Scaffold(
      body: Center(
        child: ApplicationIcon(),
      ),
    );
  }
}
