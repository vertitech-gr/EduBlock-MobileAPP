import 'package:edublock/utils/custom_flusbar/custom_flushbar.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final BuildContext context;
  final String type;
  final String title;
  final String message;

  NotificationWidget({
    required this.context,
    required this.type,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    print('check message are ${message}');
    if (message.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          customFlushBar(
            context: context,
            title: title,
            message: message,
            type: type,
          );
        }
      });
    }
    return SizedBox.shrink();
  }
}
