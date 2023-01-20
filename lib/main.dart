import 'package:flutter/material.dart';
import 'package:viva_project/screens/business_page.dart';
import 'package:viva_project/screens/detail_page.dart';
import 'package:viva_project/screens/entertainment_page.dart';
import 'package:viva_project/screens/health_page.dart';
import 'package:viva_project/screens/home_page.dart';
import 'package:viva_project/screens/science_page.dart';
import 'package:viva_project/screens/splash_page.dart';
import 'package:viva_project/screens/sports_page.dart';
import 'package:viva_project/screens/technology_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        'HomePage': (context) => const HomePage(),
        'DetailPage': (context) => const DetailPage(),
        'BusinessPage': (context) => const BusinessPage(),
        'EntertainmentPage': (context) => const EntertainmentPage(),
        'HealthPage': (context) => const HealthPage(),
        'SportsPage': (context) => const SportsPage(),
        'TechnologyPage': (context) => const TechnologyPage(),
        'SciencePage': (context) => const SciencePage(),
      },
    ),
  );
}
