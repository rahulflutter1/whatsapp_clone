import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUI/ContactCard.dart';
class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),),
            Text("256 contact",style:
              TextStyle(
                fontSize: 13
              ),),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(Icons.search,size: 26,),),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext contesxt){
                return[
                  PopupMenuItem(
                    child: Text("Invite a Friend"),
                    value: "Invite a Friend",
                  ),
                  PopupMenuItem(
                    child: Text("Contact"),
                    value: "Contacts",
                  ),
                  PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),

                ];
              }),
        ],
      ),
      body: ListView(
        children: [
          ContactCard(),
        ],
      )
    );
  }
}
