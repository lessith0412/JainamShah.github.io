import 'package:flutter/material.dart';
class Person_pic extends StatelessWidget {
  const Person_pic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        bottom: 0,
        child:Container(
          constraints: BoxConstraints(maxWidth: 700,maxHeight: 1060),
          child: Image.asset('assets/j.png'),
        )
    );
  }
}