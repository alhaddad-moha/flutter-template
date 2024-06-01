import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';

abstract class ToastUtil {
  static void showSuccess({required String message, required BuildContext context}) {
    CherryToast.success(
      title: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ).show(context);
  }

  static void showError({required String message, required BuildContext context}) {
    CherryToast.error(

      title: Text(
        message,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      actionHandler: () {
        // print("Action button pressed");
      },
    ).show(context);
  }

  static void showInfo({required String message, required BuildContext context}) {
    CherryToast.info(
      title: Text(message, style: const TextStyle(color: Colors.black)),
      actionHandler: () {},
    ).show(context);
  }
}
