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