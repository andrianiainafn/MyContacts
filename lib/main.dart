import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_mobile/bloc/contacts.bloc.dart';
import 'package:social_mobile/repositories/contacts.repo.dart';
import 'package:social_mobile/ui/pages/contacts/contacts.page.dart';

import 'bloc/contacts.actions.dart';
import 'bloc/contacts.state.dart';
import 'enums/enums.dart';



void main() {
  GetIt.instance.registerLazySingleton(() =>  ContactsRepository());
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
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        routes: {
          '/contacts':(context)=>const ContactsPage()
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
