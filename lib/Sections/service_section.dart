import 'package:flutter/material.dart';
import 'package:portfolio/constant.dart';

import '../models/Services.dart';

class ServiceSection extends StatelessWidget {
  const ServiceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/recentsection.jpg'),
        ),

      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        constraints: BoxConstraints(maxWidth: 1110),
        child: Column(
          children: [
            Textcard(subtitle: 'Strong Areas',
            title: 'My Skills!',),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(services.length, (index) => servicecard(index: index)),
            )
          ],
        ),
      ),
    );
  }
}

class Textcard extends StatelessWidget {
  const Textcard({
    Key? key, required this.subtitle, required this.title,
  }) : super(key: key);

  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      margin: EdgeInsets.symmetric(vertical: 40),
      constraints: BoxConstraints(maxWidth: 1110),
      height: 100,
      child: Row(
        children: [
          // Container(
          //   height: 100,
          //   width: 8,
          //   color: Colors.blueAccent,
          //   child: DecoratedBox(
          //     decoration: BoxDecoration(
          //       color: Colors.teal,
          //     ),
          //   ),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(subtitle,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                color: Colors.black
              ),),
              Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.bold,color: Colors.black))
            ],
          )
        ],
      ),
    );
  }
}

class servicecard extends StatefulWidget {
  const servicecard({
    Key? key, required this.index,
  }) : super(key: key);
  
  final int index;

  @override
  State<servicecard> createState() => _servicecardState();
}

class _servicecardState extends State<servicecard> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      onHover: (value){
        setState(() {
          isHover = value;
        });
      },
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.symmetric(vertical: 40),
        height: 200,
          width: 200,
        decoration: BoxDecoration(
          color: services[widget.index].color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Container(
            padding: EdgeInsets.all(20*1.5),
//                  alignment: Alignment.topCenter,
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                offset: Offset(0,20),
                blurRadius: 30,
                color: Colors.black.withOpacity(0.2),
              )]
            ),
            child: Image.asset(services[widget.index].image,
            fit: BoxFit.cover,),
          ),
          SizedBox(
            height: 20,
          ),
          Text(services[widget.index].title,
          style: TextStyle(
            fontSize: 20,
          ),)],
        ),
      ),
    );
  }
}
