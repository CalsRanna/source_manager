import 'package:flutter/material.dart';

class SMInput extends StatelessWidget {
  final TextEditingController controller;
  final bool disabled;
  final String? placeholder;
  const SMInput({
    super.key,
    required this.controller,
    this.disabled = false,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var primary = colorScheme.primary;
    return TextField(
      controller: controller,
      decoration: InputDecoration.collapsed(hintText: placeholder),
      enabled: !disabled,
      style: TextStyle(color: primary, fontSize: 16),
    );
  }
}
