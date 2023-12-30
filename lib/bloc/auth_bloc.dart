import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/authentication_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  AuthBloc() : super(InitialState()) {
    on<GetStartedEvent>((event, emit) {
      emit(InitialState());
    });

    on<LoginEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final response = await _authenticationRepository.login(
          username: event.username,
          password: event.password,
        );

        saveDataLocally(response);
        print("$response from on loginevent");
        emit(SuccessState(data: response));
      } catch (error) {
        emit(ErrorState(error: 'Failed to log in'));
      }
    });
  }
  void saveDataLocally(dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', data.toString());
  }
}
