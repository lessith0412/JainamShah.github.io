import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Sections/service_section.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import '../models/RecentWork.dart';

final Uri _url = Uri.parse('https://linkedin.com/in/jainamshah1208');

class RecentWork extends StatelessWidget {
  const RecentWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 80),
      width: double.infinity,
      // height: 600,
      decoration: BoxDecoration(
        color: Colors.white70.withOpacity(0.3),
        image: DecorationImage(
          image: AssetImage('assets/servicesection.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0,-80),
            child: bannerhireme(),
          ),
          Textcard(
            subtitle: 'Projects',
            title: 'Recent Works!',
          ),
          SizedBox(height: 30,),
          SizedBox(
            width: 1110,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 30,
              children: List.generate(recentWork.length, (index) => recentwork(index: index)),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class recentwork extends StatefulWidget {
  const recentwork({
    Key? key, required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<recentwork> createState() => _recentworkState();
}

class _recentworkState extends State<recentwork> {
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
        height: 300,
        width: 480,
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage('assets/brown.jpg'),
           fit: BoxFit.cover,
         ),
         // color: Colors.orangeAccent,
         boxShadow: [if (isHover) kDefaultCardShadow],
         borderRadius: BorderRadius.circular(10),
       ),
        child: Row(
          children: [
            SizedBox(height: 10,),
            Image.asset(recentWork[widget.index].image),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(recentWork[widget.index].category.toUpperCase()),
                  SizedBox(height: 10,),
                  Text(recentWork[widget.index].title,
                  style: Theme.of(context).textTheme.headline4!.copyWith(height: 1.5,fontWeight: FontWeight.bold,color: Colors.black),)
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class bannerhireme extends StatelessWidget {
  const bannerhireme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(40),
          constraints: BoxConstraints(maxWidth: 1110),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/recentsection.jpg'),
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [kDefaultShadow],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset('assets/email.png',
            height: 80,
            width: 80,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 80,
                  child: VerticalDivider(),
                ),
              ),
              Expanded(child: Text('Starting a new project?',
              style: GoogleFonts.workSans(textStyle: Theme.of(context).textTheme.headline2),),),
              // SizedBox(height: 10,),
              Hiremecard(),

            ],
          ),
        )

      ],
    );
  }
}


class Hiremecard extends StatelessWidget {
  const Hiremecard({
    Key? key,
  }) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding : EdgeInsets.symmetric(vertical: 20,horizontal:20*2.5),
        child: OutlinedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )
                )
            ),
            onPressed: _launchUrl, child: Row(
          children: [Image.asset('assets/handshake.png',
            height: 40,),
            SizedBox(width: 20,),
            Text('Hire Me!')],
        )),
      ),
    );
  }
}