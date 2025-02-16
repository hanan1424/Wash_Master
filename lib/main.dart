import 'package:flutter/material.dart';
import 'package:flutter_application_24/evaluation/rating_page.dart';
import 'package:flutter_application_24/screens/Service_Selection_Page.dart';
import 'package:flutter_application_24/screens/car_selection_page.dart';
import 'package:flutter_application_24/widgets/confirmation.dart';

void main() {
  runApp(MyApp());
}

/////////

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  // الصفحات التي سيتم التنقل بينها
  final List<Widget> _pages = [
    CarSelectionPage(),
    ServiceSelectionPage(carSize: "Medium"),
    ConfirmationPage(carSize: "Medium", selectedServices: ["Oil Change"]),
    RatingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: "Car Selection",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: "Service Selection",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num),
              label: "Confirmation",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Rating",
            ),
          ],
          selectedItemColor: const Color.fromARGB(223, 240, 191, 11),
          unselectedItemColor: const Color.fromARGB(207, 10, 10, 10),
        ),
      ),
    );
  }
}
