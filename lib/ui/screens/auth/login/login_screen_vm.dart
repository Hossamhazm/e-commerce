import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/base_request_state.dart';
import 'package:mvvm_e_commerce/data/reposotries/auth_repo/auth_repo_implment.dart';
import 'package:mvvm_e_commerce/domain/models/auth_request/login_requist_model.dart';
import 'package:mvvm_e_commerce/domain/reposotries/auth_repo/auth_repo.dart';

class LoginScreenVM extends Cubit<BaseRequestState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthRepo repo = AuthRepoImplementation();

  LoginScreenVM() : super(BaseRequestInitState());

    void login() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
      final authResponse = await repo.login(
        LoginRequestBody(email: email.text, password: password.text),
      );
      authResponse.fold((l) => emit(BaseRequestErrorState(l.message)), (r) => emit(BaseRequestSuccessState()));
  }
}