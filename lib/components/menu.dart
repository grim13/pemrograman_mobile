import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/components/menuItem.dart';
import 'package:pemrograman_mobile/screens/payment_screen.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuItem("Payment", "P", PaymentScreen.routeName),
        MenuItem("History", "H", PaymentScreen.routeName),
        MenuItem("Notif", "N", PaymentScreen.routeName),
      ],
    );
  }
}
