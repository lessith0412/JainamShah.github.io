import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Sections/service_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

final Uri _url = Uri.parse('https://github.com/lessith0412');

class ContactSection extends StatelessWidget {
   ContactSection({Key? key}) : super(key: key);


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final controllername = TextEditingController();
  final controlleremail = TextEditingController();
  final controllerdescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 600,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/recentsection.jpg'),
          fit: BoxFit.cover,
        )
      ),
      child: Column(
        children: [
          Transform.translate(
            offset: Offset(0,-70),
            child: moredetail(),
          ),
          Textcard(subtitle: 'For Inquiry!', title: 'Contact Me!'),
          Container(
            constraints: BoxConstraints(
              maxWidth: 1110,
              maxHeight: 450,
            ),
            margin: EdgeInsets.only(bottom: 40),
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/page2.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child:Column(
                children: [
                  SizedBox(height: 10,),
                  Form(child:Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formkey,
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 30,
                      children: [
                        SizedBox(
                          width : 470,
                          child: TextFormField(
                            controller: controllername,
                            onChanged: (value){},
                            decoration: InputDecoration(
                              labelText: "Your name",
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              hintText: "Enter your name",
                            ),
                            validator: (controllername){
                              if (controllername!.isEmpty){
                                return 'Enter your Name First!';
                              }else if(controllername.isNotEmpty && controllername.length<3){
                                return 'Enter a Valid Name sir';
                              }
                              else{
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width : 470,
                          child: TextFormField(
                            controller: controlleremail,
                            onChanged: (value){},
                            decoration: InputDecoration(
                              labelText: "Your Email",
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              hintText: "Enter your Email Address",
                            ),
                            validator: (value) {
                              final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                              final regExp = RegExp(pattern);
                              if (value!.isEmpty) {
                                return 'Enter an email';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Enter a valid email';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          // width : 300,
                          child: TextFormField(
                            controller: controllerdescription,
                            maxLines: 7,
                            onChanged: (value){},
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              labelText: "Description",
                              labelStyle: TextStyle(
                                color: Colors.black87,
                                fontSize: 20
                              ),
                              hintText: "Write some Description",
                            ),
                            validator: (controllername){
                              if (controllername!.isEmpty){
                                return 'Give us some Description!';
                              }else if(controllername.isNotEmpty && controllername.length<3){
                                return 'Please provide Sufficient Information';
                              }
                              else{
                                return null;
                              }
                            },
                          ),
                        ),
                        // SizedBox(height: 5,),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: FittedBox(
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            )
                                        )
                                    ),
                                    onPressed: (){
                                      if(!_formkey.currentState!.validate()){
                                        return;
                                      }
                                      sendEmail(name: controllername.text, email: controlleremail.text, description: controllerdescription.text);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Thanks for Contacting! We will reach you!')));},
                                    child: Row(
                                      children: [
                                        Text('Contact Me!',
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),),
                                        SizedBox(width: 20,),
                                        Image.asset('assets/contact.png',
                                        fit: BoxFit.cover,
                                        height: 40,),]
                                    ),
                                  ),
                                ),
                              ),
                              // Center(
                              //   child: FittedBox(
                              //     child: OutlinedButton(
                              //       style: ButtonStyle(
                              //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              //               RoundedRectangleBorder(
                              //                 borderRadius: BorderRadius.circular(50),
                              //               )
                              //           )
                              //       ),
                              //       onPressed: (){},
                              //       child: Row(
                              //           children: [
                              //             Text('Connect Me!'),
                              //             SizedBox(width: 20,),
                              //             Image.asset('assets/linkedin.png',
                              //               fit: BoxFit.cover,
                              //               height: 40,),]
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                      ],
                    ),
                  )
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}

Future sendEmail({
  required String name,
  required String email,
required String description,
}) async{

  final serviceId = 'service_qzpe34a';
  final templateId = 'template_6stan7q';
  final userId = 'MW-m0fiB9_qOxqjNZ';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
  headers: {
    'Content-type':'application/json'
  },
  body: json.encode({
    'service_id': serviceId,
    'template_id': templateId,
    'user_id' : userId,
    'template_params': {
      'user_name': name,
      'user_email': email,
      'user_message': description,
    }
  }));
  print(response.body);
}

class moredetail extends StatelessWidget {
  const moredetail({
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
              image: AssetImage('assets/servicesection.jpg'),
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [kDefaultShadow],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Image.asset('assets/source.png',
              height: 80,
              width: 80,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 80,
                  child: VerticalDivider(),
                ),
              ),
              Expanded(child: Text('Want more information?',
                // textAlign: TextAlign.right,
                style: GoogleFonts.workSans(textStyle :Theme.of(context).textTheme.headline3 )),),
              // SizedBox(height: 10,),
              Githubcard(),
            ],
          ),
        )
      ],
    );
  }
}


class Githubcard extends StatelessWidget {
  const Githubcard({
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
          children: [
            Text('Click Here!',
            style: TextStyle(
              fontWeight: FontWeight.w200
            ),),
            SizedBox(width: 20,),
            Image.asset('assets/github.png',
              height: 40,),
            //Text('Hire Me!')],
        ])),
      ),
    );
  }
}