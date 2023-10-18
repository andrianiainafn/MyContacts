import 'package:flutter/material.dart';
import 'package:social_mobile/bloc/contacts/contacts.actions.dart';
import 'package:social_mobile/ui/pages/contacts/widgets/contacts.button.item.dart';


class ContactsButton extends StatelessWidget {
  const ContactsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            ContactsButtonItem(buttonLabel: 'All contacts',contactsEvent: LoadAllContactsEvent(),),
          ContactsButtonItem(buttonLabel: 'Students',contactsEvent: LoadStudentsevent(),),
          ContactsButtonItem(buttonLabel: 'Developers',contactsEvent: LoadDevelopersEvent(),),
        ],
      ),
    );
  }
}
