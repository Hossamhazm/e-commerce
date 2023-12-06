import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/ui/screens/home/cubits/category_cubit.dart';
import 'package:mvvm_e_commerce/ui/screens/home/cubits/product_cubit.dart';

class HomeScreenVM extends Cubit {
  CategoryCubit categoryCubit = CategoryCubit();
  ProductCubit productCubit = ProductCubit();

  int selectedTab = 0;
  int selectedCategTabBar=0;
  PageController pageController = PageController();

  void toggleTab(int value) {
    selectedTab = value;
    emit(HomeScreenVMInitState());
  }
  void toggleTabBar(int value) {
    selectedCategTabBar = value;
    emit(HomeScreenVMInitState());
  }

  HomeScreenVM() : super(HomeScreenVMInitState) {
    categoryCubit.loadCategoryList();
    productCubit.loadProductList();
  }
}

class HomeScreenVMInitState {}

