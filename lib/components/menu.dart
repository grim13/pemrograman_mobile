import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/components/menuItem.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MenuItem("Payment", "P"),
        MenuItem("History", "H"),
        MenuItem("Notif", "N"),
      ],
    );
  }
}
