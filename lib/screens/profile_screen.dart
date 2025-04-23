import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(child: Text('Profile Screen')),
    );
  }
}
