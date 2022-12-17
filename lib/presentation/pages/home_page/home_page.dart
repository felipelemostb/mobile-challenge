import 'package:flutter/material.dart';
import 'package:mobile_challenge/presentation/components/app_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppHeader(
      title: 'MENU',
      child: Container(),
    );
  }
}
