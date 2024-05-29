import 'package:edublock/domain/entity/recieved_request/recieved_request.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployerScreen extends StatelessWidget {
  final RecievedRequest recievedRequest;
  final VoidCallback callback;
   EmployerScreen(
      {super.key, required this.recievedRequest, required this.callback});


  Map<int, String> statusMap = {
    0: 'Pending',
    1: 'Shared',
    2: 'Rejected',
    3: 'Fulfilled',
  };



  @override
  Widget build(BuildContext context) {

    print('check recieved request create date time ${recievedRequest.createdDateTime.runtimeType}');
    // DateTime dateTime = DateTime.parse(recievedRequest.createdDateTime);
    // DateTime dateTime = DateTime.parse("2024-01-25T09:30:45.4334233Z");


    DateTime dateTime = DateTime.parse(recievedRequest.createdDateTime);


    String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(dateTime);
    // DateTime dateTime = format.parse(recievedRequest.createdDateTime);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(7.0),
        // border: Border.all(
        //     color:Theme.of(context).backgroundColor,
        //     width: 1
        // )
      ),
      child: ListTile(
        onTap:  callback,
        title: Text(
          recievedRequest.empName,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   softPixcel,
                //   style: Theme.of(context).textTheme.labelMedium?.copyWith(
                //         color: Theme.of(context).colorScheme.onPrimary,
                //       ),
                // ),
                Text(
                  '$formattedDate',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                ),

              ],
            ),
            Text(

              '${statusMap[recievedRequest.status]}',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),

          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
