import 'dart:ui';
import 'package:flutter/material.dart';
import 'components/LogoandBlurr.dart';
import 'components/menu.dart';
import 'components/person_image.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 700,minHeight: 600),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/background.jpg'),
        )
      ),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: 1200,
        child: Stack(
            children: [
              LogoandBlurr(size: size),
              Person_pic(),
              Positioned(
                bottom: 0,
                child: Menu(),)
            ] ),
      ),
    );
  }
}







