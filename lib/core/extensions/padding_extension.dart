import 'package:flutter/material.dart';
import 'package:snapp/core/extensions/media_query_extension.dart';

extension PaddingExtension on BuildContext {
  // Paddings
  EdgeInsets get noPadding => const EdgeInsets.all(0);
  EdgeInsets get smallPadding => EdgeInsets.all(smallValue);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumValue);
  EdgeInsets get largePadding => EdgeInsets.all(largeValue);

  // Left Paddings
  EdgeInsets get leftSmallPadding => EdgeInsets.only(left: smallValue);
  EdgeInsets get leftMediumPadding => EdgeInsets.only(left: mediumValue);
  EdgeInsets get leftLargePadding => EdgeInsets.only(left: largeValue);

  // Top Paddings
  EdgeInsets get topSmallPadding => EdgeInsets.only(top: smallValue);
  EdgeInsets get topMediumPadding => EdgeInsets.only(top: mediumValue);
  EdgeInsets get topLargePadding => EdgeInsets.only(top: largeValue);

  // Right Paddings
  EdgeInsets get rightSmallPadding => EdgeInsets.only(right: smallValue);
  EdgeInsets get rightMediumPadding => EdgeInsets.only(right: mediumValue);
  EdgeInsets get rightLargePadding => EdgeInsets.only(right: largeValue);

  // Bottom Paddings
  EdgeInsets get bottomSmallPadding => EdgeInsets.only(bottom: smallValue);
  EdgeInsets get bottomMediumPadding => EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get bottomLargePadding => EdgeInsets.only(bottom: largeValue);

  // Horizontal Paddings
  EdgeInsets get horizontalSmallPadding => EdgeInsets.symmetric(
        horizontal: smallValue,
      );
  EdgeInsets get horizontalMediumPadding => EdgeInsets.symmetric(
        horizontal: mediumValue,
      );
  EdgeInsets get horizontalLargePadding => EdgeInsets.symmetric(
        horizontal: largeValue,
      );

  // Vertical Paddings
  EdgeInsets get verticalSmallPadding => EdgeInsets.symmetric(
        vertical: smallValue,
      );
  EdgeInsets get verticalMediumPadding => EdgeInsets.symmetric(
        vertical: mediumValue,
      );
  EdgeInsets get verticalLargePadding => EdgeInsets.symmetric(
        vertical: largeValue,
      );
}
