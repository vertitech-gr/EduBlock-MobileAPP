import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class OutlineButtonIconWidget extends StatelessWidget{
  final String buttonName;
  final VoidCallback callback;
  OutlineButtonIconWidget({
    required this.buttonName, required this.callback
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.44,
      child: OutlinedButton(onPressed: callback,
        style: OutlinedButton.styleFrom(

            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            side: BorderSide(
              color: Theme.of(context).colorScheme.secondaryContainer, // Set the border color
              width: 1.0, // Set the border width
            ),

            backgroundColor: Theme.of(context).colorScheme.primaryContainer
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonName,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColor,
              ),
            ),
            CircleAvatar(
              backgroundColor:
              Theme.of(context).colorScheme.secondaryContainer,
              radius: 12.0, // Adjust the radius as needed
              child: Icon(
                Icons.add,
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer,
                size: 22,
              ),
            ),
          ],
        ),

      ),
    );
  }
}













