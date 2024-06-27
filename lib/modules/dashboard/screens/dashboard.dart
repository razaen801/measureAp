import 'package:flutter/material.dart';
import 'package:measure_ap/constants/colors_sizes.dart';
import 'package:measure_ap/modules/history/screens/history_screen.dart';
import 'package:measure_ap/modules/home/screens/home_screen.dart';
import 'package:measure_ap/modules/patients/screens/patients_screen.dart';
import 'package:measure_ap/modules/settings/screens/history_screen.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final int _finalItemIndex = 4;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void _onItemTapped(int index) {
    if (index == _finalItemIndex) {
      _key.currentState!.openDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PatientScreen(),
    HistoryScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            _getNavigationItem(Icons.home_outlined, "Home"),
            _getNavigationItem(Icons.people_alt_outlined, "Patients"),
            _getNavigationItem(Icons.history, "History"),
            _getNavigationItem(Icons.settings_outlined, "Settings"),
          ],
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.black54,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  _getNavigationItem(IconData iconData, String label) {
    return BottomNavigationBarItem(
      icon: Icon(iconData),
      label: label,
      tooltip: label,
    );
  }
}
