import 'package:flutter/material.dart';

class ContactsWithMessages extends StatelessWidget {
  const ContactsWithMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact with messages'),),
      body: const Center(
        child: Text('Contact with messages'),
      ),
    );
  }
}
