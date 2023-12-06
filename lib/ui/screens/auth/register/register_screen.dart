import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/base_request_state.dart';
import 'package:mvvm_e_commerce/core/utilites/dialog_utilites.dart';
import 'package:mvvm_e_commerce/ui/screens/auth/register/register_sreen_vm.dart';
import 'package:mvvm_e_commerce/ui/screens/home/home_screen.dart';

import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static String routeName = "register_screen";
  @override
  Widget build(BuildContext context) {
    RegisterScreenVM registerScreenVM = RegisterScreenVM();
    return SafeArea(
      child: BlocListener<RegisterScreenVM, BaseRequestState>(
        bloc: registerScreenVM,
        listener: (BuildContext context, BaseRequestState state) {
          if(state is BaseRequestLoadingState){
            showLoading(context);
          }else if(state is BaseRequestErrorState){
            hideLoading(context);
            showErrorDialog(context, state.errorMessage);
          }else if(state is BaseRequestSuccessState){
            hideLoading(context);
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        child: Scaffold(
          backgroundColor: appTheme.lightBlue900,
          body: Form(
            key: registerScreenVM.formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child: Image.asset("assets/images/route.png")),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      width: double.infinity,
                      child: Text(
                        "Full Name",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    CustomTextFormField(
                      controller: registerScreenVM.name,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      autofocus: false,
                      hintText: "enter your name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      width: double.infinity,
                      child: Text(
                        "Mobile Number",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    CustomTextFormField(
                      controller: registerScreenVM.number,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      autofocus: false,
                      hintText: "enter your mobile no",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your mobile no';
                        }
                        return null;
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      width: double.infinity,
                      child: Text(
                        "E-mail address",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    CustomTextFormField(
                      controller: registerScreenVM.email,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      autofocus: false,
                      hintText: "enter your email address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!value.contains('@')){
                          return 'Please enter correct email address';
                        }
                        return null;
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      width: double.infinity,
                      child: Text(
                        "Password",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    CustomTextFormField(
                        controller: registerScreenVM.password,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        autofocus: false,
                        hintText: "enter your password",
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value.length < 6) {
                            return 'Your password less than 6!';
                          }
                        },
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      width: double.infinity,
                      child: Text(
                        "RePassword",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    CustomTextFormField(
                        controller: registerScreenVM.rePassword,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        autofocus: false,
                        hintText: "enter your password",
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                          if (value != registerScreenVM.password.text){
                            return 'The re password is not equal password';
                          }
                        },
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomElevatedButton(
                        text: 'Sign up',
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        onTap: () {
                          registerScreenVM.register();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
