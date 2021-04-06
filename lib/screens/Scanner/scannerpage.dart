import 'package:flutter/material.dart';
import 'component/Body.dart';

class ScannerPage extends StatelessWidget {
  static String routeName = "/scanner_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
      body: Body(),
    );
  }
}
