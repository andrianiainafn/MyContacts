import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts.bloc.dart';
import 'package:social_mobile/repositories/contacts.repo.dart';
import 'package:social_mobile/ui/pages/contacts/contacts.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>ContactsBloc
          (ContactsState(contact: [],requestState: RequestState.NONE,errorMessage: ''),
            ContactsRepository()
        )
        )
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        routes: {
          '/contacts':(context)=>ContactsPage()
        },
        initialRoute: '/contacts',
      ),
    );
  }
}
