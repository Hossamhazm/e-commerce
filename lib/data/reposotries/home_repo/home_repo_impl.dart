import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mvvm_e_commerce/domain/models/failure.dart';
import 'package:mvvm_e_commerce/domain/models/response/home_response/CategoriesResponse.dart';
import 'package:mvvm_e_commerce/domain/models/response/home_response/ProductsResponse.dart';
import 'package:mvvm_e_commerce/domain/reposotries/home_repo/home_repo.dart';
import 'package:http/http.dart' as http;

class HomeRepoImplementation extends HomeRepo{
  static const String baseUrl = "route-ecommerce.onrender.com";

  @override
  Future<Either<Failure, List<Category>>> getCategories() async{
    final Uri url = Uri.https(baseUrl, '/api/v1/categories');
    try{
      http.Response response = await http.get(url);
      CategoriesResponse responseBody =
      CategoriesResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode <300 && responseBody.data?.isNotEmpty== true){
        return Right(responseBody.data!);
      }else{
        throw Exception("Failed to load categories list");
      }
    } catch (e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProducts() async{
    final Uri url = Uri.https(baseUrl, '/api/v1/products');
    try{
      http.Response response = await http.get(url);
      ProductsResponse responseBody =
      ProductsResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >=200 && response.statusCode <300 && responseBody.data?.isNotEmpty== true){
        return Right(responseBody.data!);
      }else{
        throw Exception("Failed to load products list");
      }
    } catch (e){
      return Left(Failure(e.toString()));
    }
  }
}