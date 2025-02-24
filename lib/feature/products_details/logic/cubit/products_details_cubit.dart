import 'dart:developer';


// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/functions/aip_services.dart';
import 'package:ecommerce_app/feature/products_details/data/models/rating_model.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'products_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductsDetailsCubit() : super(ProductsDetailsInitial());

  final ApiServices _apiServices = ApiServices();
  String userId = Supabase.instance.client.auth.currentUser!.id;

  List<RatingModel> ratingList = [];
  int averageRate = 0;
  int userRate = 5;

  Future<void> getRating({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response response = await _apiServices.getData('rates_table?select=*&for_product=eq.$productId');
      for (var rating in response.data) {
        ratingList.add(RatingModel.fromJson(rating));
      }
      _getAverageRate();
      _getUserRates();

      
      
      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }


  void _getUserRates() {
      List<RatingModel> userRates = ratingList.where((RatingModel rate) => rate.forUser == userId).toList();
        if (userRates.isNotEmpty) {
             userRate = userRates[0].rate!;
        }
  }

 



// method average rate
 void _getAverageRate() {
    for (var userRate in ratingList) {
      if (userRate.rate != null) {
        
        averageRate += userRate.rate!; 
      }
      
    }
    if (ratingList.isNotEmpty) {
      averageRate = averageRate ~/ ratingList.length;
      
    }
  }

  bool _isUserRateExist({required String productId}) {
    for (var rate in ratingList) {
      if ((rate.forUser == userId) && (rate.forProduct == productId)) {
        return true;
      }
    }
    return false;
  }


   Future<void> addOrUpdateUserRate(
      {required String productId, required Map<String, dynamic> data}) async {
    // user rate exist ==> update for user rate
    // user doesn't exist ==> add rate
    String url =
        "rates_table?select=*&for_user=eq.$userId&for_product=eq.$productId";
    emit(AddOrUpdateRateLoading());
    try {
      if (_isUserRateExist(productId: productId)) {
        // user rate exist ==> update for user rate
        // patch data
        await _apiServices.patchData(url, data);
      } else {
        // post rate
        await _apiServices.postData(url, data);
      }

      emit(AddOrUpdateRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddOrUpdateRateError());
    }
  }

   Future<void> addComment({required Map<String, dynamic> data}) async {
    emit(AddCommentLoading());
    try {
      await _apiServices.postData("comments_table", data);
      emit(AddCommentSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddCommentError());
    }
  }

}

