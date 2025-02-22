import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/functions/aip_services.dart';
import 'package:ecommerce_app/feature/products_details/data/models/rating_model.dart';
import 'package:equatable/equatable.dart';

part 'products_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductsDetailsCubit() : super(ProductsDetailsInitial());

  final ApiServices apiServices = ApiServices();

  List<RatingModel> ratingList = [];
  int averageRate =0;

  Future<void> getRating({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response response = await apiServices.getData('rates_table?select=*&for_product=eq.$productId');
      for (var rating in response.data) {
        ratingList.add(RatingModel.fromJson(rating));
      }
      _getAverageRate();
      log( averageRate.toString());
      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }



// method average rate
  void _getAverageRate() {
    for (var userRate in ratingList) {
      if (userRate.rate != null) {
        averageRate += userRate.rate!;
        
      }
      
    }
    averageRate = averageRate ~/ ratingList.length;
  }
}
