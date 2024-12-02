import 'package:flutter/material.dart';
import 'dart:async';
import 'menu.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
                      'Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Explore your options!',
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
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                      child: Text(
                        'Go to Menu',
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
