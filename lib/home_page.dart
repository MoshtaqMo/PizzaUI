import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/food_item.dart';
import 'providers/cart_provider.dart';
import 'providers/favorites_provider.dart';

class HomePage extends StatelessWidget {
  final List<FoodItem> popularFoods = const [
    FoodItem(
      name: 'Pizza',
      image: 'assets/pizza.png',
      description: 'A pizza that decidedly staggers under an overload of golden corn, exotic black olives, crunchy onions, crisp capsicum, succulent mushrooms, jalapenos, tomatoes and jalapeno - with extra cheese to go all around. A pizza that goes ballistic on veggies!',
      price: 20.0,
    ),
    
    FoodItem(
      name: 'Burger',
      image: 'assets/burger.png',
      description: 'A juicy beef burger with lettuce, tomato, and cheese.',
      price: 15.0,
    ),
    FoodItem(
      name: 'Salad',
      image: 'assets/salad.png',
      description: 'A fresh garden salad with a variety of vegetables.',
      price: 10.0,
    ),
    FoodItem(
      name: 'Dessert',
      image: 'assets/dessert.png',
      description: 'A sweet dessert to finish your meal.',
      price: 8.0,
    ),
    FoodItem(
      name: 'Pizza',
      image: 'assets/pizza.png',
      description: 'A pizza that decidedly staggers under an overload of golden corn, exotic black olives, crunchy onions, crisp capsicum, succulent mushrooms, jalapenos, tomatoes and jalapeno - with extra cheese to go all around. A pizza that goes ballistic on veggies!',
      price: 20.0,
    ),
    
    FoodItem(
      name: 'Burger',
      image: 'assets/burger.png',
      description: 'A juicy beef burger with lettuce, tomato, and cheese.',
      price: 15.0,
    ),
    FoodItem(
      name: 'Salad',
      image: 'assets/salad.png',
      description: 'A fresh garden salad with a variety of vegetables.',
      price: 10.0,
    ),
    FoodItem(
      name: 'Dessert',
      image: 'assets/dessert.png',
      description: 'A sweet dessert to finish your meal.',
      price: 8.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpeg'),
            ),
            SizedBox(width: 10),
            Text('How Hungry are you Today?'),
          ],
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, __) => Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () => Navigator.pushNamed(context, '/cart'),
                ),
                if (cart.itemCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        cart.itemCount.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Food items',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          // Categories
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              
              children: [
                
                Row(
                  spacing: (20),
                  children: [
                    CategoryCard('Salad', Icons.local_dining),
                    CategoryCard('Fast Food', Icons.fastfood),
                    CategoryCard('Dessert', Icons.cake),
                    CategoryCard('Drinks', Icons.local_drink),
                  ],
                ),
              ],
            ),
          ),
          // Popular Foods
          Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Popular Foods', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: popularFoods.length,
              itemBuilder: (context, index) {
                final food = popularFoods[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Image.asset(food.image, width: 70, height: 70),
                    title: Text(food.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle: Text(' 24${food.price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.black),),
                    trailing: Consumer<FavoritesProvider>(
                      builder: (_, fav, __) => IconButton(
                        icon: Icon(
                          fav.isFavorite(food) ? Icons.favorite : Icons.favorite_border,
                          color: fav.isFavorite(food) ? Colors.red : null,
                        ),
                        onPressed: () => fav.toggleFavorite(food),
                      ),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/details', arguments: food),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String label;
  final IconData icon;
  CategoryCard(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, size: 30),
            SizedBox(height: 5),
            Text(label, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
} 