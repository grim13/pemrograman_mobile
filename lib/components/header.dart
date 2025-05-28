import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  dynamic? _loginInfo;
  HeaderWidget(dynamic? loginInfo, {super.key}) : _loginInfo = loginInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: EdgeInsets.only(bottom: 0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(width: 30, color: Colors.amberAccent),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Selamat Datang di App", style: TextStyle(fontSize: 30)),
            SizedBox(height: 3),
            Text(
              _loginInfo != null && _loginInfo['firstName'] != null
                  ? _loginInfo['firstName']
                  : '',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
