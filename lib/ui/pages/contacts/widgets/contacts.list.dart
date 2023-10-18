import 'package:flutter/material.dart';

import '../../../../model/contact.model.dart';

class ContactsList extends StatelessWidget {
  List<Contact>? contacts;
  ContactsList({this.contacts,super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context,index) => const Divider(height: 3,color: Colors.indigo),
          itemCount: contacts!.length,
          itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/messages',arguments: contacts?[index]);
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(child: Text('${contacts?[index].profile}'),),
                      const SizedBox(width: 20,),
                      Text('${contacts?[index].name}'),
                    ],
                  ),
                  CircleAvatar(backgroundColor: Colors.purple,child: Text('${contacts?[index].score}'),)
                ],
              ),
            );
          }),
    );
  }
}
