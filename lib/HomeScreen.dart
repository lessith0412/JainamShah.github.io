import 'package:flutter/material.dart';
import 'package:portfolio/Sections/about_section.dart';
import 'package:portfolio/Sections/recentwork_section.dart';
import 'package:portfolio/Sections/top_section.dart';
import 'Sections/ContactSection.dart';
import 'Sections/service_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            AboutSection(),
            ServiceSection(),
            RecentWork(),
            ContactSection(),
            // SizedBox(height: 500,)
          ],
        ),
      ),
    );
  }
}
