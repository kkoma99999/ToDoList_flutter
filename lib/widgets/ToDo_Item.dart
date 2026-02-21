import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(child: ListTile(
      onTap: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box,color: tdBlue),
        title: Text("Check Email",style: TextStyle(fontSize: 16,color: tdBlack,decoration: TextDecoration.lineThrough) )
    ),);
  }
}