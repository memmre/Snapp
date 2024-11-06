import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final bool? value;
  final Widget? title;
  final void Function(bool?)? onChanged;

  const CustomCheckboxListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: title,
      value: value,
      onChanged: onChanged,
    );
  }
}
