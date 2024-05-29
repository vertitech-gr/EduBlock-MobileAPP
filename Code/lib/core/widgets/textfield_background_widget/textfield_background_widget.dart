import 'package:edublock/core/widgets/svg_widget/svg_widget.dart';
import 'package:flutter/material.dart';

class TextFieldBackgroundWidget extends StatelessWidget {
  final String? labelText;
  final IconData? icon;
  final int maxLine;

  final String? hint;
  final String? errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType? inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final FocusNode? focusNode;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onChanged;
  final bool autoFocus;
  final TextInputAction? inputAction;
  final bool isSuffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final String? suffixIconType;
  final String? suffixSvgIcon;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final Color? labelTextColor;
  final Color focusBorderColor;
  final Color enableBorderColor;
  final Color textColor;
  final double fontSize;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText!.isNotEmpty ?  Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18.0),
            child: Text(
              labelText!,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: fontSize,
                color:labelTextColor ?? Theme.of(context).primaryColor,
              ),
            ),
          ):SizedBox(),
          TextFormField(
            readOnly:isReadOnly ,
            maxLines: maxLine,
            controller: textController,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            cursorColor: Theme.of(context).colorScheme.primaryContainer,
            autofocus: autoFocus,

            textInputAction: inputAction,
            obscureText: this.isObscure,
            maxLength: 60,
            keyboardType: this.inputType,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: textColor),
            decoration: InputDecoration(

              filled: true,
              fillColor:Theme.of(context).primaryColor, // Set the background color to white

              focusColor: enableBorderColor,

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              suffixIcon: isSuffixIcon
                  ? IconButton(
                  onPressed: onSuffixIconPressed,
                  icon: this.suffixIconType != null &&
                      this.suffixIconType == 'svg'
                      ? SvgWidget(
                      path: this.suffixSvgIcon as String,
                      label: this.suffixSvgIcon as String)
                      : Icon(this.suffixIcon, color: suffixIconColor))
                  : null,

              hintText: this.hint,
              hintStyle:
              Theme.of(context).textTheme.bodyLarge!.copyWith(color: hintColor),
              errorText: errorText,
              errorMaxLines: 2,
              errorStyle: const TextStyle(

                color: Colors.red,  // Change the color to your desired error text color
                fontSize: 12.0,
                // Adjust the font size as needed
                // Add other TextStyle properties as needed
              ),
              counterText: '',


              // icon: this.isIcon ? Icon(this.icon, color: iconColor) : null
            ),

          ),
        ],
      ),
    );
  }

  const TextFieldBackgroundWidget({
    Key? key,
    this.icon,
    required this.errorText,
    required this.textController,
    this.inputType,
    this.hint,
    this.isObscure = false,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
     this.isReadOnly=false,
    this.autoFocus = false,
    this.inputAction, required this.isSuffixIcon, this.onSuffixIconPressed, this.suffixIconType, this.suffixSvgIcon, this.suffixIcon, this.suffixIconColor, required this.labelText, this.labelTextColor,  required this.focusBorderColor, required this.enableBorderColor, required this.textColor,  this.fontSize=12,  this.maxLine = 1,
  }) : super(key: key);

}
