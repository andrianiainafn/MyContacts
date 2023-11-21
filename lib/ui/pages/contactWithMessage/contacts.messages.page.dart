import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts/contacts.actions.dart';
import 'package:social_mobile/bloc/contacts/contacts.bloc.dart';
import 'package:social_mobile/bloc/contacts/contacts.state.dart';

class ContactsWithMessages extends StatelessWidget {
  const ContactsWithMessages({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(LoadAllContactsEvent());
    return Scaffold(
      appBar: AppBar(title: const Text('Contact with messages'),),
      body: BlocBuilder<ContactsBloc,ContactsState>(
        builder: (context,state) =>
        SizedBox(
          height: 150,
          child: ListView.builder
          (
              itemBuilder: (context,index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1,color: Colors.indigo)
                        ),
                        padding: const EdgeInsets.all(16),
                        width: 100,
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Text('${state.contact?[index].profile}'),
                            ),
                            Text('${state.contact?[index].name}'),

                           Text('${state.contact?[index].profile}'),

                          ],
                        )
                    ),
                  ),
              itemCount: state.contact?.length,
              scrollDirection: Axis.horizontal,
          ),
        )
        ,
      ),
    );
  }
}
