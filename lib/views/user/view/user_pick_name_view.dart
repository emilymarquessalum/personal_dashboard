


import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPickNameView extends StatelessWidget {
  const UserPickNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: Colors.black45,
      child: Column(

        children: [

          Text("Name",
            style: Theme.of(context).textTheme.titleMedium,
          ),

          TextField(
            decoration: InputDecoration(
              hintText: "Name",
              hintStyle: Theme.of(context).textTheme.bodyText1,
              border: InputBorder.none,
            ),
          ),

          ElevatedButton(onPressed: (){

          }, child: Text("Confirm")),

        ],
      ),
    );
  }
}
