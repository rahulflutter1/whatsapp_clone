import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: SvgPicture.asset("assets/person.svg",
            color: Colors.white,
            height: 30,
            width: 30,
            ),
        backgroundColor: Colors.blueGrey[200],
      ),
      title: Text("Rahul Antil"),
    );
  }
}
