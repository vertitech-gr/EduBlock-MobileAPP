import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class OutLineButtonWidget extends StatelessWidget{
  final String buttonName;
  final VoidCallback callback;
  final double fontSize;
  final double vertical;
  final double horizontal;
  final  double widthSize;
  final bool isWhite;
  final bool isDisable;
  OutLineButtonWidget({
    required this.buttonName, required this.callback,  this.fontSize = 14,  this.vertical=16.0,  this.horizontal=32.0,  this.widthSize =0.45,this.isWhite=false,this.isDisable=false
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*widthSize,
      child: OutlinedButton(onPressed:isDisable?null: callback,

        style: OutlinedButton.styleFrom(

            padding: EdgeInsets.symmetric(vertical: vertical,horizontal: horizontal),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            side: BorderSide(
              color:isWhite?Theme.of(context).primaryColor: Theme.of(context).colorScheme.secondaryContainer, // Set the border color
              width: 1.0, // Set the border width
            ),

            backgroundColor: Theme.of(context).colorScheme.primaryContainer
        ),
        child:  Text(
          buttonName,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color:isWhite?Theme.of(context).primaryColor: Theme.of(context).colorScheme.secondaryContainer, // Set the border color
          ),
        ),

      ),
    );
  }
}













