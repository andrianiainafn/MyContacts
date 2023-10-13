import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts.bloc.dart';
import 'package:social_mobile/ui/pages/contacts/widgets/contacts.bar.button.dart';

import '../../../bloc/contacts.actions.dart';
import '../../../bloc/contacts.state.dart';
import '../../../enums/enums.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts'),),
      body: Column(
        children: [
          const ContactsButton(),
          BlocBuilder<ContactsBloc,ContactsState>(
            builder:(context,state){
              if(state.requestState == RequestState.LOADING){
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }else if(state.requestState == RequestState.ERROR){
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${state.errorMessage}'),
                      ElevatedButton(
                            onPressed: (){
                              context.read<ContactsBloc>().add(state.currentEvent);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                            child: const Text("Retry"))
                    ],
                  ),
                );
              }else if(state.requestState ==  RequestState.LOADED){
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.contact?.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(child: Text('${state.contact?[index].profile}'),),
                                const SizedBox(width: 20,),
                                Text('${state.contact?[index].name}'),
                              ],
                            ),
                            CircleAvatar(backgroundColor: Colors.purple,child: Text('${state.contact?[index].score}'),)
                          ],
                        ),
                      );
                  }),
                );
              }else{
                return Container();
              }
            }
          )
        ],
      ),
    );
  }
}
