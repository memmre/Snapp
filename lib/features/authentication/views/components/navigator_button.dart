import 'package:flutter/material.dart';
import 'package:snapp/core/extensions/navigator_extension.dart';

class NavigatorButton extends StatelessWidget {
  final Widget? icon;
  final Widget? title;
  final Widget page;

  const NavigatorButton({
    super.key,
    required this.icon,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: icon,
      subtitle: Center(child: title),
      onTap: () => context.push(page),
    );
  }
}
