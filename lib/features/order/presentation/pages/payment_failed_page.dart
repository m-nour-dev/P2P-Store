import 'dart:async';
import 'package:flutter/material.dart';

class PaymentFailedPage extends StatefulWidget {
  const PaymentFailedPage({super.key});

  @override
  State<PaymentFailedPage> createState() => _PaymentFailedPageState();
}

class _PaymentFailedPageState extends State<PaymentFailedPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cancel_rounded,
              color: Colors.redAccent,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Payment failed!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(color: Colors.redAccent),
          ],
        ),
      ),
    );
  }
}
