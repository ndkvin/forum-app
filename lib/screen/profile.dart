import 'package:flutter/material.dart';
import 'appDrawer.dart';
import 'flush.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Builder(

        builder: (scafoldContext) {
          showFlushMsg(context, scafoldContext);
          return const Text(
            'My Profile'
          );
        }
      ),
      drawer: const AppDrawer(),
    );
  }
}