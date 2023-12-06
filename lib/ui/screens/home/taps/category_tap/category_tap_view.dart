import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/ui/screens/home/cubits/home_screen_vm.dart';
import 'package:mvvm_e_commerce/ui/theme/theme_helper.dart';

class CategoryTap extends StatelessWidget {
  HomeScreenVM homeScreenVM;
  CategoryTap({super.key, required this.homeScreenVM});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return BlocBuilder<HomeScreenVM, dynamic>(
      bloc: homeScreenVM,
      builder: (context,_){
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.lightBlue900.withOpacity(0.1),
                  border: Border.all(width: 1 , color: appTheme.lightBlue900)
                ),
                width: width * 0.30,
                child: ListView.separated(
                    itemBuilder: (context , index){
                      return GestureDetector(
                        onTap: (){
                          homeScreenVM.toggleTabBar(index);
                          homeScreenVM.pageController.jumpToPage(index);
                        },
                        child: Container(
                          color: homeScreenVM.selectedCategTabBar == index ? Colors.white : null,
                          child: Row(
                            children: [
                              Container(
                                height: homeScreenVM.selectedCategTabBar == index ? 60 : 0,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: appTheme.lightBlue900,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                              ),
                              Expanded(child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                  child: Text(homeScreenVM.categoryCubit.categories[index].name ?? "null"),
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context , index){
                      return const SizedBox(height: 5,);
                    },
                    itemCount: homeScreenVM.categoryCubit.categories.length),
              ),
            ),
            Expanded(child: Container(
              child: PageView(
                controller: homeScreenVM.pageController,
                children: [

                ],
              ),
            ))
          ],
        );
      },
    );
  }
}
