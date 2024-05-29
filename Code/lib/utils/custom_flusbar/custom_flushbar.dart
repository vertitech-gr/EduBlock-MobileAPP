import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void customFlushBar(
    {required BuildContext context,
    required String type,
    required String title,
    required String message}) {
  Flushbar(
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      backgroundColor: Theme.of(context).backgroundColor,
      boxShadows: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 5),
            blurRadius: 15,
            spreadRadius: 0),
      ],
      // 0 25px 50px -12px rgb(0 0 0 / 0.25);
      // 0 20px 25px -5px rgb(0 0 0 / 0.1)
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.decelerate,
      title: title,
      titleColor: type == 'info'
          ? Color.fromRGBO(1, 158, 247, 1)
          : type == 'warn'
              ? Color.fromRGBO(255, 199, 0, 1)
              : Color.fromRGBO(241, 65, 108, 1),
      message: message,
      messageSize: 17,
      messageColor: type == 'info'
          ? Color.fromRGBO(1, 158, 247, 1)
          : type == 'warn'
              ? Color.fromRGBO(255, 199, 0, 1)
              : type == 'success'
                  ? Theme.of(context).primaryColor
                  : Color.fromRGBO(241, 65, 108, 1),
      borderRadius: BorderRadius.circular(4),
      icon: Icon(
        type == 'info'
            ? Icons.info
            : type == 'warn'
                ? Icons.warning
                : type == 'success'
                    ? Icons.check_circle
                    : Icons.error,
        color: type == 'info'
            ? Color.fromRGBO(1, 158, 247, 1)
            : type == 'warn'
                ? Color.fromRGBO(255, 199, 0, 1)
                : type == 'success'
                    ? Theme.of(context).primaryColor
                    : Color.fromRGBO(241, 65, 108, 1),
      ))
    ..show(context);
}

// Color.fromRGBO(241, 65, 108, 1)
SizedBox showNotification(
    BuildContext context, String type, String title, String message) {
  if (message.isNotEmpty) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        customFlushBar(
            context: context, title: title, message: message, type: type);
      }
    });
  }
  return SizedBox.shrink();
}
