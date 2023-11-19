import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/messages/messages.actions.dart';
import 'package:social_mobile/bloc/messages/messages.bloc.dart';
import 'package:social_mobile/bloc/messages/messages.state.dart';
import 'package:social_mobile/enums/enums.dart';
import 'package:social_mobile/model/contact.model.dart';
import 'package:social_mobile/ui/shared/error.retry.dart';

class MessagesPage extends StatelessWidget {

   Contact? contact;
   MessagesPage({super.key,this.contact});

  @override
  Widget build(BuildContext context) {
    contact = ModalRoute.of(context)?.settings.arguments as Contact?;
    context.read<MessagesBloc>().add(MessageByContactEvent(contact!));
    return Scaffold(
      appBar: AppBar(title:  Text('Messages ${contact?.name}'),),
      body: Column(
        children: [
            Container(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  CircleAvatar(child: Text('${contact?.profile}'),),
                  const SizedBox(width: 10),
                  Text('${contact?.name}')
                ],
              ),
            ),
            BlocBuilder<MessagesBloc,MessageState>(
                builder: (context,state){
                  if(state.requestState == RequestState.LOADING){
                     return  const Expanded(
                       child: Center(
                         child: CircularProgressIndicator(),
                       ),
                     );
                  }else if(state.requestState == RequestState.ERROR){
                    return ErrorRetryMessage(errorMessage: state.messageError,onAction: (){
                      context.read<MessagesBloc>().add(state.currentMessageEvent!);
                      // state.currentMessageEvent != null ? context.read<MessagesBloc>().add(state.currentMessageEvent!) : (){};
                      // print(state.requestState);
                      // print(state.currentMessageEvent);
                    });
                  }else if (state.requestState == RequestState.LOADED){
                    return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context,index)=> ListTile(
                              title: Row(
                                children: [
                                  Text('${state.messages?[index].content}')
                                ],
                              ),
                            ),
                            separatorBuilder: (context,index)=> const Divider(color: Colors.indigo,height: 2,),
                            itemCount: state.messages!.length
                        )
                    );
                  }else{
                    return const Text('');
                  }
                }
            ),
          Container(
            padding: const EdgeInsets.all(18),
            alignment: Alignment.bottomLeft,
            child: const Text('Text form',),
          )
        ],
      )
    );
  }
}