import 'package:flutter/material.dart';
import 'package:source_manager/main.dart';
import 'package:toastification/toastification.dart';

class ToastUtil {
  static ToastUtil instance = ToastUtil._();

  ToastUtil._();

  void message(String message) {
    toastification.show(
      overlayState: globalKey.currentState?.overlay,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      title: Text(message),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: highModeShadow,
      closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
      closeOnClick: false,
      showIcon: false,
    );
  }

  void notification(String title, String description) {
    toastification.show(
      overlayState: globalKey.currentState?.overlay,
      type: ToastificationType.info,
      style: ToastificationStyle.flat,
      title: Text(title),
      description: Text(description),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 4),
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: lowModeShadow,
      closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
      closeOnClick: false,
      showIcon: false,
    );
  }
}
