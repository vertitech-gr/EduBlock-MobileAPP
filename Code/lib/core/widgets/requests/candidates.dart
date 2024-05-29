import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentOutGoingRequest extends StatelessWidget {
  final String department;
  final String graduationYear;
  final int status;
  final String lastUpdateDate;
  final VoidCallback callback;
   StudentOutGoingRequest(
      {super.key,required this.status,required this.department,required this.graduationYear,required this.lastUpdateDate,required this.callback
      });

  final List<Map<String, dynamic>> statusColors = [
    {'id': 0, 'statusName': 'Pending', 'colorHexa': '#FAAC3E'},
    {'id': 1, 'statusName': 'Pending', 'colorHexa': '#FAAC3E'},
    {'id': 2, 'statusName': 'InProgress', 'colorHexa': '#01C777'},
    {'id': 3, 'statusName': 'Cancelled', 'colorHexa': '#C71901'},
    {'id': 4, 'statusName': 'Fulfilled', 'colorHexa': '#4B63B8'}
  ];

  Color getColorByStatus(int status) {
    for (var item in statusColors) {
      if (item['id'] == status) {
        return Color(int.parse(item['colorHexa'].substring(1), radix: 16) + 0xFF000000);
      }
    }
    return Colors.grey;

  }

  @override
  Widget build(BuildContext context) {
    Color color = getColorByStatus(1);
    DateTime utcDateTime = DateTime.parse(lastUpdateDate);


    // Convert to local datetime (assuming device timezone)
    DateTime localDateTime = utcDateTime.toLocal();

    // Format the local datetime including AM/PM
    String formattedDateTime = DateFormat('hh:mm:ss a').format(localDateTime);
    return Container(
      decoration: BoxDecoration(
        color: status ==1 ?Color(0xFFFAAC3E) : status ==2 ?Color(0xFF01C777) : status ==3 ?Color(0xFFC71901) :Color(0xFF4B63B8) ,
        borderRadius: BorderRadius.circular(7.0),
        // border: Border.all(
        //     color:Theme.of(context).backgroundColor,
        //     width: 1
        // )
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        // tileColor: Theme.of(context).backgroundColor,
        contentPadding: EdgeInsets.symmetric(vertical: 8.0),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(7.0),
        //   ),


        // contentPadding: EdgeInsets.zero,
        onTap: callback,
        // title: Text(
        //   department,
        //   style: Theme.of(context).textTheme.labelLarge?.copyWith(
        //     color: Theme.of(context).colorScheme.onPrimary,
        //   ),
        // ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  department,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                // Text(
                //   graduationYear,
                //   style: Theme.of(context).textTheme.labelSmall?.copyWith(
                //     fontWeight: FontWeight.w800,
                //     color: Theme.of(context).colorScheme.onSecondary,
                //   ),
                // ),
                Text(
                  formattedDateTime,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
            Text(statusColors[status]['statusName'],
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                  fontSize: 14,
                  color: const Color(0xFFFFFFFF)),
            ),
          ],
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
