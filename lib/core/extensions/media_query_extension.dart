import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;
  double get halfScreenWidth => screenWidth / 2;
  double get thirdOfScreenWidth => screenWidth / 3;
  double get fourthOfScreenWidth => screenWidth / 4;
  double get fifthOfScreenWidth => screenWidth / 5;
  double get sixthOfScreenWidth => screenWidth / 6;
  double get seventhOfScreenWidth => screenWidth / 7;
  double get eighthOfScreenWidth => screenWidth / 8;
  double get ninthOfScreenWidth => screenWidth / 9;
  double get tenthOfScreenWidth => screenWidth / 10;

  double get screenHeight => mediaQuery.size.height;
  double get halfScreenHeight => screenHeight / 2;
  double get thirdOfScreenHeight => screenHeight / 3;
  double get fourthOfScreenHeight => screenHeight / 4;
  double get fifthOfScreenHeight => screenHeight / 5;
  double get sixthOfScreenHeight => screenHeight / 6;
  double get seventhOfScreenHeight => screenHeight / 7;
  double get eighthOfScreenHeight => screenHeight / 8;
  double get ninthOfScreenHeight => screenHeight / 9;
  double get tenthOfScreenHeight => screenHeight / 10;

  double get smallValue => screenWidth * 0.01;
  double get mediumValue => screenWidth * 0.02;
  double get largeValue => screenWidth * 0.04;
}

