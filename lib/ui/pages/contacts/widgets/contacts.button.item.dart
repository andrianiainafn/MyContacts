import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts.state.dart';

import '../../../../bloc/contacts.actions.dart';
import '../../../../bloc/contacts.bloc.dart';

class ContactsButtonItem extends StatelessWidget {

  String? buttonLabel;
   ContactsEvent? contactsEvent;

   ContactsButtonItem({this.buttonLabel, this.contactsEvent, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsBloc,ContactsState>(
        builder: (context,state){
          return Container(
            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
            decoration: BoxDecoration(
                border: Border.all(
                    width: (state.currentEvent.runtimeType == contactsEvent.runtimeType) ? 2 : 0,
                    color: Colors.indigo
                )
            ),
            child: ElevatedButton(onPressed: (){
              context.read<ContactsBloc>().add(contactsEvent!);},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child:  Text(buttonLabel!)
            ),
          );
        }
    );
  }
}
