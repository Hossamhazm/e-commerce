import 'package:dartz/dartz.dart';
import 'package:mvvm_e_commerce/domain/models/failure.dart';
import 'package:mvvm_e_commerce/domain/models/response/home_response/CategoriesResponse.dart';
import 'package:mvvm_e_commerce/domain/models/response/home_response/ProductsResponse.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Product>>> getProducts();
}