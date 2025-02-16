import 'package:flutter/material.dart';
import 'Service_Selection_Page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*
class CarSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> carSizes = [
    {"size": "Small", "icon": Icons.directions_car_filled_rounded},
    {"size": "Medium", "icon": Icons.directions_car},
    {"size": "Large", "icon": Icons.directions_car_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/car.avif',
            height: 300,
          ),
          SizedBox(height: 20),
          Text(
            "Select Car Size:",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 25, 25, 26)),
          ),
          SizedBox(height: 20),
          ...carSizes.map((car) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton.icon(
                  icon: Icon(
                    car['icon'],
                    size: 40,
                    color: const Color.fromARGB(255, 115, 115, 109),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ServiceSelectionPage(carSize: car['size']),
                      ),
                    );
                  },
                  label: Text(
                    car['size'],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}*/
//ممتاز
/*
class CarSelectionPage extends StatefulWidget {
  @override
  _CarSelectionPageState createState() => _CarSelectionPageState();
}

class _CarSelectionPageState extends State<CarSelectionPage> {
  final List<Map<String, dynamic>> carSizes = [
    {"size": "Small", "icon": Icons.directions_car_filled_rounded},
    {"size": "Medium", "icon": Icons.directions_car},
    {"size": "Large", "icon": Icons.directions_car_outlined},
  ];

  int selectedIndex = 0;

  void _nextCarSize() {
    setState(() {
      if (selectedIndex < carSizes.length - 1) {
        selectedIndex++;
      }
    });
  }

  void _previousCarSize() {
    setState(() {
      if (selectedIndex > 0) {
        selectedIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Wash App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Expanded to make the image take more vertical space
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/car_1.jpeg', // Your image path
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Wash your worries away with your car!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 121, 121, 128),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Save your time and effort",
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(242, 30, 9, 214),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Social media icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.apple_outlined, size: 40),
                  onPressed: () {
                    // Add action for Apple link
                  },
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.android, size: 40),
                  onPressed: () {
                    // Add action for Android link
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Car size selection with arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Previous arrow
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: _previousCarSize,
                  iconSize: 30,
                ),
                SizedBox(width: 10),
                // Selected car size
                ElevatedButton.icon(
                  icon: Icon(
                    carSizes[selectedIndex]['icon'],
                    size: 40,
                    color: const Color.fromARGB(255, 116, 116, 112),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ServiceSelectionPage(
                            carSize: carSizes[selectedIndex]['size']),
                      ),
                    );
                  },
                  label: Text(
                    carSizes[selectedIndex]['size'],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(width: 10),
                // Next arrow
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: _nextCarSize,
                  iconSize: 30,
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
*/

// Assuming you have this page
//ممتاز

class CarSelectionPage extends StatefulWidget {
  @override
  _CarSelectionPageState createState() => _CarSelectionPageState();
}

class _CarSelectionPageState extends State<CarSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wash Master'),
        titleTextStyle: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(195, 33, 33, 33),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Expanded to make the image take more vertical space
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'images/car_3.jpg', // Your image path
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  /* Positioned.fill(
                    child: Container(
                      color: const Color.fromARGB(18, 192, 190, 190)
                          .withOpacity(0.4),
                      // تظليل رمادي شفاف
                    ),
                  ),*/
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "welcome! Are you ready to give your car the care it deserves? Book your car service today! ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 230, 226, 226),
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: const Color.fromARGB(255, 6, 4, 0),
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Save your time and effort",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(244, 217, 53, 8),
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: const Color.fromARGB(255, 1, 4, 10),
                              offset: Offset(1, 2),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Social media icons using Font Awesome Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook,
                      size: 30, color: Colors.blue),
                  onPressed: () {
                    // Add action for Facebook link
                  },
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.xTwitter,
                      size: 30, color: const Color.fromARGB(255, 19, 19, 19)),
                  onPressed: () {
                    // Add action for Twitter link
                  },
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.instagram,
                      size: 35, color: Colors.purple),
                  onPressed: () {
                    // Add action for Instagram link
                  },
                ),
              ],
            ),
            SizedBox(height: 30),

            // Start button with more attractive design
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      var serviceSelectionPage2 = ServiceSelectionPage(
                        carSize: "Medium",

                        // You can set any default value here
                      );
                      var serviceSelectionPage = serviceSelectionPage2;
                      return serviceSelectionPage;
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 61),
                backgroundColor: const Color.fromARGB(
                    223, 240, 191, 11), // More attractive color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 10, // Add elevation for shadow effect
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

/*
class ServiceSelectionPage extends StatelessWidget {
  final String carSize;

  ServiceSelectionPage({required this.carSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية: الصورة
          Positioned.fill(
            child: Image.asset(
              'assets/your_image.jpg', // استبدل هذا بمسار صورتك
              fit: BoxFit.cover, // لجعل الصورة تغطي الشاشة بالكامل
            ),
          ),
          // طبقة التظليل الرمادي الفاتح
          Positioned.fill(
            child: Container(
              color: Colors.grey.withOpacity(0.4), // تظليل رمادي شفاف
            ),
          ),
          // المحتوى فوق الصورة والتظليل
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // لون النص
                  ),
                ),
                SizedBox(height: 30),
                // زر "Get Started" بتصميم جذاب
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          var serviceSelectionPage2 = ServiceSelectionPage(
                            carSize: "Medium",
                          );
                          var serviceSelectionPage = serviceSelectionPage2;
                          return serviceSelectionPage;
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 61), // توسيع الحواف
                    backgroundColor: const Color.fromARGB(
                        223, 240, 191, 11), // لون جذاب للزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // زوايا دائرية
                    ),
                    elevation: 10, // إضافة ظل للزر
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white, // لون النص على الزر
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/