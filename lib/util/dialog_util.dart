import 'package:flutter/material.dart';
import 'package:source_manager/main.dart';

class DialogUtil {
  static DialogUtil instance = DialogUtil._();

  DialogUtil._();

  Future<bool?> confirm(String title, String message) async {
    return showDialog<bool>(
      context: globalKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );
  }

  void show(Widget child) {
    showDialog(
      context: globalKey.currentContext!,
      builder: (context) => Dialog(child: child),
    );
  }

  void loading() {
    showDialog(
      barrierDismissible: false,
      context: globalKey.currentContext!,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  void dismiss() {
    Navigator.of(globalKey.currentContext!).pop();
  }
}
