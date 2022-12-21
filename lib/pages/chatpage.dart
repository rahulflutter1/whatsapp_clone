import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/CustomCard.dart';
import 'package:whatsapp_clone/model/ChatModel.dart';
import 'package:whatsapp_clone/screen/SelectContact.dart';
class chatpage extends StatefulWidget {
  const chatpage({Key? key}) : super(key: key);

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {

  List<ChatModel> chats=[
    ChatModel(
      name: "Rahul Antil",
      isGroup: false,
      currentmessage: "hi rahul",
      time: "4:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Ishika",
      isGroup: false,
      currentmessage: "hi ishika",
      time: "6:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Sachin",
      isGroup: false,
      currentmessage: "hi Sachin",
      time: "7:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Sahil",
      isGroup: false,
      currentmessage: "hi sahil",
      time: "8:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "Ritika",
      isGroup: false,
      currentmessage: "hi ritika",
      time: "9:00",
      icon: "person.svg",
    ),
    ChatModel(
      name: "we",
      isGroup: true,
      currentmessage: "hi friends",
      time: "10:00",
      icon: "groups.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>SelectContact()));
        },
        child: Icon(Icons.chat),
        backgroundColor: Colors.teal,
      ),
      body:ListView.builder(
        itemCount: chats.length,
        itemBuilder: (contex,index)=>CustomCard(
       chatmodel:chats[index]),
      ),
    );
  }
}
