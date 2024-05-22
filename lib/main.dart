import 'package:ecommerce_cw_flutter/src/blocProviders.dart';
import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/login/LoginBlocCubit.dart';
import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:ecommerce_cw_flutter/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,    
    child: MaterialApp(
      builder: FToastBuilder(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: 'login',
      routes:{
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => Registerpage() 
        
      },

    ),
      ) ;
    
  }
}

