import 'package:flutter/material.dart';

class CustomDropdownMenu<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final T? value;
  final String Function(T) getLabel;
  final void Function(T?)? onChanged;
  final FocusNode? focusNode;
  final VoidCallback? onSuffixIconPressed;
   final Color dropdownColor;
   final bool isLoading;
  CustomDropdownMenu({
    required this.options,
    this.value,
    required this.getLabel,
    this.onChanged,
    this.focusNode,
    this.onSuffixIconPressed,
    required this.title, required this.dropdownColor,
    this.isLoading =false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              height: 48,
              padding: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.transparent,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<T>(
                  isExpanded: true,
                  isDense: true,
                  dropdownColor: dropdownColor,
                  iconSize: 48,
                  iconEnabledColor: Theme.of(context).colorScheme.primary,
                  iconDisabledColor: Theme.of(context).colorScheme.primary,
                  focusNode: focusNode,
                  value: value,
                  onChanged: onChanged,
                  items: options.map<DropdownMenuItem<T>>((item) {
                    return DropdownMenuItem<T>(
                      value: item,
                      child: Text(
                        getLabel(item),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.primary,
                          letterSpacing: 0.5,
                        ),
                      ),
                    );
                  }).toList(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(height: 2.2),
                ),
              ),
            ),
            if (isLoading) // Show loader if isLoading is true
              Positioned.fill(
                child: Center(
                  child: SizedBox(
                    width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2,)), // Loader widget
                ),
              ),
          ],
        ),
      ],
    );
  }
}
