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
