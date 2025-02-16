import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate Our Service"),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: const Color.fromARGB(195, 223, 222, 219),
        ),
        backgroundColor: const Color.fromARGB(255, 85, 87, 92),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How was your experience?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    size: 40,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text(
              "Rating: $_rating",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Thank you!"),
                      content: Text("Your rating: $_rating stars"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 175, 138, 6)),
                            )),
                      ],
                    ),
                  );
                },
                child: Text(
                  "Submit Rating",
                  style: TextStyle(
                    color: Color.fromARGB(255, 152, 120, 3),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
