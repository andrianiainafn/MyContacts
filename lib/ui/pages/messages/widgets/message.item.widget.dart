import 'package:flutter/material.dart';
import 'package:social_mobile/model/message.model.dart';

class MessageItemWidget extends StatelessWidget {
  Message? message;
  MessageItemWidget({super.key,this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: message?.type=='sent' ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          (message?.type=='sent' )? const SizedBox(width: 100,) : const SizedBox(width: 0,),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color:  message?.type == 'sent' ? Colors.indigo : const Color.fromARGB(20, 255, 0, 0),
                borderRadius:const  BorderRadius.all(Radius.circular(10.5)),
                border: message?.type == 'sent' ? Border.all(color: Colors.indigo) : Border.all(color: Colors.red)
              ),
              // foregroundDecoration: BoxDecoration(
              //   border: message?.type == 'sent' ? Border.all(color: Colors.indigo) : Border.all(color: Colors.red)
              // ),
              child: Text('${message?.content} (${message?.date?.hour}:${message?.date?.minute})',style: message?.type=='sent' ? const TextStyle(color: Colors.white) : const TextStyle(color: Colors.red),),
            ),
          ),
          (message?.type=='sent' )? const SizedBox(width: 0,) : const SizedBox(width: 100,)
        ],
      ),
    );
  }
}
