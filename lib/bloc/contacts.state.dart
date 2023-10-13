import '../enums/enums.dart';
import '../model/contact.model.dart';
import 'contacts.actions.dart';

class ContactsState{
  List<Contact>? contact;
  RequestState? requestState;
  String? errorMessage;
  ContactsEvent currentEvent;

  ContactsState({this.contact, this.requestState, this.errorMessage,required this.currentEvent});
}

