import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/home.dart';
import 'screen/register.dart';
import 'screen/login.dart';
import 'screen/profile.dart';
import 'api/auth.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Auth(),
      child: MaterialApp(
        home: const HomeScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/register': (context) => const RegisterScreen(),
          '/login': (context) => const LoginScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    )
  );
}