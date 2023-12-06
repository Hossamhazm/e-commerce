import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mvvm_e_commerce/domain/models/auth_request/login_requist_model.dart';
import 'package:mvvm_e_commerce/domain/models/auth_request/register_requist_body.dart';
import 'package:mvvm_e_commerce/domain/models/response/auth_response/AuthResponse.dart';
import 'package:mvvm_e_commerce/domain/reposotries/auth_repo/auth_repo.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/models/failure.dart';

class AuthRepoImplementation extends AuthRepo{
  static const String baseUrl = "route-ecommerce.onrender.com";

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequestBody loginRequestBody) async {
    final Uri loginUri = Uri.https(baseUrl, '/api/v1/auth/signin');
    try {
      final http.Response response = await http.post(
        loginUri,
        body: loginRequestBody.toJson(),
      );
      AuthResponse responseBody =
      AuthResponse.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode <300) {
        SharedPreferences sharedPrefrences =await SharedPreferences.getInstance();
         sharedPrefrences.setString('token', responseBody.token!);
         User.currentUserToken = responseBody.token?? "";
        return Right(responseBody);
      } else {
        // Handle login failure
        print('Login failed with status code ${response.statusCode}');
        throw Exception(responseBody.message); // Indicate failure by returning null
      }
    } catch (e) {
      // Handle exceptions
      print('Exception during login: $e');
      return Left(Failure(e.toString())); // Indicate failure by returning null
    }
  }


  @override
  Future<Either<Failure, AuthResponse>> register(RegisterRequestBody registerRequestBody) async {
    final Uri loginUri = Uri.https(baseUrl, '/api/v1/auth/signup');
    try {
      final http.Response response = await http.post(
        loginUri,
        body: registerRequestBody.toJson(),
      );
      AuthResponse responseBody =
      AuthResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <300) {
        SharedPreferences sharedPrefrences =await SharedPreferences.getInstance();
        sharedPrefrences.setString('token', responseBody.token!);
        User.currentUserToken = responseBody.token?? "";
        return Right(responseBody);
      } else {
        // Handle login failure
        print('Register failed with status code ${response.statusCode}');
        throw Exception(responseBody.message); // Indicate failure by returning null
      }
    } catch (e) {
      // Handle exceptions
      print('Exception during register: $e');
      return Left(Failure(e.toString())); // Indicate failure by returning null
    }
  }

}

