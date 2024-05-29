import 'package:flutter/material.dart';

class CustumTextButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback callback;
  final bool IsCircleIcon;
  final bool isIcon;
  final bool isWhite;
  final double fontSize;
  final bool isRed;
  final bool isFilter;
 final bool isDisable;
  CustumTextButton({
    required this.buttonName,
    required this.callback,
    this.IsCircleIcon = false,
    this.isIcon = true,
    this.isWhite = false,
    this.fontSize = 14,
    this.isRed = false, this.isFilter =false,this.isDisable=false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:isDisable ? null: callback,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            buttonName,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
                color: isRed
                    ? Theme.of(context).colorScheme.onErrorContainer
                    : isWhite
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.secondaryContainer,
                letterSpacing: 1.2),
          ),
          IsCircleIcon
              ? Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    radius: 12.0, // Adjust the radius as needed
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      // Specify the icon you want to use
                      size: 18.0, // Set the size of the icon
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                )
              : isFilter?
          Icon(
            Icons.filter_alt_outlined, // Specify the icon you want to use
            size: 16.0, // Set the size of the icon
            color: Theme.of(context).colorScheme.primary,
          )
              :    isIcon
                  ? Icon(
                      Icons
                          .keyboard_arrow_right, // Specify the icon you want to use
                      size: 16.0, // Set the size of the icon
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    )
                  : const SizedBox(),
        ],
      ),
    );
  }
}
