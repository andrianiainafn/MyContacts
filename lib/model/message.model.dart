class Message{
  int id;
  int? contactId;
  DateTime? date;
  String? content;
  String? type;
  bool selected;

  Message({this.id =0, this.contactId, this.date, this.content,this.type,this.selected=false});
}