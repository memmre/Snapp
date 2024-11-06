import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/core/constants/application_strings.dart';
import 'package:snapp/core/extensions/media_query_extension.dart';
import 'package:snapp/core/extensions/padding_extension.dart';
import 'package:snapp/core/utilities/text_validator.dart';
import 'package:snapp/features/authentication/models/sign_up_model.dart';
import 'package:snapp/features/authentication/view_models/sign_up_view_model.dart';
import 'package:snapp/features/authentication/views/components/user_avatar.dart';
import 'package:snapp/features/main/views/components/checkbox_icon_button.dart';

part 'package:snapp/features/authentication/views/widgets/_sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApplicationStrings.createAccount),
      ),
      body: Padding(
        padding: context.horizontalLargePadding,
        child: ListView(
          children: [
            UserAvatar(padding: context.largePadding),
            _SignUpForm(),
          ],
        ),
      ),
    );
  }
}
