import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  void pop() {
    Navigator.of(this).pop();
  }

  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
