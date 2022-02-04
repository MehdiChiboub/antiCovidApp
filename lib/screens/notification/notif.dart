
import 'package:firebase_database/firebase_database.dart';

class Notif{
  String? title;
  String? body;

  Notif(this.title, this.body);

  Notif.fromSnapshot(DataSnapshot dataSnapshot){
    var id = dataSnapshot.key!;

    var data = dataSnapshot.value as Map<String,String>;

    if (data != null) {
      title = data["title"];
      body = data["body"];
    }
  }
}