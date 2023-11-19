import 'package:flutter/material.dart';
import 'package:social_mobile/ui/pages/messages/widgets/message.item.widget.dart';

import '../../../../model/message.model.dart';


class MessagesListWidget extends StatelessWidget {
  List<Message>? messages;
  MessagesListWidget({super.key,this.messages});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(scrollController.hasClients){
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      }
    });
    return Expanded(
        child: ListView.separated(
          controller: scrollController,
            itemBuilder: (context,index)=> MessageItemWidget(message: messages?[index],),
            separatorBuilder: (context,index)=> const Divider(color: Colors.indigo,height: 2,),
            itemCount: messages!.length
        )
    );
  }
}