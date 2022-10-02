import 'package:flutter/material.dart';

class Service{
  final int id;
  final String title,image;
  final Color color;

  Service({required this.id,required this.title,required this.image,required this.color});
}

List<Service> services=[
  Service(id: 1,
    title: "Game Developer",
    image: "assets/gamedevelopment.png",
    color: Color(0xFFD9FFFC),),
  Service(id: 2,
    title: "Flutter Developer",
    image: "assets/ui.png",
    color: Color(0xFF0FC2D0),),
  Service(id: 1,
    title: "CTF Player",
    image: "assets/programing.png",
    color: Color(0xFF40D0C1),),
  Service(id: 1,
    title: "Animator",
    image: "assets/animation.png",
    color: Color(0xFFB37488),),
  Service(id: 1,
    title: "CyberSecurity",
    image: "assets/cyber.png",
    color: Color(0xFF817EE8),),




];