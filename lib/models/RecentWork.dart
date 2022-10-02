import 'package:flutter/material.dart';

class RecentWork{
  final int id;
  final String image,title,category;

  RecentWork({required this.id,required this.image, required this.title, required this.category});
}

List<RecentWork> recentWork =[

  RecentWork(id: 1,
      image: 'assets/football.png',
      title: '''Coincidence
Football App''',
      category: 'Flutter Developer'),
  RecentWork(id: 2,
      image: 'assets/muscle.png',
      title: 'Workout App',
      category: 'Flutter Developer'),
  RecentWork(id: 3,
      image: 'assets/data.png',
      title: 'Gym Database Management System',
      category: 'Database Management'),
  RecentWork(id: 4,
      image: 'assets/hacker.png',
      title: '''Coincidence
Hacking tool''',
      category: 'Cyber Security'),


];