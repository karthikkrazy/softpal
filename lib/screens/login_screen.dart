import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleproject/bloc/auth_state.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        appBar: null,
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return Center(child: Text(state.error));
            } else {
              return Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      // borderRadius: BorderRadius.only(
                      //   bottomLeft: Radius.circular(100),
                      //   bottomRight: Radius.circular(100),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/logo.jpeg'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: 60,
                        //   child: Card(
                        //     elevation: 10,
                        //     color: Colors.white,
                        //     child: ListTile(
                        //       title: Center(
                        //         child: Text(
                        //           'Sign In',
                        //           style: TextStyle(
                        //               fontSize: 20,
                        //               fontWeight: FontWeight.bold),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            "Login in to your account",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextField(
                          controller: usernameController,
                          decoration: InputDecoration(
                              labelText: 'Employee ID',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.email_outlined)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock_outline)),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
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
                              final username = usernameController.text;
                              final password = passwordController.text;
                              BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                                  username: username, password: password));
                              Navigator.pushNamed(context, '/dashboard');
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
