import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';

class ProfileData{
  static var db, userCollection;

  static connect(String UID) async{
    db = await Db.create(MONGO_CONN_DURL);
    await db.open();
    inspect(db);
    if(db.isConnected){
      print(UID + " link MongoDB Connected");
    }

    userCollection = db.collection(USER_DOC);
    var sample = await userCollection.find({"Uid": UID}).toList();
    return sample;
  }
}