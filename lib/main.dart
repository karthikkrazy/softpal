import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleproject/bloc/auth_bloc.dart';
import 'package:sampleproject/screens/welcome_screen.dart';
import 'package:sampleproject/screens/login_screen.dart';
import 'package:sampleproject/screens/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BLoC Example',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: WelcomeScreen(),
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
      },
    );
  }
}
