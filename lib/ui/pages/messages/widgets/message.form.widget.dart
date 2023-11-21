import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/messages/messages.actions.dart';
import 'package:social_mobile/bloc/messages/messages.bloc.dart';
import 'package:social_mobile/model/message.model.dart';

import '../../../../model/contact.model.dart';

class MessagesFormWidget extends StatelessWidget {
  Contact? contact;
  MessagesFormWidget({super.key,this.contact});
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(18),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller:textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "write message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  )
                ),
              )
          ),
          IconButton(onPressed: (){
            Message  message = Message(type: 'sent',content: textEditingController.text,contactId: contact?.id);
            context.read<MessagesBloc>().add(AddNewMessageEvent(message));

            Message  replay = Message(type: 'received',content: 'Answer to ${textEditingController.text}',contactId: contact?.id);
            context.read<MessagesBloc>().add(AddNewMessageEvent(replay));
            textEditingController.text = "";
          }, icon:const Icon(Icons.send))
        ],
      ),
    );
  }
}
