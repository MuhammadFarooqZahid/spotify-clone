import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  const AppButton({
    super.key,
    required this.label,
    required this.onTap,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          fixedSize: Size(width ?? double.minPositive, height ?? 65)),
      onPressed: onTap,
      child: Text(label),
    );
  }
}
