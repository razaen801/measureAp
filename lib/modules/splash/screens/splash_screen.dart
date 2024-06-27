import 'package:flutter/material.dart';
import 'package:measure_ap/modules/dashboard/screens/dashboard.dart';
import 'package:measure_ap/modules/splash/widgets/splash_container.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToDashboard();
  }

  _navigateToDashboard() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushNamedAndRemoveUntil(Dashboard.routeName, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashContainer();
  }
}
