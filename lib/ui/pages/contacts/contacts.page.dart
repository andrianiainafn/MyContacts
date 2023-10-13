import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts.bloc.dart';

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: (){
                  context.read<ContactsBloc>().add(LoadAllContactsEvent());
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                  ),
                  child: const Text("All contacts"),
                ),
                ElevatedButton(onPressed: (){
                  context.read<ContactsBloc>().add(LoadStudentsevent());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                ),
                child: const Text("Students")
                ),
                ElevatedButton(onPressed: (){
                  context.read<ContactsBloc>().add(LoadDevelopersEvent());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple
                ),
                child: const Text("Developers")),
              ],
            ),
          ),
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
