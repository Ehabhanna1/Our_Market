part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
// login states
final class LoginSuccess extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginError extends AuthenticationState {
  final String message;
  LoginError(this.message);
}

// sign up states
final class SignUpSuccess extends AuthenticationState {}

final class SignUpLoading extends AuthenticationState {}

final class SignUpError extends AuthenticationState {
  final String message;
  SignUpError(this.message);
}

// google sign in states
final class GoogleSignInSuccess extends AuthenticationState {}

final class GoogleSignInLoading extends AuthenticationState {}

final class GoogleSignInError extends AuthenticationState {}

// Sign out states
final class LogOutSuccess extends AuthenticationState {}

final class LogOutLoading extends AuthenticationState {}

final class LogOutError extends AuthenticationState {}

// reset password states
final class ResetPasswordSuccess extends AuthenticationState {}

final class ResetPasswordLoading extends AuthenticationState {}

final class ResetPasswordError extends AuthenticationState {}

// insert data states
final class UserDataAddedLoading extends AuthenticationState {}

final class UserDataAddedSuccess extends AuthenticationState {}

final class UserDataAddedError extends AuthenticationState {}

// get data states
final class GetUserDataLoading extends AuthenticationState {}

final class GetUserDataSuccess extends AuthenticationState {}

final class GetUserDataError extends AuthenticationState {}

