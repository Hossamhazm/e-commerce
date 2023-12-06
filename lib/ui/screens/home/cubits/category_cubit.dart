import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/base_request_state.dart';
import 'package:mvvm_e_commerce/data/reposotries/home_repo/home_repo_impl.dart';
import 'package:mvvm_e_commerce/domain/models/failure.dart';
import 'package:mvvm_e_commerce/domain/models/response/home_response/CategoriesResponse.dart';
import 'package:mvvm_e_commerce/domain/reposotries/home_repo/home_repo.dart';

class CategoryCubit extends Cubit<BaseRequestState>{
  CategoryCubit():super(BaseRequestInitState());

  List<Category> categories = [];
  HomeRepo repo = HomeRepoImplementation();

  void loadCategoryList() async{
    emit(BaseRequestLoadingState());
    Either<Failure, List<Category>> categoriesResponse =await repo.getCategories();
    emit(BaseRequestLoadingState());
    categoriesResponse.fold((l) => emit(BaseRequestErrorState(l.message)), (newList) {
      categories = newList;
      emit(BaseRequestSuccessState());
    });
  }
}