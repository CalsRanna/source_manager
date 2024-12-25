import 'package:flutter/material.dart';

class SMFormItem extends StatelessWidget {
  final String label;
  final Widget child;
  const SMFormItem({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 16);
    var children = [
      Text('$label: ', style: textStyle),
      const SizedBox(width: 16),
      Expanded(child: child),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(children: children),
    );
  }
}
