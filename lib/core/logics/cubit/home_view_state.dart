part of 'home_view_cubit.dart';

@immutable
sealed class HomeViewState {}

final class HomeViewInitial extends HomeViewState {}

final class GetDataLoading extends HomeViewState {}

final class GetDataSuccess extends HomeViewState {}


final class GetDataError extends HomeViewState {}


// add to favorite
final class AddToFavoriteLoading extends HomeViewState {}
final class AddToFavoriteSuccess extends HomeViewState {}
final class AddToFavoriteError extends HomeViewState {}

// remove from favorite
final class RemoveFromFavoriteLoading extends HomeViewState {}
final class RemoveFromFavoriteSuccess extends HomeViewState {}
final class RemoveFromFavoriteError extends HomeViewState {}
