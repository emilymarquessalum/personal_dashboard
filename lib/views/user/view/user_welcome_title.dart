

import 'package:flutter/cupertino.dart';
import 'package:styled_widget/styled_widget.dart';

class UserWelcomeTitle extends StatelessWidget {
  const UserWelcomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text('EmilySalum',
    style: TextStyle(
      fontSize: 32,
     // fontWeight: FontWeight.bold,
        fontFamily: 'Aboreto',

        color: Color(0xffd013f1)



    ),
    ).textShadow(
      blurRadius: 10,
      color: Color(0xffe429ff),
    );
  }
}
