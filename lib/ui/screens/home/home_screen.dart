import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/assets_names.dart';
import 'package:mvvm_e_commerce/ui/screens/home/cubits/home_screen_vm.dart';
import 'package:mvvm_e_commerce/ui/screens/home/taps/account_tap/account_tap_view.dart';
import 'package:mvvm_e_commerce/ui/screens/home/taps/category_tap/category_tap_view.dart';
import 'package:mvvm_e_commerce/ui/screens/home/taps/favourite_tap/favourite_tap_view.dart';
import 'package:mvvm_e_commerce/ui/screens/home/taps/home_tap/home_tap_view.dart';
import 'package:mvvm_e_commerce/ui/theme/theme_helper.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home";
  HomeScreenVM viewModel = HomeScreenVM();
  late List<Widget> tabs; // Declare tabs as a late variable

  HomeScreen({super.key}) {
    // Initialize tabs in the constructor
    tabs = [
      HomeTap(homeScreenVM: viewModel),
      CategoryTap(homeScreenVM: viewModel),
      FavouriteTap(),
      AccountTap(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<HomeScreenVM, dynamic>(
        bloc: viewModel,
        builder: (context, _) {
          return Scaffold(
            appBar: AppBar(
              title: Image.asset(AppAssets.logoIcon),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ImageIcon(AssetImage(AppAssets.shopCartIcon)),
                )
              ],
            ),
            body: tabs[viewModel.selectedTab],
            bottomNavigationBar: Theme(
              data: ThemeData(canvasColor: appTheme.lightBlue900,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  backgroundColor: appTheme.lightBlue900,
                  unselectedItemColor: Colors.white,
                  selectedItemColor: appTheme.lightBlue900,
                  onTap: (index) {
                    viewModel.toggleTab(index);
                  },
                  iconSize: 35,
                  currentIndex: viewModel.selectedTab,
                  items: [
                    buildBottomNavIcon(
                        AppAssets.homeIcon, viewModel.selectedTab == 0),
                    buildBottomNavIcon(
                        AppAssets.categIcon, viewModel.selectedTab == 1),
                    buildBottomNavIcon(
                        AppAssets.favouriteIcon, viewModel.selectedTab == 2),
                    buildBottomNavIcon(
                        AppAssets.accountIcon, viewModel.selectedTab == 3),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildBottomNavIcon(String asset, bool selected) {
    return BottomNavigationBarItem(
      icon: selected
          ? CircleAvatar(
        radius: selected ? 20 : 0,
        backgroundColor:
        selected ? Colors.white : Colors.transparent,
        child: ImageIcon(
          AssetImage(asset),
          size: 30,
        ),
      )
          : ImageIcon(AssetImage(asset), size: 30),
      label: "",
    );
  }
}
