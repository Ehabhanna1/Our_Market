import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/data/models/products_model/products_model.dart';
import 'package:ecommerce_app/core/functions/aip_services.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit() : super(HomeViewInitial());

  final ApiServices apiServices = ApiServices();
  final String userId = Supabase.instance.client.auth.currentUser!.id;

  List<ProductsModel> products = [];
  List<ProductsModel> searchResults = [];
  List<ProductsModel> categoryProducts = [];

  Future<void> getProducts({String? query, String? category}) async {
    emit(GetDataLoading());
    try {
      Response response = await apiServices.getData(
          'products_table?select=*,favorite_products(*),purchase_table(*)');
      for (var product in response.data) {
        products.add(ProductsModel.fromJson(product));
      }
      search(query);
      getProductsByCategory(category);
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }

  void search(String? query) {
    if (query != null) {
      for (var product in products) {
        if (product.productName!.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(product);
        }
      }
      
    }
  }

   void getProductsByCategory(String? category) {
    if (category != null) {
      for (var product in products) {
        if (product.category!.trim().toLowerCase()==category.trim().toLowerCase()) {
          categoryProducts.add(product);
        }
      }
      
    }
  }
   Map<String, bool> favoriteProduct = {};
  // Add To favorite
  Future<void> addToFavorite(String productId) async {
    emit(AddToFavoriteLoading());
   try {
      await apiServices.postData("favorite_products", {
        "is_favorite": true,
        "for_user": userId,
        "for_product": productId,
      }
      
      );

      favoriteProduct.addAll({productId: true});
      
      emit(AddToFavoriteSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddToFavoriteError());
    }
  }

  bool checkIsFavorite(String productId) {
    return favoriteProduct.containsKey(productId);
  }


}
