import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  static String routeName = '/payment';
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(child: Text('Payment Page')),
    );
  }
}
