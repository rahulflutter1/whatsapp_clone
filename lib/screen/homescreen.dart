import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chatpage.dart';
class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("whatsapp clone"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext contesxt){
            return[
              PopupMenuItem(
                child: Text("New Group"),
                value: "New Group",
              ),
              PopupMenuItem(
                child: Text("New Broadcast"),
                value: "New Broadcast",
              ),
              PopupMenuItem(
                child: Text("Whatsapp web"),
                value: "Whatsapp web",
              ),
              PopupMenuItem(
                child: Text("Starred messages"),
                value: "Starred messages ",
              ),
              PopupMenuItem(
                child: Text("Setting"),
                value: "Setting",
              ),
            ];
          }),
        ],
        backgroundColor: Colors.teal,
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
            icon: Icon(Icons.camera_alt),
            ),
            Tab(
             text: "Chats",
            ),
            Tab(
            text: "Status",
            ),
            Tab(
              text: "Calls",
             ),


         ],
      ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text('Camera'),
          chatpage(),
          Text("Status"),
          Text("calls"),
        ],
      ),
    );
  }
}
