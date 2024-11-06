import 'package:flutter/material.dart';

class CheckboxIconButton extends StatelessWidget {
  final bool? value;
  final Widget activeIcon;
  final Widget inactiveIcon;
  final void Function(bool?)? onChanged;

  const CheckboxIconButton({
    super.key,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: value ?? false ? activeIcon : inactiveIcon,
      onPressed: () {
        if (onChanged != null) onChanged!(!(value ?? false));
      },
    );
  }
}
