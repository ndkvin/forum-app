import 'package:flutter/material.dart';
import 'appDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
} 

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext contect) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Text('Home'),
      drawer: const AppDrawer(),
    );
  }
}