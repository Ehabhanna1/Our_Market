import 'dart:developer';

import 'package:ecommerce_app/feature/auth/data/models/users_model.dart';
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
      await getUserData();
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
  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    try {
      await client.auth.signUp(password: password, email: email);

      // note you can show a loading indicator here to add user data first ,then sinup success

      await addedUserData(email: email, name: name);
      await getUserData();
      emit(SignUpSuccess());

      /// end
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

    const webClientId =
        '737722342128-v332ndp6j1lck111a6gi2e685lnpc07i.apps.googleusercontent.com';

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
    await addedUserData(
        email: googleUser!.email, name: googleUser!.displayName!);
    await getUserData();
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
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(ResetPasswordSuccess());
    } catch (e) {
      log(e.toString());
      emit(ResetPasswordError());
    }
  }

  // inset => add user data
  // upsert => add or update user data
  Future<void> addedUserData(
      {required String email, required String name}) async {
    emit(UserDataAddedLoading());
    try {
      await client.from('users').upsert({
        "user_id": client.auth.currentUser!.id,
        "user_name": name,
        "user_email": email
      });

      emit(UserDataAddedSuccess());
    } catch (e) {
      log(e.toString());
      emit(UserDataAddedError());
    }
  }

  // get user data

  UsersDataModel? usersDataModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final data = await client
          .from('users')
          .select()
          .eq("user_id", client.auth.currentUser!.id);
      usersDataModel = UsersDataModel(
          userId: data[0]['user_id'],
          name: data[0]['user_name'],
          email: data[0]['user_email']);
      log(data.toString());
      emit(GetUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetUserDataError());
    }
  }
}
