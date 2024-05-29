
import 'package:edublock/domain/entity/chat_request/request_chat.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget{

  final RequestChat requestChat;
  final String currentUserID;
  const ChatScreen({super.key,required this.requestChat, required this.currentUserID});


  @override
  Widget build(BuildContext context) {
    DateTime utcDateTime = DateTime.parse(requestChat.requestMessages.createdAt);

    // Convert to local datetime (assuming device timezone)
    DateTime localDateTime = utcDateTime.toLocal();

    // Format the local datetime including AM/PM
    String formattedDateTime = DateFormat('hh:mm:ss a').format(localDateTime);
    // String formattedDateTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(localDateTime);

    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
      child: Align(
        alignment: (requestChat.requestMessages.senderId !=currentUserID ?Alignment.topLeft:Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (requestChat.requestMessages.senderId !=currentUserID?Colors.grey.shade200:Colors.blue[200]),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(requestChat.commanUser.name, style: TextStyle(fontSize: 15),
                textAlign: TextAlign.left,
              ),
              Text(requestChat.requestMessages.description, style: TextStyle(fontSize: 15),
                textAlign: TextAlign.left,
              ),
              Text(formattedDateTime, style: TextStyle(

                  fontSize: 15),
                textAlign: TextAlign.right,
              ),

            ],
          ),
        ),
      ),
    );;
  }

}