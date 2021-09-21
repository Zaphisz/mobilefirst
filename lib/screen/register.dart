
import 'package:flutter/material.dart';
import 'package:mobilefirst/config/constant.dart';
import 'package:mobilefirst/backend/db_register.dart';
import 'package:mobilefirst/screen/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, surname, email, pass;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SingUp"),
        ),
        body: Form(
            key: formkey,
            child: SingleChildScrollView(
                child: Column(children: [txtName(),
                 txtSName(), 
                 txEmail(),
                 txtPass(),
                 btnSubmit(),
                 ]))),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        style: TextStyle(
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
            labelText: "Name",
            icon: Icon(Icons.people),
            hintText: "Enter Name"),
            keyboardType: TextInputType.name,
            validator: (val){
              if(val!.length < 3){
                return 'Pls enter more 3 alphabet';
              }
            },
            onSaved: (val){
              name=val;
            },
      ),
    );
  }

  Widget txtSName() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        style: TextStyle(
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
            labelText: "Surname",
            icon: Icon(Icons.people),
            hintText: "Enter Surname:"),
            keyboardType: TextInputType.name,
            validator: (val){
              if(val!.isEmpty){
                return 'Pls Enter Something';
              }else if(val!.length<3) {
                return 'Pls enter more 3 alphabet';
              }
            },
            onSaved: (val){
              surname = val!.trim();
            },
      ),
    );
  }

  Widget txEmail() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        style: TextStyle(
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
            labelText: "Email",
            icon: Icon(Icons.email),
            hintText: "Enter Email:"),
            keyboardType: TextInputType.emailAddress,
            validator: (val){
              if(!(val!.contains('@'))){
                return 'Pls Enter Email';
              } 
              else if(!(val!.contains('.com'))){
                return 'Pls Enter .com';
              }
            },
            onSaved: (val){
              email = val;
            },
      ),
    );
  }
  Widget txtPass() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        style: TextStyle(
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
            labelText: "Pass",
            icon: Icon(Icons.password_rounded),
            hintText: "Enter Pass:"),
            obscureText: true,
            validator: (val){
              if(val!.isEmpty){
                return 'Pls Enter Pass';
              }
            },
            onSaved: (val){
              pass = val;
            },
      ),
    );
  }

Widget btnSubmit(){
  return ElevatedButton(
    child: Text('Submit'),
    onPressed: (){
      if (formkey.currentState!.validate()) {      
      formkey.currentState!.save();
      var local =LocalDB();
      local.Register(name,surname,email,pass);
      Navigator.pushNamed(context, 'login');
      }
      
    },
  );
}
}
