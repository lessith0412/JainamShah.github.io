import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContent extends StatelessWidget {
  const GlassContent({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10,sigmaY :10),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          constraints: BoxConstraints(maxWidth: 1110,maxHeight: size.height*0.3),
          width: double.infinity,
          color: Colors.white.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Greetings!',style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.teal),),
              Text('Jainam Shah',style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.teal),),
            ],
          ),
        ),
      ),
    );
  }
}