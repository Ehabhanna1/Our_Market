
import 'dart:developer';




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());


  SupabaseClient client = Supabase.instance.client;

 Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(password: password, email: email);
      
      emit(LoginSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(LoginError(e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginError(e.toString()));
    }
  }
   // Sign up 
    Future<void> signUp (
      {required String name,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    try {
      await client.auth.signUp(password: password, email: email);
     
      emit(SignUpSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(SignUpError(e.message));
    } catch (e) {
      log(e.toString());
      emit(SignUpError(e.toString()));
    }
  }

  // google
   GoogleSignInAccount? googleUser;
  Future<AuthResponse> googleSignIn() async {
    emit(GoogleSignInLoading());

const webClientId = '737722342128-v332ndp6j1lck111a6gi2e685lnpc07i.apps.googleusercontent.com';
    

    final GoogleSignIn googleSignIn = GoogleSignIn(
      // clientId: iosClientId,
      serverClientId: webClientId,
    );
    googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return AuthResponse();
    }
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogleSignInError());
      return AuthResponse();
    }

    AuthResponse response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    

    emit(GoogleSignInSuccess());
    return response;
  }

  Future<void> logOut() async {
    emit(LogOutLoading());
    try {
      await client.auth.signOut();
      emit(LogOutSuccess());
    } catch (e) {
      log(e.toString());
      emit(LogOutError());
    }
    
    
  }
  Future<void> resetPassword({required String email}) async {

    emit(ResetPasswordLoading());
    try{
      await client.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    }catch(e){
      log(e.toString());
      emit(ResetPasswordError());
    }



  }




}







