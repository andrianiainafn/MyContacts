import 'package:flutter_bloc/flutter_bloc.dart';

import '../enums/enums.dart';
import '../model/contact.model.dart';
import '../repositories/contacts.repo.dart';
import 'contacts.actions.dart';
import 'contacts.state.dart';


class ContactsBloc extends Bloc<ContactsEvent,ContactsState>{
  ContactsRepository contactsRepository;

  ContactsBloc(this.contactsRepository) :
    super(ContactsState(contact: [],errorMessage: '',requestState: RequestState.NONE,currentEvent:DefaultEvent())){
    on<LoadAllContactsEvent>((event,emit) async{
      emit(ContactsState(contact: state.contact,requestState: RequestState.LOADING,currentEvent: event));
      try {
        List<Contact> data = await contactsRepository.allContacts();
        emit(ContactsState(contact: data,requestState: RequestState.LOADED,currentEvent: event));
      } on Exception catch (e) {
        emit(ContactsState(contact: state.contact,requestState: RequestState.ERROR,errorMessage: e.toString(),currentEvent: event));
      }
    });
    on<LoadStudentsevent>((event,emit) async{
      emit(ContactsState(contact: state.contact,requestState: RequestState.LOADING,currentEvent: event));
      try {
        List<Contact> data = await contactsRepository.contactsByTypes('Student');
        emit(ContactsState(contact: data,requestState: RequestState.LOADED,currentEvent: event));
      } on Exception catch (e) {
        emit(ContactsState(contact: state.contact,requestState: RequestState.ERROR,errorMessage: e.toString(),currentEvent: event));
      }
    });
    on<LoadDevelopersEvent>((event,emit)async{
      emit(ContactsState(contact: state.contact,requestState: RequestState.LOADING,currentEvent: event));
      try {
        List<Contact> data = await contactsRepository.contactsByTypes('Developer');
        emit(ContactsState(contact: data,requestState: RequestState.LOADED,currentEvent: event));
      } on Exception catch (e) {
        emit(ContactsState(contact: state.contact,requestState: RequestState.ERROR,errorMessage: e.toString(),currentEvent: event));
      }
    });
  }
}