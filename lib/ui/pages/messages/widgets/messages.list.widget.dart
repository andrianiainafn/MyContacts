import 'package:flutter/material.dart';

import '../../../../model/message.model.dart';
class MessagesListWidget extends StatelessWidget {
  List<Message>? messages;
  MessagesListWidget({super.key,this.messages});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context,index)=> ListTile(
              title: Row(
                children: [
                  Text('${messages?[index].content}')
                ],
              ),
            ),
            separatorBuilder: (context,index)=> const Divider(color: Colors.indigo,height: 2,),
            itemCount: messages!.length
        )
    );
  }
}
