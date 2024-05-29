import 'package:flutter/material.dart';

class InstitutionalScreen extends StatelessWidget {
  final String institutionalName;
  final String date;
  final VoidCallback callback;
  const InstitutionalScreen(
      {super.key,
        required this.institutionalName,
        required this.date,
        required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(7.0),
        // border: Border.all(
        //     color:Theme.of(context).backgroundColor,
        //     width: 1
        // )
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        // tileColor: Theme.of(context).backgroundColor,
      contentPadding: EdgeInsets.zero,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(7.0),
        //   ),


      // contentPadding: EdgeInsets.zero,
        onTap: callback,
        title: Text(
          institutionalName,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        subtitle: Text(
          date,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),

        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: callback,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Theme.of(context).colorScheme.primaryContainer,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
