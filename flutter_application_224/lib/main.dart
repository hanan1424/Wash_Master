import 'dart:math';
import 'package:flutter/material.dart';

/*
void main() {
  runApp(CarServiceApp());
}

class CarServiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo[800],
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
        
          
          ),
        ),
        body: CarSelectionPage(),
      ),
    );
  }
}

// الصفحة الأولى: اختيار حجم السيارة مع الأيقونات
class CarSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> carSizes = [
    {"size": "Small", "icon": Icons.directions_car_filled_rounded},
    {"size": "Medium", "icon": Icons.directions_car_filled_outlined},
    {"size": "Large", "icon": Icons.directions_car},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.car_repair,
            size: 100,
            color: Colors.indigo[800],
          ),
          SizedBox(height: 20),
          Text(
            "Select Car Size:",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800]),
          ),
          SizedBox(height: 20),
          ...carSizes.map((car) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton.icon(
                  icon: Icon(
                    car['icon'],
                    size: 40,
                    color: Colors.amber[600],
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
}
/*
// الصفحة الثانية: اختيار الخدمات مع الأيقونات
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

  final Map<String, IconData> serviceIcons = {
    "Oil Change": Icons.oil_barrel,
    "Car Wash": Icons.local_car_wash,
    "Tire Change": Icons.settings,
    "Interior Cleaning": Icons.cleaning_services,
    "Engine Check": Icons.engineering,
    "Battery Replacement": Icons.battery_alert,
    "AC Cleaning": Icons.ac_unit,
    "Waxing": Icons.auto_awesome,
    "Detailing": Icons.auto_fix_high,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Services"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Car Size: ${widget.carSize}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900]),
            ),
          ),
          Expanded(
            child: ListView(
              children: services.keys.map((service) {
                return CheckboxListTile(
                  title: Text(service),
                  secondary:
                      Icon(serviceIcons[service], color: Colors.amber[600]),
                  value: services[service],
                  onChanged: (bool? value) {
                    setState(() {
                      services[service] = value!;
                    });
                  },
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
              child: Text("Confirm Order"),
            ),
          ),
        ],
      ),
    );
  }
}*/


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

  final Map<String, IconData> serviceIcons = {
    "Oil Change": Icons.oil_barrel,
    "Car Wash": Icons.local_car_wash,
    "Tire Change": Icons.settings,
    "Interior Cleaning": Icons.cleaning_services,
    "Engine Check": Icons.engineering,
    "Battery Replacement": Icons.battery_alert,
    "AC Cleaning": Icons.ac_unit,
    "Waxing": Icons.auto_awesome,
    "Detailing": Icons.auto_fix_high,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Services"),
        backgroundColor: Colors.indigo[800],
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
                    color: Colors.indigo[900]),
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
                        services[service] =
                            !services[service]!; // تغيير حالة الخدمة عند الضغط
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: !services[service]!
                            ? Colors.indigo[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: !services[service]!
                              ? Colors.indigo[800]!
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            serviceIcons[service],
                            size: 50,
                            color: Colors.amber[600],
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
                child: Text("Confirm Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// الصفحة الثالثة: تأكيد الطلب مع إضافة TimePicker وطلب رقم عشوائي
class ConfirmationPage extends StatefulWidget {
  final String carSize;
  final List<String> selectedServices;

  ConfirmationPage({required this.carSize, required this.selectedServices});

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  int orderNumber = Random().nextInt(9000) + 1000;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Car Size: ${widget.carSize}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Selected Services:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...widget.selectedServices.map((service) =>
                Text("- $service", style: TextStyle(fontSize: 18))),
            SizedBox(height: 20),
            Text(
              "Order Number: $orderNumber",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Selected Time: ${selectedTime.format(context)}",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text("Select Time"),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Confirm Order"),
                    content: Text("Are you sure you want to place the order?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()),
                          );
                        },
                        child: Text("Yes"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// الصفحة الرابعة: الدفع
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Process"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.payment,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              "Order Confirmed!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}



import 'dart:math';

void main() {
  runApp(CarServiceApp());
}

class CarServiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo[800],
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('WashMaster'),
          backgroundColor: Colors.indigo[800],
          leading: Padding(
            padding: EdgeInsets.only(left: 5.5),
            child: Icon(
              Icons.directions_car_rounded,
              size: 30,
              color: Colors.amber[600],
            ),
          ),
        ),
        body: CarSelectionPage(),
      ),
    );
  }
}

// الصفحة الأولى: اختيار حجم السيارة مع الأيقونات
class CarSelectionPage extends StatelessWidget {
  final List<Map<String, dynamic>> carSizes = [
    {"size": "Small", "icon": Icons.directions_car_filled_rounded},
    {"size": "Medium", "icon": Icons.directions_car_outlined},
    {"size": "Large", "icon": Icons.directions_car},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/car_image.png', // استبدل هذا المسار بالصورة المناسبة
            height: 100,
          ),
          SizedBox(height: 20),
          Text(
            "Select Car Size:",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900]),
          ),
          SizedBox(height: 20),
          ...carSizes.map((car) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton.icon(
                  icon: Icon(
                    car['icon'],
                    size: 40,
                    color: Colors.amber[600],
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
}

// الصفحة الثانية: اختيار الخدمات مع الأيقونات
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

  final Map<String, IconData> serviceIcons = {
    "Oil Change": Icons.oil_barrel,
    "Car Wash": Icons.local_car_wash,
    "Tire Change": Icons.settings,
    "Interior Cleaning": Icons.cleaning_services,
    "Engine Check": Icons.engineering,
    "Battery Replacement": Icons.battery_alert,
    "AC Cleaning": Icons.ac_unit,
    "Waxing": Icons.auto_awesome,
    "Detailing": Icons.auto_fix_high,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Services"),
        backgroundColor: Colors.indigo[800],
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
                    color: Colors.indigo[900]),
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
                        services[service] =
                            !services[service]!; // تغيير حالة الخدمة عند الضغط
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: !services[service]!
                            ? Colors.indigo[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: !services[service]!
                              ? Colors.indigo[800]!
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            serviceIcons[service],
                            size: 50,
                            color: Colors.amber[600],
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
                child: Text("Confirm Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// الصفحة الثالثة: تأكيد الطلب مع إضافة TimePicker وطلب رقم عشوائي
class ConfirmationPage extends StatefulWidget {
  final String carSize;
  final List<String> selectedServices;

  ConfirmationPage({required this.carSize, required this.selectedServices});

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  int orderNumber = Random().nextInt(9000) + 1000;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Car Size: ${widget.carSize}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Selected Services:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...widget.selectedServices.map((service) =>
                Text("- $service", style: TextStyle(fontSize: 18))),
            SizedBox(height: 20),
            Text(
              "Order Number: $orderNumber",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Selected Time: ${selectedTime.format(context)}",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text("Select Time"),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Confirm Order"),
                    content: Text("Are you sure you want to place the order?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()),
                          );
                        },
                        child: Text("Yes"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// الصفحة الرابعة: الدفع
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Process"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.payment,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              "Order Confirmed!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}*/

void main() {
  runApp(CarServiceApp());
}

class CarServiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.indigo[800],
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('WashMaster'),
          backgroundColor: Colors.indigo[800],
          leading: Padding(
            padding: EdgeInsets.only(left: 5.5),
            child: Icon(
              Icons.directions_car_rounded,
              size: 30,
              color: Colors.amber[600],
            ),
          ),
        ),
        body: CarSelectionPage(),
      ),
    );
  }
}

// الصفحة الأولى: اختيار حجم السيارة مع الأيقونات
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
            'assets/car_image.png', // استبدل هذا المسار بالصورة المناسبة
            height: 100,
          ),
          SizedBox(height: 20),
          Text(
            "Select Car Size:",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900]),
          ),
          SizedBox(height: 20),
          ...carSizes.map((car) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton.icon(
                  icon: Icon(
                    car['icon'],
                    size: 40,
                    color: Colors.amber[600],
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
}

// الصفحة الثانية: اختيار الخدمات مع الأيقونات
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

  final Map<String, IconData> serviceIcons = {
    "Oil Change": Icons.oil_barrel,
    "Car Wash": Icons.local_car_wash,
    "Tire Change": Icons.settings,
    "Interior Cleaning": Icons.cleaning_services,
    "Engine Check": Icons.engineering,
    "Battery Replacement": Icons.battery_alert,
    "AC Cleaning": Icons.ac_unit,
    "Waxing": Icons.auto_awesome,
    "Detailing": Icons.auto_fix_high,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Services"),
        backgroundColor: const Color.fromARGB(255, 40, 147, 97),
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
                    color: Colors.indigo[900]),
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
                        services[service] =
                            !services[service]!; // تغيير حالة الخدمة عند الضغط
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: !services[service]!
                            ? Colors.indigo[100]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: !services[service]!
                              ? Colors.indigo[800]!
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            serviceIcons[service],
                            size: 50,
                            color: Colors.amber[600],
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
                child: Text("Confirm Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// الصفحة الثالثة: تأكيد الطلب مع إضافة TimePicker وطلب رقم عشوائي
class ConfirmationPage extends StatefulWidget {
  final String carSize;
  final List<String> selectedServices;

  ConfirmationPage({required this.carSize, required this.selectedServices});

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  int orderNumber = Random().nextInt(9000) + 1000;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Order"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Car Size: ${widget.carSize}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Selected Services:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...widget.selectedServices.map((service) =>
                Text("- $service", style: TextStyle(fontSize: 18))),
            SizedBox(height: 20),
            Text(
              "Order Number: $orderNumber",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Selected Time: ${selectedTime.format(context)}",
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text("Select Time"),
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Confirm Order"),
                    content: Text("Are you sure you want to place the order?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentPage()),
                          );
                        },
                        child: Text("Yes"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Place Order"),
            ),
          ],
        ),
      ),
    );
  }
}

// الصفحة الرابعة: الدفع
class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Process"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.payment,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              "Order Confirmed!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
