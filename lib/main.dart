import 'package:flutter/material.dart';
import 'dart:async';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Order App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> images = [
    'assets/burger.jpg',
    'assets/kebab.jpg',
    'assets/mie ceker.jpg',
    'assets/pizza.jpg',
  ];

  int currentImageIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start automatic image switching
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              // Fullscreen background image
              Positioned.fill(
                child: Image.asset(
                  images[currentImageIndex],
                  fit: BoxFit.cover,
                ),
              ),
              // Overlay with semi-transparent background
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Food Paradise',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Discover the most delicious meals!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            ),
        );
    }
}
