import 'package:flutter/material.dart';


final kDefaultShadow = BoxShadow(
  offset: Offset(0, 100),
  blurRadius: 100,
  color: Color(0xFFA7E364).withOpacity(0.2),
);

final kDefaultCardShadow = BoxShadow(
  offset: Offset(0, 20),
  blurRadius: 50,
  color: Colors.black.withOpacity(0.3),
);

final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

final kDefaultOutlineInputBorder = OutlineInputBorder(
  // borderRadius: BorderRadius.circular(50),
  borderSide: BorderSide(
    color: Color(0xFF57572B),
  ),
);