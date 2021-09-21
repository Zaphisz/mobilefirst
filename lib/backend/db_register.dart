import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
class LocalDB {
  String dbname= "ced";


  Future <Database> ConnectDB() async {
    //path//
    var directory = await getApplicationDocumentsDirectory();
    //print(directory);
    dynamic location =join(directory.path, this.dbname);
    //print(location);
    //DB//
    var createdB = await databaseFactoryIo;
    var dB = await createdB.openDatabase(location);
   // print(dB);

    return (dB);
  }
  Future <void>Register(name,surname,email,pass)async{
    print("$name $surname $email $pass");
    
    var dB = await this.ConnectDB();
    var store = intMapStoreFactory.store('user');

    var data = await store.add(dB,{
    'name':name,
    'surname':surname,
    'email':email,
    'password':pass,
    }).then((value){
      print('$value สำเร็จ');
    }).catchError((error) {
      print("พบข้อพิดพลาด : $error");
    });
    var user = await store.find(dB);
    //print(user);

    dB.close();
}
  Future<bool>Login(email,pass) async {
      var store = intMapStoreFactory.store('user');
      var user = await store.find(await this.ConnectDB());
     // print(user);

      for (var item in user){
          print(item['name']);
          if (item['email']==email && item['password']==pass) {
            print('success');
            return true;
          }
      }
      return false;
    }
}



  

