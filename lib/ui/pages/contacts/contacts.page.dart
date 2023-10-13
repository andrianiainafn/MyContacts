import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts.bloc.dart';

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

                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                  ),
                  child: const Text("All contacts"),
                ),
                ElevatedButton(onPressed: (){
                    context.read<ContactsBloc>().add(LoadAllContactsEvent());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple
                ),
                child: const Text("Students")
                ),
                ElevatedButton(onPressed: (){

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
              print("rebuild");
              if(state.requestState == RequestState.LOADING){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }else if(state.requestState == RequestState.ERROR){
                return Column(
                  children: [
                    Text('${state.errorMessage}'),
                    ElevatedButton(onPressed: (){}, child: Text("Retry"))
                  ],
                );
              }else if(state.requestState ==  RequestState.LOADED){
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.contact?.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Row(
                          children: [
                            Text('${state.contact?[index].name}')
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
