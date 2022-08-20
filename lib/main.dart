import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:l_and_u/product/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:l_and_u/authentication/authentication_repository/authentication_repository.dart';

import 'package:l_and_u/authentication/authentication_repository/user_repository.dart';

import 'package:l_and_u/product/product_repository/product_repository.dart';
import 'package:l_and_u/product/screen/home.dart';
import 'package:l_and_u/product_ditails/product_ditails_repository/product_ditails_repository.dart';
import 'package:l_and_u/shopping_bag/repository/shopping_bag_repository.dart';

import 'authentication/screen/authentication.dart';

import 'checkout/checkout_repository/checkout_repository.dart';
import 'component/const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductRepository()),
    ChangeNotifierProvider(create: (_) => ShoppinBagRepository()),
    ChangeNotifierProvider(create: (_) => ProductDitailsRepository()),
    ChangeNotifierProvider(create: (_) => AuthenticationRepository()),
    ChangeNotifierProvider(create: (_) => UserRepository()),
    ChangeNotifierProvider(create: (_) => CheckoutRepository()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'L & U',
      theme: ThemeData(
        fontFamily: 'Alice',
        focusColor: const Color(fontColor),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash screen',
      routes: {
        '/splash screen': (context) => const SplashScreens(),
        "/": (context) => Home(),
        "/auth": (context) => Authentication()
      },
      builder: EasyLoading.init(),
    );
  }
}
