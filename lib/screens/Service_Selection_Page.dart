import 'package:flutter/material.dart';
import '../../widgets/confirmation.dart';

class ServiceSelectionPage extends StatefulWidget {
  final String carSize;

  ServiceSelectionPage({required this.carSize});

  @override
  _ServiceSelectionPageState createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
  Map<String, bool> services = {
    "Oil Change": false,
    "Car Wash": false,
    "Tire Change": false,
    "Interior Cleaning": false,
    "Engine Check": false,
    "Battery Replacement": false,
    "AC Cleaning": false,
    "Waxing": false,
    "Detailing": false,
  };

  String selectedCarSize = "Small";

  final List<Map<String, dynamic>> carSizes = [
    {"size": "Small", "icon": Icons.directions_car_filled_rounded},
    {"size": "Medium", "icon": Icons.directions_car},
    {"size": "Large", "icon": Icons.directions_car_outlined},
  ];

  final Map<String, String> serviceImages = {
    "Oil Change": "images/Oil_Change.jpeg",
    "Car Wash": "images/Car_Wash.jpg",
    "Tire Change": "images/Tire_Change.jpeg",
    "Interior Cleaning": "images/Interior_Cleaning.jpeg",
    "Engine Check": "images/Enging_Check.jpeg",
    "Battery Replacement": "images/Battery_rep.jpeg",
    "AC Cleaning": "images/AC_Cleaning.jpeg",
    "Waxing": "images/Waxing.jpeg",
    "Detailing": "images/Detailing.jpeg",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Services"),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(195, 223, 222, 219),
        ),
        backgroundColor: const Color.fromARGB(255, 85, 87, 92),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Larger image section (car image)
              Container(
                height:
                    280, // Set a height to the image container for proper display
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('images/car2_2.jpg'), // صورة السيارة الكبيرة
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                    ),
                    Text(
                      "Select Your Car Size    and services you want",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              // Car size selection with Radio buttons in a row (below image)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: carSizes.map((car) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                      ), // المسافة
                      Icon(
                        car['icon'],
                        size: 40,
                        color: selectedCarSize == car['size']
                            ? const Color.fromARGB(223, 240, 191, 11)
                            : Colors.grey,
                      ),
                      SizedBox(height: 8),
                      Text(car['size']),
                      Radio<String>(
                        value: car['size'],
                        groupValue: selectedCarSize,
                        onChanged: (value) {
                          setState(() {
                            selectedCarSize = value!;
                          });
                        },
                      ),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              // Text showing car size
              Padding(
                padding: const EdgeInsets.all(16.0),
              ),

              // Grid for services (now scrollable within the page)
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics:
                    NeverScrollableScrollPhysics(), // Prevents inner scrolling
                shrinkWrap: true, // Ensures GridView takes only necessary space
                children: services.keys.map((service) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        services[service] = !services[service]!;
                      });
                    },
                    child: InkWell(
                      splashColor: const Color.fromARGB(255, 255, 68, 199),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: services[service]!
                              ? Border.all(
                                  color: Colors.green,
                                  width: 4.0) // إطار أخضر عند التحديد
                              : Border.all(
                                  color: Colors.transparent,
                                  width: 0.0), // بدون إطار عند عدم التحديد
                        ),
                        child: Stack(
                          children: [
                            // Image as background
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  serviceImages[service]!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Service name text
                            Center(
                              child: Text(
                                service,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              // Confirmation button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmationPage(
                          carSize: widget.carSize,
                          selectedServices: services.entries
                              .where((entry) => entry.value)
                              .map((entry) => entry.key)
                              .toList(),
                        ),
                      ),
                    );
                  },
                  child: Text("Confirm Order",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 191, 152, 9))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
















































































//ممتاز
/*
class ServiceSelectionPage extends StatefulWidget {
  final String carSize;

  ServiceSelectionPage({required this.carSize});

  @override
  _ServiceSelectionPageState createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
  final Map<String, bool> services = {
    "Oil Change": false,
    "Car Wash": false,
    "Tire Change": false,
    "Interior Cleaning": false,
    "Engine Check": false,
    "Battery Replacement": false,
    "AC Cleaning": false,
    "Waxing": false,
    "Detailing": false,
  };

  final Map<String, String> serviceImages = {
    "Oil Change": "images/Oil_Change.jpeg",
    "Car Wash": "images/Car_Wash.jpg",
    "Tire Change": "images/Tire_Change.jpeg",
    "Interior Cleaning": "images/Interior_Cleaning.jpeg",
    "Engine Check": "images/Enging_Check.jpeg",
    "Battery Replacement": "images/Battery_rep.jpeg",
    "AC Cleaning": "images/AC_Cleaning.jpeg",
    "Waxing": "images/Waxing.jpeg",
    "Detailing": "images/Detailing.jpeg",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Services"),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Car Size: ${widget.carSize}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[900]),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // عدد الأعمدة في الشبكة
                crossAxisSpacing: 10, // المسافة الأفقية بين الأعمدة
                mainAxisSpacing: 10, // المسافة الرأسية بين الصفوف
                children: services.keys.map((service) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        services[service] = !services[service]!;
                      });
                    },
                    child: InkWell(
                      splashColor: const Color.fromARGB(255, 255, 68, 199),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !services[service]!
                              ? Colors.blueAccent[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: !services[service]!
                                ? [
                                    const Color.fromARGB(131, 192, 35, 156),
                                    const Color.fromARGB(255, 175, 59, 154)
                                  ]
                                : [
                                    const Color.fromARGB(160, 152, 128, 148),
                                    const Color.fromARGB(255, 160, 131, 152),
                                  ],
                          ),
                        ),
                        child: Stack(
                          children: [
                            // الصورة كغلاف (Cover)
                            Positioned.fill(
                              child: Image.asset(
                                serviceImages[service]!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // لون شفاف فوق الصورة
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: !services[service]!
                                      ? const Color.fromARGB(0, 5, 248, 74)
                                      : Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                            // النص فوق الصورة
                            Center(
                              child: Text(
                                service,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 234, 235, 240),
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: const Color.fromARGB(
                                          255, 11, 52, 212),
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationPage(
                        carSize: widget.carSize,
                        selectedServices: services.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Text("Confirm Order", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/








/*

class ServiceSelectionPage extends StatefulWidget {
  final String carSize;

  ServiceSelectionPage({required this.carSize});

  @override
  _ServiceSelectionPageState createState() => _ServiceSelectionPageState();
}

class _ServiceSelectionPageState extends State<ServiceSelectionPage> {
  final Map<String, bool> services = {
    "Oil Change": false,
    "Car Wash": false,
    "Tire Change": false,
    "Interior Cleaning": false,
    "Engine Check": false,
    "Battery Replacement": false,
    "AC Cleaning": false,
    "Waxing": false,
    "Detailing": false,
  };

  final Map<String, String> serviceImages = {
    "Oil Change": "images/Oil_Change.jpeg",
    "Car Wash": "images/Car_Wash.jpg",
    "Tire Change": "images/Tire_Change.jpeg",
    "Interior Cleaning": "images/Interior_Cleaning.jpeg",
    "Engine Check": "images/Enging_Check.jpeg",
    "Battery Replacement": "images/Battery_rep.jpeg",
    "AC Cleaning": "images/AC_Cleaning.jpeg",
    "Waxing": "images/Waxing.jpeg",
    "Detailing": "images/Detailing.jpeg",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Services"),
        backgroundColor: Colors.blueAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Car Size: ${widget.carSize}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[900]),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: services.keys.map((service) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        services[service] = !services[service]!;
                      });
                    },
                    child: InkWell(
                      splashColor: const Color.fromARGB(255, 255, 68, 199),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !services[service]!
                              ? Colors.blueAccent[100]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: !services[service]!
                                ? [
                                    const Color.fromARGB(131, 192, 35, 156),
                                    const Color.fromARGB(255, 175, 59, 154)
                                  ]
                                : [
                                    const Color.fromARGB(160, 152, 128, 148),
                                    const Color.fromARGB(255, 160, 131, 152),
                                  ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              serviceImages[service]!,
                              height: 150,
                              width: 180,
                            ),
                            SizedBox(height: 10),
                            Text(
                              service,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationPage(
                        carSize: widget.carSize,
                        selectedServices: services.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList(),
                      ),
                    ),
                  );
                },
                child: Text("Confirm Order", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
