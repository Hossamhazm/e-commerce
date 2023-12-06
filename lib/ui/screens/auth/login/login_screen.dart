import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/base_request_state.dart';
import 'package:mvvm_e_commerce/core/utilites/dialog_utilites.dart';
import 'package:mvvm_e_commerce/ui/screens/auth/login/login_screen_vm.dart';
import 'package:mvvm_e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:mvvm_e_commerce/ui/screens/home/home_screen.dart';
import 'package:mvvm_e_commerce/ui/theme/theme_helper.dart';

import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static String routeName = "login_screen";
  LoginScreenVM loginScreenVM = LoginScreenVM();
  @override
  Widget build(BuildContext context) {

    return BlocListener<LoginScreenVM, BaseRequestState>(
      bloc: loginScreenVM,
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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.lightBlue900,
          body: Form(
            key: loginScreenVM.formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child: Image.asset("assets/images/route.png")),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 50),
                      width: double.infinity,
                      child: Text(
                        "Welcome Back To Route",
                        textAlign: TextAlign.start,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      width: double.infinity,
                      child: Text("Please sign in with your mail",
                          style: CustomTextStyles.bodyLargePrimary),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      width: double.infinity,
                      child: Text(
                        "Your E-mail",
                        style: CustomTextStyles.titleMediumPrimary,
                      ),
                    ),
                    CustomTextFormField(
                      controller: loginScreenVM.email,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      autofocus: false,
                      hintText: "enter your e-mail",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your e-mail';
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
                        controller: loginScreenVM.password,
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
                    const SizedBox(
                      height: 30,
                    ),
                    CustomElevatedButton(
                        text: 'Login',
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        buttonStyle: CustomButtonStyles.fillPrimary,
                        onTap: () {
                          loginScreenVM.login();
                        }),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                        },
                        child: Text('Don’t have an account? Create Account',
                            style: CustomTextStyles.titleMediumPrimary),
                      ),
                    ),
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
