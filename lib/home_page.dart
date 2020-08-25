import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'generator.dart';
import 'scanner.dart';
import 'component/button.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        title: Text('Scan It', style: TextStyle(color: Color(0xff616161))),
        centerTitle: true,
        backgroundColor: Color(0xffeeeeee),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BuildButton(
                text: 'Scan',
                onPressed: () {
                  Navigator.pushNamed(context, QrScanner.id);
                }),
            BuildButton(
                text: 'Genereate',
                onPressed: () {
                  Navigator.pushNamed(context, QrGenerator.id);
                }),
          ],
        ),
      ),
    ));
  }
}
