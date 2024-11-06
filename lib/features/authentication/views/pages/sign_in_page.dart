import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/core/constants/application_strings.dart';
import 'package:snapp/core/extensions/media_query_extension.dart';
import 'package:snapp/core/extensions/padding_extension.dart';
import 'package:snapp/core/utilities/text_validator.dart';
import 'package:snapp/features/authentication/models/sign_in_model.dart';
import 'package:snapp/features/authentication/view_models/sign_in_view_model.dart';
import 'package:snapp/features/authentication/views/components/navigator_button.dart';
import 'package:snapp/features/authentication/views/pages/sign_up_page.dart';
import 'package:snapp/features/main/views/components/application_icon.dart';
import 'package:snapp/features/main/views/components/checkbox_icon_button.dart';
import 'package:snapp/features/main/views/components/custom_checkbox_list_tile.dart';
import 'package:snapp/features/main/views/components/seperator.dart';

part 'package:snapp/features/authentication/views/widgets/_navigation_field.dart';
part 'package:snapp/features/authentication/views/widgets/_sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.largePadding,
        child: ListView(
          children: [
            ApplicationIcon(),
            _SignInForm(),
            Seperator(padding: context.verticalLargePadding),
            _NavigationField(),
          ],
        ),
      ),
    );
  }
}
