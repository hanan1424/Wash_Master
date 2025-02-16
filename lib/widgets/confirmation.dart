import 'dart:math';
import 'package:flutter/material.dart';
import '../../evaluation/rating_page.dart';

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
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(195, 223, 222, 219),
        ),
        backgroundColor: const Color.fromARGB(255, 98, 101, 106),
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
                  color: const Color.fromARGB(254, 240, 190, 11)),
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
                    child: Text(
                      "Select Time",
                      style: TextStyle(
                        color: Color.fromARGB(255, 152, 120, 3),
                      ),
                    )),
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
                                  builder: (context) => RatingPage()),
                            );
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              color: Color.fromARGB(255, 175, 138, 6),
                            ),
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Color.fromARGB(255, 175, 138, 6)),
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Text(
                "Place Order",
                style: TextStyle(color: Color.fromARGB(255, 152, 120, 3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
