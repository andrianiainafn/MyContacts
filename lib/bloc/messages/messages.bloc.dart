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
          emit(MessageState(messages:state.messages, requestState: RequestState.LOADING,currentMessageEvent: event,selectedMessage: state.selectedMessage));
          try{
            List<Message> data = await messageRepository.messagesByContacts(event.payload.id);
            emit(MessageState(messages: data,requestState: RequestState.LOADED,currentMessageEvent: event,selectedMessage: state.selectedMessage));
          }on Exception catch (e){
            emit(MessageState(requestState: RequestState.ERROR,messages: state.messages,messageError: e.toString(),currentMessageEvent: event,selectedMessage: state.selectedMessage));
          }
        });
        on<AddNewMessageEvent>((event, emit)async{
          // emit(MessageState(messages:state.messages, requestState: RequestState.LOADING,currentMessageEvent: event));
          try{
            event.payload.date =  DateTime.now();
            Message message = await messageRepository.addNewMessage(event.payload);
            List<Message> data =[...?state.messages];
            data.add(message);
            emit(MessageState(messages: data,requestState: RequestState.LOADED,currentMessageEvent: event,selectedMessage: state.selectedMessage));
          }on Exception catch (e){
            emit(MessageState(requestState: RequestState.ERROR,messages: state.messages,messageError: e.toString(),currentMessageEvent: event,selectedMessage: state.selectedMessage));
          }
        });
        on<SelectMessageEvent>((event, emit)async{
          try{
            List<Message>? messages = state.messages;
            List<Message> selected = [...state.selectedMessage];
            for(Message m in messages!){
              if(m.id == event.payload.id){
                m.selected = !m.selected;
              }
              if(m.selected==true){
                selected.add(m);
              }else{
                selected.removeWhere((element) => element.id == m.id);
              }
            }
            emit(MessageState(messages: messages,selectedMessage: selected,currentMessageEvent: event,requestState: RequestState.LOADED));

          }on Exception catch (e){

          }
        });
        on<DeleteMessageEvent>((event, emit)async{
            List<Message>? messages = state.messages;
            List<Message> selected = [...state.selectedMessage];
          try{
            for(Message m in selected){
              await messageRepository.deleteMessage(m);
              messages?.removeWhere((element) => element.id == m.id);
            }
            emit(MessageState(messages: messages,selectedMessage: selected,currentMessageEvent: event,requestState: RequestState.LOADED));

          }on Exception catch (e){
            emit(MessageState(messages: messages,selectedMessage: selected,currentMessageEvent: event,requestState: RequestState.ERROR));
          }
        });
  }

}