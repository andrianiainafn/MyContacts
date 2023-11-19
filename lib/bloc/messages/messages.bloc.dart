import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_mobile/bloc/messages/messages.actions.dart';
import 'package:social_mobile/bloc/messages/messages.state.dart';
import 'package:social_mobile/enums/enums.dart';
import 'package:social_mobile/repositories/messages.repo.dart';

import '../../model/message.model.dart';

class MessagesBloc extends Bloc<MessageEvent,MessageState>{
  MessageRepository messageRepository;

  MessagesBloc(this.messageRepository):
        super(MessageState.initialState()){
        on<MessageByContactEvent>((event, emit)async{
          emit(MessageState(messages:state.messages, requestState: RequestState.LOADING,currentMessageEvent: event));
          try{
            List<Message> data = await messageRepository.messagesByContacts(event.payload.id);
            emit(MessageState(messages: data,requestState: RequestState.LOADED,currentMessageEvent: event));
          }on Exception catch (e){
            emit(MessageState(requestState: RequestState.ERROR,messages: state.messages,messageError: e.toString(),currentMessageEvent: event));
          }
        });
        on<AddNewMessageEvent>((event, emit)async{
          // emit(MessageState(messages:state.messages, requestState: RequestState.LOADING,currentMessageEvent: event));
          try{
            event.payload.date =  DateTime.now();
            Message message = await messageRepository.addNewMessage(event.payload);
            List<Message> data =[...?state.messages];
            data.add(message);
            emit(MessageState(messages: data,requestState: RequestState.LOADED,currentMessageEvent: event));
          }on Exception catch (e){
            emit(MessageState(requestState: RequestState.ERROR,messages: state.messages,messageError: e.toString(),currentMessageEvent: event));
          }
        });

  }

}