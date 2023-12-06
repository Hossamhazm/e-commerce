import 'package:flutter/material.dart';
import 'package:mvvm_e_commerce/domain/models/response/auth_response/AuthResponse.dart';
import 'package:mvvm_e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:mvvm_e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:mvvm_e_commerce/ui/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref =await SharedPreferences.getInstance();
  String? token= pref.getString('token');
  User.currentUserToken = token?? "";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:User.currentUserToken.isEmpty? LoginScreen.routeName : HomeScreen.routeName,
      routes: {
        LoginScreen.routeName : (_)=> LoginScreen(),
        RegisterScreen.routeName : (_)=> RegisterScreen(),
        HomeScreen.routeName : (_)=> HomeScreen()
      },
    );
  }
}
