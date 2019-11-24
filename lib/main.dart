import 'package:flutter/material.dart';
import 'package:test_wai_kuai/Pages/BothUserCompany/HomeContent.dart';
import 'package:test_wai_kuai/Pages/BothUserCompany/OldHomeContent.dart';
import 'Pages/BothUserCompany/MainNavigationBar.dart';

void main() => runApp(new MainIntrance());

class MainIntrance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: HomeContent(),
    );
  }
}