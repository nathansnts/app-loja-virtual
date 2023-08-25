import 'package:app_loja_virtual/pages/product.details.dart';
import 'package:app_loja_virtual/repositories/firebase_options.dart';
import 'package:app_loja_virtual/pages/home_page.dart';
import 'package:app_loja_virtual/pages/places.dart';
import 'package:app_loja_virtual/pages/products_category.dart';
import 'package:app_loja_virtual/pages/requests.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //Inicializando o serviço do firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Loja Virtual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink, primaryColor: Colors.cyan),
      home: HomePage(),
      routes: {
        '/homepage': (context) => HomePage(),
        '/productscategory': (context) => ProductsCategory(),
        '/productcategoryselected': (context) => ProductDetails(),
        '/places': (context) => Places(),
        '/requests': (context) => Requests()
      },
    );
  }
}
