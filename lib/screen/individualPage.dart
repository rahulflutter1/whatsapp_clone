
import 'package:emoji_picker_2/emoji_picker_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/model/ChatModel.dart';
class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key,required this.chatmodel}) : super(key: key);
  final ChatModel chatmodel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode= FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
     if(focusNode.hasFocus){
       setState(() {
         show=false;
       });
     }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leadingWidth: 70,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back,
              size: 25,),
              CircleAvatar(
                child: SvgPicture.asset(
                  widget.chatmodel.isGroup?
                  "assets/groups.svg":
                  "assets/person.svg",
                  color: Colors.white,
                  height: 36,width: 36,),
                radius: 20,
                backgroundColor: Colors.blueGrey,
              )
            ],
          ),
        ),
        title: InkWell(
          onTap: (){},
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatmodel.name,
                  style: TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold),
                ),
                Text("last seen today at 12:08",style: TextStyle(
                  fontSize: 12,
                ),),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.videocam),onPressed: (){}),
          IconButton(icon: Icon(Icons.call),onPressed: (){}),
          PopupMenuButton<String>(
              onSelected: (value){
                print(value);
              },
              itemBuilder: (BuildContext contesxt){
                return[
                  PopupMenuItem(
                    child: Text("View contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                    child: Text("Media,Links and docs"),
                    value: "Media,Links and docs",
                  ),
                  PopupMenuItem(
                    child: Text("wallpaper"),
                    value: "Wallpaper",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search ",
                  ),
                  PopupMenuItem(
                    child: Text("Mute Notification"),
                    value: "Setting",
                  ),
                ];
              })
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:WillPopScope(
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width:MediaQuery.of(context).size.width-60,
                          child: Card(
                            margin: EdgeInsets.only(left: 2,right: 2,bottom: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(

                                  border: InputBorder.none,
                                  hintText: "Type a Messsage",
                                  prefixIcon: IconButton(
                                    color: Colors.teal,
                                    icon: Icon(Icons.emoji_emotions,),
                                    onPressed: (){
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(() {
                                        show =!show;
                                      });
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(color: Colors.teal,
                                          icon: Icon(Icons.attach_file),

                                  onPressed: (){
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder)=>
                                                bottomsheet()
                                        );
                                  },
                                      ),
                                  IconButton(color: Colors.teal,
                                    icon: Icon(Icons.camera_alt),
                                    onPressed: (){},
                                  )
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.all(5),


                                ),

                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),

                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.teal,
                            child: IconButton(color: Colors.white,

                              icon: Icon(Icons.mic,size: 27,
                              ),
                              onPressed: (){},

                            ),
                          ),
                        ),
                      ],
                    ),
                   show ? emojiSelect(): Container(),
                  ],
                ),
              )
            ],
          ),
          onWillPop: () {
            if(show)
              {
                setState(() {
                  show = false;
                });
              }
            else
              {
                Navigator.pop(context);
              }
            return Future.value(false);
          },
        )
      ),
    );

  }
  Widget bottomsheet(){
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
              iconcreation(
                Icons.insert_drive_file,Colors.indigo,"Document"),
              SizedBox(
                width: 40,
              ),
              iconcreation(
                  Icons.camera_alt,Colors.pink,"Camera"),
              SizedBox(
                width: 40,
              ),
              iconcreation(
                  Icons.insert_photo,Colors.purple,"Gallery"),
              SizedBox(
                width: 40,
              )
            ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  iconcreation(
                      Icons.headset,Colors.orange,"Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.location_pin,Colors.green,"Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(
                      Icons.person,Colors.blue,"Contact"),
                  SizedBox(
                    width: 40,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget iconcreation(IconData icon, Color color ,String text){
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(text,style: TextStyle(
            fontSize: 12,
          ),),

        ],
      ),
    );
  }

  Widget emojiSelect() {


    return EmojiPicker2(
        rows:4,
        columns:7,
        onEmojiSelected: (emoji,category){
      print(emoji);
      setState(() {
        _controller.text= _controller.text+emoji.emoji;
      });
    });

  }

  }

