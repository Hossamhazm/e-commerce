import 'package:dartz/dartz.dart';
import 'package:mvvm_e_commerce/domain/models/auth_request/login_requist_model.dart';
import 'package:mvvm_e_commerce/domain/models/auth_request/register_requist_body.dart';
import 'package:mvvm_e_commerce/domain/models/failure.dart';

import '../../models/response/auth_response/AuthResponse.dart';

abstract class AuthRepo{
  Future<Either<Failure, AuthResponse>> login(LoginRequestBody loginRequestBody);
  Future<Either<Failure, AuthResponse>> register(RegisterRequestBody registerRequestBody);
}