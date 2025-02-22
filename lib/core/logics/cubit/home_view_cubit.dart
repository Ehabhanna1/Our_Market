import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/functions/aip_services.dart';
import 'package:meta/meta.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());

  final ApiServices apiServices = ApiServices();

  List<ProductsModel> products = [];

  Future<void> getProducts() async {
    emit(GetDataLoading());
    try {
      Response response = await apiServices.getData(
          'products_table?select=*,favorite_products(*),purchase_table(*)');
      for (var product in response.data) {
        products.add(ProductsModel.fromJson(product));
        
      }
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }
}
