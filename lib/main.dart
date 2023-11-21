import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_mobile/bloc/contacts/contacts.bloc.dart';
import 'package:social_mobile/bloc/messages/messages.bloc.dart';
import 'package:social_mobile/repositories/contacts.repo.dart';
import 'package:social_mobile/repositories/messages.repo.dart';
import 'package:social_mobile/ui/pages/contactWithMessage/contacts.messages.page.dart';
import 'package:social_mobile/ui/pages/contacts/contacts.page.dart';
import 'package:social_mobile/ui/pages/messages/messages.page.dart';

import 'bloc/contacts/contacts.actions.dart';
import 'bloc/contacts/contacts.state.dart';
import 'enums/enums.dart';



void main() {
  GetIt.instance.registerLazySingleton(() =>  ContactsRepository());
  GetIt.instance.registerLazySingleton(()=> MessageRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ContactsBloc
          (
            GetIt.instance<ContactsRepository>()
        )
        ),
        BlocProvider(create: (context)=>MessagesBloc(
          GetIt.instance<MessageRepository>()
        ))
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        debugShowCheckedModeBanner: false,
        routes: {
          '/contacts':(context)=>const ContactsPage(),
          '/messages':(context)=>MessagesPage(),
          '/contactsWithMessages':(context)=> const ContactsWithMessages()
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
