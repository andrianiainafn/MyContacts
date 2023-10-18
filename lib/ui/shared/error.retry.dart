import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/contacts/contacts.actions.dart';

import '../../bloc/contacts/contacts.bloc.dart';

class ErrorRetryMessage extends StatelessWidget {

  String? errorMessage;
  void Function() onAction;

  ErrorRetryMessage({required this.onAction,this.errorMessage,super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$errorMessage'),
          ElevatedButton(
              onPressed: onAction,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text("Retry"))
        ],
      ),
    );
  }
}
