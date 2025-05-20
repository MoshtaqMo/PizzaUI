import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'food_details_page.dart';
import 'cart_page.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: PizzaApp(),
    ),
  );
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza App',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/details': (context) => FoodDetailsPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
