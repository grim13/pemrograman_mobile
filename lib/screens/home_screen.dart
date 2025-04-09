import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/components/header.dart';
import 'package:pemrograman_mobile/components/menu.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Programming"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Column(children: [HeaderWidget(), Menu()]),
    );
  }
}
