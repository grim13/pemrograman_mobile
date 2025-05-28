import 'package:flutter/material.dart';
import 'package:pemrograman_mobile/components/header.dart';
import 'package:pemrograman_mobile/components/menu.dart';
import 'package:pemrograman_mobile/services/auth.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic? _loginInfo;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    _loginInfo = await AuthService().getProfile();
    print(_loginInfo?['firstName']);
    setState(() {});
    // Initialize any necessary data or state here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Programming"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Column(children: [HeaderWidget(_loginInfo), Menu()]),
    );
  }
}
