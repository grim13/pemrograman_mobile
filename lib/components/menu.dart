import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/components/menuItem.dart';
import 'package:pemrograman_mobile/screens/payment_screen.dart';
import 'package:pemrograman_mobile/screens/profile_screen.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuItem(
          "Payment",
          "assets/icons/payment.png",
          PaymentScreen.routeName,
        ),
        MenuItem(
          "History",
          "assets/icons/history.png",
          PaymentScreen.routeName,
        ),
        MenuItem(
          "Profile",
          "assets/icons/profile.png",
          ProfileScreen.routeName,
        ),
      ],
    );
  }
}
