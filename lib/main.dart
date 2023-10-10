import 'package:flutter/material.dart';
import 'package:social_mobile/ui/pages/contacts/contacts.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      routes: {
        '/contacts':(context)=>ContactsPage()
      },
      initialRoute: '/contacts',
    );
  }
}
