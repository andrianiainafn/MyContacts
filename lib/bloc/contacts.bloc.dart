import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/contact.model.dart';
import '../repositories/contacts.repo.dart';

abstract class ContactsEvent{}

final class LoadAllContactsEvent extends ContactsEvent{}
final class LoadStudentsevent extends ContactsEvent{}
final class LoadDevelopersEvent  extends ContactsEvent{}

enum RequestState{ LOADING,LOADED,ERROR,NONE }

class ContactsState{
  List<Contact>? contact;
  RequestState? requestState;
  String? errorMessage;

  ContactsState({this.contact, this.requestState, this.errorMessage});
}

class ContactsBloc extends Bloc<ContactsEvent,ContactsState>{
  late ContactsRepository contactsRepository;

  ContactsBloc(ContactsState initialState, this.contactsRepository) :
    super(ContactsState(contact: [],errorMessage: '',requestState: RequestState.NONE)){on<LoadAllContactsEvent>((event,emit) async{
      emit(ContactsState(contact: state.contact,requestState: RequestState.LOADING));
      try {
        List<Contact> data = await contactsRepository.allContacts();
        emit(ContactsState(contact: data,requestState: RequestState.LOADED));
      } on Exception catch (e) {
        emit(ContactsState(contact: state.contact,requestState: RequestState.ERROR,errorMessage: e.toString()));
      }
    });
    on<LoadStudentsevent>((event,emit){

    });
    on<LoadDevelopersEvent>((event,emit){

    });
  }

  

}