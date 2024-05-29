import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ModalBoxOutlineButton extends StatelessWidget{
  final String buttonName;
  final VoidCallback callback;
  final Color bordColor;
  final double horizontal;
  final  Color? background;
  ModalBoxOutlineButton({    required this.buttonName, required this.callback, required this.bordColor,  this.horizontal =48.0, this.background
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width*0.45,
      child: OutlinedButton(onPressed: callback,
        style: OutlinedButton.styleFrom(

            padding: EdgeInsets.symmetric(vertical: 16,horizontal: horizontal),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            side: BorderSide(
              color: bordColor, // Set the border color
              width: 1.0, // Set the border width
            ),

            backgroundColor: background ?? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.0)
        ),
        child:  Text(
          buttonName,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: bordColor,
          ),
        ),

      ),
    );
  }
}













