import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/food_item.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';

class FoodDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FoodItem food = ModalRoute.of(context)!.settings.arguments as FoodItem;
    final cart = Provider.of<CartProvider>(context, listen: false);
    final fav = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        actions: [
          IconButton(
            icon: Icon(
              fav.isFavorite(food) ? Icons.favorite : Icons.favorite_border,
              color: fav.isFavorite(food) ? Colors.red : null,
            ),
            onPressed: () => fav.toggleFavorite(food),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(food.image,  height: 250,fit: BoxFit.cover,)),
            SizedBox(height: 16),
            Text(food.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(food.description),
            SizedBox(height: 16),
            Text('\$24${food.price}', style: TextStyle(fontSize: 30, color: const Color.fromARGB(255, 239, 2, 22))),
            SizedBox(height: 100,),
            ElevatedButton(
              onPressed: () {
                cart.addToCart(food);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('\$24${food.name} added to cart!')),
                );
              },
              child: Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
} 