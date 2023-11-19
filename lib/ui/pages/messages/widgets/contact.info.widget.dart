import 'package:flutter/material.dart';
import 'package:social_mobile/model/contact.model.dart';
class ContactInfoWidget extends StatelessWidget {
  Contact? contact;
  ContactInfoWidget({super.key,required this.contact});
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            CircleAvatar(child: Text('${contact?.profile}'),),
            const SizedBox(width: 10),
            Text('${contact?.name}')
          ],
        ),
      );
  }
}
