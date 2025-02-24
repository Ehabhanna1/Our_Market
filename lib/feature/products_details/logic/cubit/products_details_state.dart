part of 'products_details_cubit.dart';

sealed class ProductsDetailsState extends Equatable {
  const ProductsDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductsDetailsInitial extends ProductsDetailsState {}

final class GetRateLoading extends ProductsDetailsState {}

final class GetRateSuccess extends ProductsDetailsState {}

final class GetRateError extends ProductsDetailsState {}

// for update rate or add new rate
final class AddOrUpdateRateLoading extends ProductsDetailsState {}

final class AddOrUpdateRateSuccess extends ProductsDetailsState {}

final class AddOrUpdateRateError extends ProductsDetailsState {}

// for comment
final class AddCommentLoading extends ProductsDetailsState {}

final class AddCommentSuccess extends ProductsDetailsState {}

final class AddCommentError extends ProductsDetailsState {}
