part of 'home_view_cubit.dart';

@immutable
sealed class HomeViewState {}

final class HomeViewInitial extends HomeViewState {}

final class GetDataLoading extends HomeViewState {}

final class GetDataSuccess extends HomeViewState {}

final class GetDataError extends HomeViewState {}
