import 'package:flutter/material.dart';

import 'glasscontent.dart';

class LogoandBlurr extends StatelessWidget {
  const LogoandBlurr({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Image.asset('assets/logo.png'),
        Spacer(),
        Spacer(),
        Spacer(),
        GlassContent(size: size),
        Spacer(flex: 3,)
      ],
    );
  }
}