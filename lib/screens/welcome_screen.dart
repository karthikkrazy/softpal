import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleproject/bloc/auth_bloc.dart';
import 'package:sampleproject/bloc/auth_event.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.2),
        child: Stack(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text('WELCOME TO',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/logo.jpeg'),
                  ),
                  Text('VEHICLE MANAGEMENT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white)),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(GetStartedEvent());
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
