import 'package:flutter/material.dart';

class Toolbar extends StatelessWidget {
  final void Function()? onCreate;
  final void Function()? onDebug;
  final void Function()? onDelete;
  final void Function()? onStore;
  const Toolbar({
    super.key,
    this.onCreate,
    this.onDebug,
    this.onDelete,
    this.onStore,
  });

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.w700);
    var createText = _ButtonText('CREATE', style: style);
    var children = [
      FilledButton(onPressed: onCreate, child: createText),
      const Spacer(),
      TextButton(onPressed: onDelete, child: _ButtonText('Delete')),
      const SizedBox(width: 8),
      TextButton(onPressed: onStore, child: _ButtonText('Store')),
      const SizedBox(width: 8),
      TextButton(onPressed: onDebug, child: _ButtonText('Debug')),
    ];
    return Row(children: children);
  }
}

class _ButtonText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  const _ButtonText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: style),
    );
  }
}
