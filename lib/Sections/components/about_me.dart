import 'package:flutter/material.dart';

class aboutme extends StatelessWidget {
  const aboutme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My \nIntroduction',style: Theme.of(context).
          textTheme.headline2?.
          copyWith(fontWeight: FontWeight.bold ,color: Colors.black87),),
        ]
    );
  }
}
