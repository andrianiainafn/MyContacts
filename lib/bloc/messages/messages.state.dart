
import 'package:social_mobile/bloc/messages/messages.actions.dart';
import 'package:social_mobile/enums/enums.dart';
import 'package:social_mobile/model/message.model.dart';

class MessageState{
  List<Message>? messages;
  RequestState? requestState;
  String? messageError;
  MessageEvent? currentMessageEvent;
  List<Message> selectedMessage;

  MessageState({this.messages, this.requestState, this.messageError,
    this.currentMessageEvent,this.selectedMessage= const []});

  MessageState.initialState():
      selectedMessage = [],
      requestState = RequestState.NONE,
      messages = [],
      messageError =  '';

}