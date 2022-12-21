import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/model/ChatModel.dart';
import 'package:whatsapp_clone/screen/individualPage.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({Key? key,required this.chatmodel}) : super(key: key);
  final ChatModel chatmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (contex) =>IndividualPage(chatmodel: chatmodel,)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: SvgPicture.asset(chatmodel.isGroup?"assets/groups.svg":"assets/person.svg",
                color: Colors.white,
                height: 36,width: 36,),
              backgroundColor: Colors.blueGrey,
            ),

            title: Text(chatmodel.name,
              style: TextStyle(
                  fontSize: 17,fontWeight: FontWeight.w500),),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 3,),
                Text(chatmodel.currentmessage,style: TextStyle(fontSize: 13),)
              ],


            ),
            trailing: Text(chatmodel.time),
          ),
          Padding(padding: const EdgeInsets.only(right: 20,left: 80),
              child:Divider(
                thickness: 2,
              )
          ),

        ],
      ),
    );
  }
}
