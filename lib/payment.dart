import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final int total;

  PaymentPage({required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Payment illustration
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/payment_success.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Total amount
                  Text(
                    'Total Payment',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '\$${total.toString()}',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Pay Now Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding:
                      EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      _showPaymentSuccessDialog(context);
                    },
                    child: Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Successful! 🎉'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Thank you for your purchase!',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Go back to previous page
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
