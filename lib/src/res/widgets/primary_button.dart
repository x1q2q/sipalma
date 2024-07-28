import 'package:flutter/material.dart';
import 'package:sipalma/src/utils/extensions.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.isLoading = false,
      this.onPressed,
      this.label,
      this.icon,
      this.btnStyle});
  final Widget? label;
  final Widget? icon;
  final bool isLoading;
  final ButtonStyle? btnStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: isLoading
          ? const CircularProgressIndicator(color: Colors.white).addPd(all: 10)
          : label!,
      icon: isLoading ? const Text('loading ') : icon!,
      style: btnStyle,
      onPressed: onPressed,
    );
  }
}
