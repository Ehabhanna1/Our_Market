import 'dart:developer';
import 'dart:math';

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

  final ApiServices apiServices = ApiServices();
  String userId = Supabase.instance.client.auth.currentUser!.id;

  List<RatingModel> ratingList = [];
  int averageRate =0;
  int userRate = 5;

  Future<void> getRating({required String productId}) async {
    emit(GetRateLoading());
    try {
      Response response = await apiServices.getData('rates_table?select=*&for_product=eq.$productId');
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
    averageRate = averageRate ~/ ratingList.length;
  }

  bool _isUserRateExist ({required String productId}){
    for(var rate in ratingList){
      if((rate.forProduct == productId) && (rate.forUser == userId)){
        return true;
      }
     
    }
    return false;
  }
  Future<void> addOrUpdateRate({required String productId,required Map<String, dynamic> data}) async {

    String url = 'rates_table?select=*&for_user=eq.$userId&for_product=eq.$productId';
    // user rate exist ==> update user rate
    // user rate not exist ==> add new rate
    emit(AddOrUpdateRateLoading());

    try {
  if(_isUserRateExist(productId: productId)){
    // patch rate ==> update 
    await apiServices.patchData(url, data);
   
  }else{
    // post rate ==> add new rate
    await apiServices.postData(url, data);
    
  }

  emit(AddOrUpdateRateSuccess());
} catch (e) {
   log(e.toString());
   emit(AddOrUpdateRateError());

}
  }
   




}
