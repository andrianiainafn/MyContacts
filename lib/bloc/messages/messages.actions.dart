import 'package:social_mobile/model/contact.model.dart';
import 'package:social_mobile/model/message.model.dart';

abstract class MessageEvent<T> {
  T payload;
  MessageEvent(this.payload);
}
class MessageByContactEvent extends MessageEvent<Contact>{
  MessageByContactEvent(super.payload);
}
class AddNewMessageEvent extends MessageEvent<Message>{
  AddNewMessageEvent(super.payload);
}
class SelectMessageEvent extends MessageEvent<Message>{
  SelectMessageEvent(super.payload);
}
class DeleteMessageEvent extends MessageEvent{
  DeleteMessageEvent(): super(null);
}