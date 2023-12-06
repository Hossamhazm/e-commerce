import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_e_commerce/core/utilites/base_request_state.dart';
import 'package:mvvm_e_commerce/data/reposotries/auth_repo/auth_repo_implment.dart';
import 'package:mvvm_e_commerce/domain/models/auth_request/register_requist_body.dart';

import '../../../../domain/reposotries/auth_repo/auth_repo.dart';

class RegisterScreenVM extends Cubit<BaseRequestState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  AuthRepo repo = AuthRepoImplementation();

  RegisterScreenVM() : super(BaseRequestInitState());

  void register() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
    final authResponse = await repo.register(
      RegisterRequestBody(name: name.text, email: email.text, password: password.text, rePassword: rePassword.text ,phone: number.text),
    );
    authResponse.fold((l) => emit(BaseRequestErrorState(l.message)), (r) => emit(BaseRequestSuccessState()));
  }
}
