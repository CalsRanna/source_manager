import 'package:flutter/material.dart';
import 'package:source_manager/widget/input.dart';

class SMSelect extends StatelessWidget {
  final TextEditingController controller;
  final List<SMSelectOption> options;
  const SMSelect({super.key, required this.controller, required this.options});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: MenuAnchor(
        menuChildren: options
            .map(
              (option) => MenuItemButton(
                onPressed: () {
                  controller.text = option.value;
                },
                child: Text(option.label),
              ),
            )
            .toList(),
        builder: (_, menuController, __) {
          return GestureDetector(
            onTap: () => menuController.open(),
            child: SMInput(controller: controller, disabled: true),
          );
        },
      ),
    );
  }
}

class SMSelectOption {
  final String label;
  final String value;
  const SMSelectOption({required this.label, required this.value});
}
