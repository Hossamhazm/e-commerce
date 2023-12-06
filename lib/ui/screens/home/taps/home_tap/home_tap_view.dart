import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/assets_names.dart';
import 'package:mvvm_e_commerce/core/utilites/base_request_state.dart';
import 'package:mvvm_e_commerce/ui/screens/home/cubits/home_screen_vm.dart';
import 'package:mvvm_e_commerce/ui/widgets/categ&product_hor_list.dart';
import 'package:mvvm_e_commerce/ui/widgets/product_card.dart';

class HomeTap extends StatelessWidget {
  HomeScreenVM homeScreenVM;
  HomeTap({super.key,required this.homeScreenVM});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.26,
            child: CarouselSlider(
              options: CarouselOptions(
                height: height * 0.25,
                aspectRatio: 20/10.5,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
              items: [AppAssets.ad1,AppAssets.ad2,AppAssets.ad3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(i,fit: BoxFit.fill,);
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text("Categories",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xfff06004f),
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
            ),
          ),
          SizedBox(
            height: height * 0.15,
            child: BlocBuilder(
              bloc: homeScreenVM.categoryCubit,
              builder: (BuildContext context, state) {
                if(state is BaseRequestLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(state is BaseRequestErrorState){
                  print(state.errorMessage);
                  return Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.errorMessage),
                  ));
                }
                else if(state is BaseRequestSuccessState){
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeScreenVM.categoryCubit.categories.length,
                      itemBuilder: (context, index){
                        return horizList(height, width, homeScreenVM.categoryCubit.categories[index].name ?? "null", homeScreenVM.categoryCubit.categories[index].image ?? "");
                      });
                } else {
                  return Text("No data");
                }
              },
            ),
          ),
          SizedBox(
            height: height * 0.15,
            child: BlocBuilder(
              bloc: homeScreenVM.productCubit,
              builder: (BuildContext context, state) {
                if(state is BaseRequestLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(state is BaseRequestErrorState){
                  print(state.errorMessage);
                  return Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.errorMessage),
                  ));
                }
                else if(state is BaseRequestSuccessState){
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenVM.productCubit.products.length,
                      itemBuilder: (context, index){
                        return horizList(height, width, homeScreenVM.productCubit.products[index].slug ?? "null", homeScreenVM.productCubit.products[index].imageCover ?? "");
                      });
                } else {
                  return Text("No data");
                }
              },
            ),
          ),
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text("Home Appliance",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(0xfff06004f),
                  fontSize: 20,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: height * 0.24,
            child: BlocBuilder(
              bloc: homeScreenVM.productCubit,
              builder: (BuildContext context, state) {
                if(state is BaseRequestLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                else if(state is BaseRequestErrorState){
                  print(state.errorMessage);
                  return Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.errorMessage),
                  ));
                }
                else if(state is BaseRequestSuccessState){
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeScreenVM.productCubit.products.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: productsCard(height, width, homeScreenVM.productCubit.products[index].imageCover ?? "", homeScreenVM.productCubit.products[index].price ?? 0, homeScreenVM.productCubit.products[index].ratingsAverage, homeScreenVM.productCubit.products[index].slug ?? "null"),
                        );
                      });
                } else {
                  return Text("No data");
                }
              },
            ),
          ),
          const SizedBox(height: 20,),
          Image.asset(AppAssets.ad4),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
/*Expanded(
            child: Container(
              height: height * 0.3,
              width: width * 0.3,
              decoration: const BoxDecoration(
                color: Colors.brown
              ),
            ),
          )*/