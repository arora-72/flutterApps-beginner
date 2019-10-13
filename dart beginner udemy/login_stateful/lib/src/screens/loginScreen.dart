import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget{
  createState(){
    return LoginScreenState();
  }
}


class LoginScreenState extends State<LoginScreen>{
  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
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
    ),
    );
  }

  Widget submitButton(){
    return RaisedButton(
      child: Text('Submit!'),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}