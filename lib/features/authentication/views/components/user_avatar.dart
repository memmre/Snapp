import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapp/core/extensions/media_query_extension.dart';
import 'package:snapp/features/authentication/models/sign_up_model.dart';
import 'package:snapp/features/authentication/view_models/sign_up_view_model.dart';

class UserAvatar extends ConsumerWidget {
  final EdgeInsetsGeometry padding;

  const UserAvatar({
    super.key,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SignUpModel model = ref.watch(signUpProvider);
    return Padding(
      padding: padding,
      child: CircleAvatar(
        backgroundColor: model.avatarColor,
        radius: context.sixthOfScreenWidth,
        child: Text(
          model.avatarText,
          style: TextStyle(fontSize: context.eighthOfScreenWidth),
        ),
      ),
    );
  }
}
