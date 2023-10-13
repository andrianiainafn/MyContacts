import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/contacts.actions.dart';
import '../../../../bloc/contacts.bloc.dart';

class ContactsButtonItem extends StatelessWidget {

  String? buttonLabel;
   ContactsEvent? contactsEvent;

   ContactsButtonItem({this.buttonLabel, this.contactsEvent, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
              context.read<ContactsBloc>().add(contactsEvent!);},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child:  Text(buttonLabel!)
    );
  }
}
