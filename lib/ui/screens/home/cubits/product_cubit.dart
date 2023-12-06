import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/base_request_state.dart';
import 'package:mvvm_e_commerce/data/reposotries/home_repo/home_repo_impl.dart';
import 'package:mvvm_e_commerce/domain/models/failure.dart';
import 'package:mvvm_e_commerce/domain/models/response/home_response/ProductsResponse.dart';
import 'package:mvvm_e_commerce/domain/reposotries/home_repo/home_repo.dart';

class ProductCubit extends Cubit<BaseRequestState>{
  ProductCubit():super(BaseRequestInitState());

  List<Product> products = [];
  HomeRepo repo = HomeRepoImplementation();

  void loadProductList() async{
    emit(BaseRequestLoadingState());
    Either<Failure, List<Product>> categoriesResponse =await repo.getProducts();
    emit(BaseRequestLoadingState());
    categoriesResponse.fold((l) => emit(BaseRequestErrorState(l.message)), (newList) {
      products = newList;
      emit(BaseRequestSuccessState());
    });
  }
}