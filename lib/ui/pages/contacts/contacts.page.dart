import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts/contacts.bloc.dart';
import 'package:social_mobile/ui/pages/contacts/widgets/contacts.bar.button.dart';
import 'package:social_mobile/ui/pages/contacts/widgets/contacts.list.dart';
import 'package:social_mobile/ui/shared/error.retry.dart';

import '../../../bloc/contacts/contacts.actions.dart';
import '../../../bloc/contacts/contacts.state.dart';
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
                return ErrorRetryMessage(errorMessage:state.errorMessage,
                  onAction: (){
                    context.read<ContactsBloc>().add(state.currentEvent);
                  },
                );
              }else if(state.requestState ==  RequestState.LOADED){
                return ContactsList(contacts: state.contact,);
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
