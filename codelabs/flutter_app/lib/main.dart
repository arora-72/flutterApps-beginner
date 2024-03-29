import 'dart:ffi';

import 'package:flutter/material.dart';


//void Main(){
//  runApp(
//    new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Friendly Chat")
//        ),
//      ),
//    ),
//  );
//}



const String _name = "Indresh";

void main(){
  runApp(new FriendlyChatApp());
}

class FriendlyChatApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Friendly Chat App",
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget{
  @override
  State createState() => new ChatScreenState();
}


class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: new Column(                                        //modified
        children: <Widget>[                                         //new
          new Flexible(                                             //new
            child: new ListView.builder(                            //new
              padding: new EdgeInsets.all(8.0),                     //new
              reverse: true,                                        //new
              itemBuilder: (_, int index) => _messages[index],      //new
              itemCount: _messages.length,                          //new
            ),                                                      //new
          ),                                                        //new
          new Divider(height: 1.0),                                 //new
          new Container(                                            //new
            decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),                  //new
            child: _buildTextComposer(),                       //modified
          ),                                                        //new
        ],                                                          //new
      ),                                                            //new
    );
  }

  //dispose
  void dispose(){
    for(ChatMessage message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }

  //textController widget
  Widget _buildTextComposer(){
    return new IconTheme(data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(hintText: "Send text message"),
              ),),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text)),
          )
        ],
      ),
        ),
    );
  }

  void _handleSubmitted(String text){
    _textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
          vsync: this,
        duration: new Duration(milliseconds: 700),
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}


class ChatMessage extends StatelessWidget{
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new FadeTransition(
      opacity: animationController,
        alwaysIncludeSemantics: true,
        //key: ,
        //sizeFactor: new CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      //axisAlignment: 0.0,
      child: new Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 6.0),
            child: new CircleAvatar(child: new Text(_name[0]),),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )
            ],
          )
        ],
      ),
    ),
    );
  }
}