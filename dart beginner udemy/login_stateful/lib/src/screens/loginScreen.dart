import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  createState(){
    return LoginScreenState();
  }
}


class LoginScreenState extends State<LoginScreen>{

  final formKey = GlobalKey<FormState>();
  String email;
  String password;

  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(top: 25.0)),
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        )
      )
    );
  }


  Widget emailField(){
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child:  TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: (value) {
        if(!value.contains('@')){
          return 'please enter a valid email';
        }
      },
      onSaved: (value){
        email = value;
      },
    ),
    );
  }

  Widget passwordField(){
    return Container(
      child: TextFormField(
      obscureText: false, //for testing purpose
      decoration: InputDecoration(
        labelText: 'Enter Password',
      ),
      validator: (value){
        if(value.length < 4){
          return 'password must be more than 4 characters long';
        }
      },
      onSaved: (value){
        password = value;
      },
    ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text('Submit!'),
      color: Colors.blue,
      onPressed: () {

        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print('time to post $email and $password');
        }
      },
    );
  }
}