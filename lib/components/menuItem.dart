import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String icon;
  final String routeName;
  const MenuItem(this.title, this.icon, this.routeName, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
        ),
        child: Center(
          child: Column(
            children: [
              Text(icon, style: TextStyle(fontSize: 40)),
              Text(title, style: TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
