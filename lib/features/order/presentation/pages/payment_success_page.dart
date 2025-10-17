import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:p2p_store/features/order/presentation/manager/product_cubit.dart';
import 'package:p2p_store/features/order/presentation/pages/my_old_requests.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() => _opacity = 1.0);
    });

    Timer(const Duration(seconds: 5), () {
      context.read<ProductCubit>().addProductToMyOldRequests();

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyOldRequests()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromRGBO(248, 55, 88, 1),
                child: Icon(Icons.check, color: Colors.white, size: 40),
              ),
              SizedBox(height: 20),
              Text(
                'Payment done successfully.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Redirecting...',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
