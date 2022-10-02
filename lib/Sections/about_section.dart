import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/resume.dart';
import 'dart:io';
import 'package:portfolio/resume.dart';
import 'components/about_me.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      // constraints: BoxConstraints(maxHeight: 700,minHeight: 600),
      // width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/page2.jpg'),
          )
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 1110),
        margin: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                aboutme(),
                Expanded(
                  child: AboutMeText(
                    text : ''' Hi, I’m Jainam Shah.I’m currently pursuing my B.Tech in Computer Science Engineering with Specialization in Cyber Security.
I’m interested in Game development,Cyber Security,UI design with Flutter.
            ''',),
                ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              height: 240,
              width: 255,
              decoration: BoxDecoration(
                color: Color(0xFF0B1E9A),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFF6C74D4),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(
                    offset: Offset(0,3),
                    blurRadius: 6,
                    color: Colors.tealAccent.withOpacity(0.35)
                  )]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [Stack(
                    children: [
                      Text('10 ',
                      // textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                        foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 6..color = Colors.tealAccent.withOpacity(0.35),
                        shadows: [BoxShadow(
                            offset: Offset(0,5),
                          blurRadius: 10,
                          color: Colors.teal,
                        )]
                      ),),
                      Text('10',
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100,color: Colors.deepOrange),),
                    ],
                  ),
                    SizedBox(height: 10,),
                    Text('Projects Completed!',
                      style: TextStyle(color: Colors.black87),)
                  ],

                ),
              ),
            ),
            Expanded(
              child: AboutMeText(
                text : '''I have successfully build two apps with Flutter langauge. A Hacking tool in Python Programming.
I have a good grasp of Unity Engine and I have made 5 Prototypes of 3d Games through Unity Engine.
I am Currently working on my First Project in Unity Engine.
Feel Free to refer my Projects.
            ''',),)
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Hiremecard(),
                ResumeCard()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ResumeCard extends StatelessWidget {
  const ResumeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20*2.5),
        child: OutlinedButton(onPressed: ()async {
          final path = 'assets/resume.pdf';
          final file = await PDFApi.loadAsset(path);
          // openPDF(context, file);
        },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    )
                )
            ),
            child: Row(
          children: [
            Image.asset('assets/businessman.png',height: 40,),
            SizedBox(width: 20,),
            Text('Download Resume'),

          ],
        )),
      ),
    );
  }

  // void openPDF(BuildContext context, File file) => Navigator.of(context).push(
  //   MaterialPageRoute(builder: (context) => ps(file: file)),
  // );
}



class AboutMeText extends StatelessWidget {
  const AboutMeText({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  final String text;
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text( text,
      style: TextStyle(fontWeight: FontWeight.w200,color: Color(0xFF401A1A),height: 2),),
    );
  }
}



