import 'package:flutter/material.dart';
import 'package:snapp/core/extensions/media_query_extension.dart';

class ApplicationIcon extends StatelessWidget {
  final double? size;

  const ApplicationIcon({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    double boxSize = size ?? context.screenWidth;

    return SizedBox(
      height: boxSize,
      width: boxSize,
      child: Center(
        child: Icon(
          Icons.bubble_chart,
          size: boxSize / 2,
        ),
      ),
    );
  }
}
