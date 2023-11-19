import 'dart:math';

import 'package:social_mobile/model/message.model.dart';

class MessageRepository{
  int? messageCount;
  Map<int,Message> messages =  {
    1:Message(id: 1,contactId: 1,date: DateTime.now(),content: "'Hello world,I'm hungry.give me food",type: 'sent'),
    2:Message(id: 2,contactId: 1,date: DateTime.now(),content: 'Okay thanks',type: 'received'),
    3:Message(id: 3,contactId: 1,date: DateTime.now(),content: 'How are you doing',type: 'sent'),
    4:Message(id: 4,contactId: 1,date: DateTime.now(),content: 'No thing',type: 'received'),
    5:Message(id: 5,contactId: 1,date: DateTime.now(),content: 'Hi Yor',type: 'sent'),
    6:Message(id: 6,contactId: 1,date: DateTime.now(),content: 'I love You',type: 'received'),
  };
  MessageRepository(){
    messageCount = messages.length;
  }
  Future<List<Message>> allMessage () async {
    await Future.delayed(const Duration(seconds: 2));
    int rnd = Random().nextInt(10);
    if (rnd > 2){
      return messages.values.toList();
    }else{
      throw Exception('Network Error');
    }
  }
  Future<List<Message>> messagesByContacts (int contactId) async {
    await Future.delayed(const Duration(seconds: 2));
    int rnd = Random().nextInt(10);
    if (rnd > 2) {
      return messages.values.where((element) => element.contactId == contactId).toList();
    } else {
      throw Exception('Network Error');
    }
  }
  Future<Message> addNewMessage (Message message) async {
    await Future.delayed(const Duration(seconds: 2));
    message.id =  messageCount! + 1 ?? 0;
    messages[message.id] = message;
    int rnd = Random().nextInt(10);
    if (rnd > 2) {
      return message;
    } else {
      throw Exception('Network Error');
    }
  }
}