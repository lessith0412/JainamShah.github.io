import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:portfolio/Sections/ContactSection.dart';
import 'package:portfolio/Sections/about_section.dart';
import 'package:portfolio/Sections/recentwork_section.dart';
import 'package:portfolio/Sections/service_section.dart';
import 'package:portfolio/Sections/top_section.dart';
import 'package:portfolio/constant.dart';


class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  int selectedIndex =0;
  List<String> menu =[
    'Home',
    'About Me',
    'Strong Areas',
    'Projects',
    'Contact Me',
  ];
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20*2.5),
      constraints: BoxConstraints(maxWidth: 1110),
      height: 100,
      decoration: BoxDecoration(color: Color(0xFF0B1E9A),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
            topRight: Radius.circular(10)),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            menu.length, (index) => buildTextMenu(index)),
      ),

    );
  }

  Widget buildTextMenu(int index) => InkWell(
    onTap: (){
      setState(() {
        selectedIndex+= index;
        print('yes');
      });
      // if(index ==0){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TopSection()));
      // }
      // if(index ==1){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutSection()));
      // }
      // if(index ==2){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ServiceSection()));
      // }
      // if(index ==3){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RecentWork()));
      // }
      // if(index ==4){
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ContactSection()));
      // }
    },
    child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20*2),
        alignment: Alignment.center,
        constraints: BoxConstraints(minWidth: 130),
        height: 100,
        child: Stack(children:[Text(menu[index],style: TextStyle(fontSize: 18,color: Colors.teal)),
          // Positioned(
          //     left: 4,
          //     right: 4,
          //     bottom: selectedIndex == index ? -9 : -32,
          //     child:Image.asset('assets/Hover.png'))
        ])

    ),
  );
}
