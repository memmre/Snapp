import 'package:flutter/material.dart';
import 'package:snapp/core/constants/application_colors.dart';

class Seperator extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const Seperator({
    super.key,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: padding,
          child: Container(
            height: 0.25,
            color: ApplicationColors.grey,
          ),
        ),
      ],
    );
  }
}
