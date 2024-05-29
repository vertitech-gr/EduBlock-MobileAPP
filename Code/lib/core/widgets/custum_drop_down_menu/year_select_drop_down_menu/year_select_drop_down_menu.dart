import 'package:edublock/core/widgets/buttons/outline_button/outline_button.dart';
import 'package:edublock/core/widgets/buttons/rounded_button/rounded_button.dart';
import 'package:edublock/core/widgets/certificate_container_checkbox/certificate_container_checkbox.dart';
import 'package:edublock/core/widgets/primary_layout/primary_layout_widget.dart';
import 'package:edublock/domain/entity/university/university.dart';
import 'package:edublock/domain/entity/university/university_lists.dart';
import 'package:flutter/material.dart';

class DropdownItem {
  final String value;
  final String viewValue;

  const DropdownItem(this.value, this.viewValue);
}



class YearSelectDropDownMenu extends StatelessWidget {



  final String title;
  final List<String> options;
  final String? value;
  final String Function(String) getLabel;
  final void Function(String?)? onChanged;
  final FocusNode? user_focusNode;
  final VoidCallback? onSuffixIconPressed;



  YearSelectDropDownMenu({required this.options, this.value, required this.getLabel, this.onChanged, this.user_focusNode, this.onSuffixIconPressed, required this.title});



  @override

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 0.5
            ),

          ),
        ),
        Container(
          height:48 ,
          // margin: EdgeInsets.symmetric(horizontal: 16.0),
          padding: EdgeInsets.only(left: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).primaryColor,

          ),
          child:DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              isDense: true,


              dropdownColor: Theme.of(context).primaryColor,
              iconSize: 48,
              iconEnabledColor: Theme.of(context).colorScheme.onPrimary,

              // focusNode: ,
              focusNode: user_focusNode, // Assign the appropriate focus node
              value: value,
              onChanged: onChanged,
              items: options.map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem<String>(

                  value: item,
                  child: Text(getLabel(item),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onPrimary,
                        letterSpacing: 0.5
                    ),
                  ),
                );
              }).toList(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(height: 2.2),
            ),
          ),

        ),
      ],
    );
  }


}
