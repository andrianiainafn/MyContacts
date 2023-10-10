import 'dart:math';

import 'package:social_mobile/model/contact.model.dart';

class ContactsRepository{
  Map<int,Contact> contacts ={
    1:Contact(id:1,name: "Nezuko",profile: "NE",score: 5437,type: 'Student'),
    2:Contact(id:2,name: "Yor",profile: "YO",score: 6754,type: 'Developer'),
    3:Contact(id:3,name: "Tsunade",profile: "TS",score: 4533,type: 'Student'),
    4:Contact(id:4,name: "Nomena",profile: "FN",score: 47789,type: 'Developer'),
    5:Contact(id:5,name: "Ino",profile: "IN",score: 45336,type: 'Student')
  };
  
  Future<List<Contact>> allContacts() async{
    var future = await Future.delayed(const Duration(seconds: 1));
    int rnd = Random().nextInt(10);
    if(rnd > 3){
      return contacts.values.toList();
    }else{
      throw Exception("Internet error");
    }
  }

  Future<List<Contact>> contactsByTypes(String type) async{
    var future = await Future.delayed(const Duration(seconds: 1));
    int rnd = Random().nextInt(10);
    if(rnd > 3){
      return contacts.values.where((element) => element.type == type).toList();
    }else{
      throw Exception("Internet error");
    }
  }

}