import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:measure_ap/constants/theme_helper.dart';
import 'package:measure_ap/core/firebase/firebase_helper.dart';
import 'package:measure_ap/modules/dashboard/screens/dashboard.dart';
import 'package:measure_ap/modules/questionnaire/screens/questionnaire_screen.dart';
import 'package:measure_ap/modules/splash/screens/splash_screen.dart';

import 'modules/new_assessment/screens/assessment_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // only setup for android
  await Firebase.initializeApp(options: FirebaseDatabaseHelper.android);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeasureAp',
      theme: basicTheme,
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        Dashboard.routeName: (context) => const Dashboard(),
        NewAssessmentScreen.routeName: (context) => const NewAssessmentScreen(),
        QuestionnaireScreen.routeName: (context) => const QuestionnaireScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
