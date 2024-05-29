import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonName;
  final VoidCallback callback;
  final bool isRed;
  final double horizontal;
  final double vertical;
  final double widthSize;
  final bool isFontColorsBlack;
  final bool isDisable;

  RoundedButtonWidget({
    required this.buttonName,
    required this.callback,
    this.isRed = false,
    this.horizontal = 32.0,
    this.vertical = 16.0,
    this.widthSize = 0.45,
    this.isFontColorsBlack = false,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthSize,
      child: ElevatedButton(
        onPressed: isDisable?null :callback,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: vertical, horizontal: horizontal),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: isDisable ? 0.5 : 0,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              borderRadius:
                  BorderRadius.circular(7), // Adjust the radius as needed
            ),
            backgroundColor: isRed
                ? Theme.of(context).colorScheme.onErrorContainer
                : isDisable
                    ? Theme.of(context).colorScheme.inversePrimary
                    : Theme.of(context).colorScheme.secondaryContainer),
        child: Text(
          buttonName,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: isFontColorsBlack
                    ? Theme.of(context).colorScheme.onPrimary
                    : isDisable
                        ? Theme.of(context).colorScheme.secondaryContainer
                        : Theme.of(context).colorScheme.primary,
              ),
        ),
      ),
    );
  }
}
