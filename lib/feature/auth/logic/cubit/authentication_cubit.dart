
import 'dart:developer';



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());


  SupabaseClient client = Supabase.instance.client;


  Future<void> login({required email,required String password}) async {
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      emit(LoginSuccess());
    } on AuthException catch (error) {

      log(error.toString());

      emit(LoginError(error.message));
    } catch (error) {
      log(error.toString());
      emit(LoginError(error.toString()));
    }
  }

}
