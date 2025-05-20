import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
      body: cart.items.isEmpty
          ? Center(child: Text('Your cart is empty!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: cart.items.entries.map((entry) {
                      final food = entry.key;
                      final qty = entry.value;
                      return ListTile(
                        leading: Image.asset(food.image, width: 70, height: 70),
                        title: Text(food.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        subtitle: Text('\$24${food.price} x $qty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove,color: Colors.black,size: 25,),
                              onPressed: () => cart.removeFromCart(food),
                            ),
                            Text('$qty',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                            IconButton(
                              icon: Icon(Icons.add,color: Colors.black,size: 25,),
                              onPressed: () => cart.addToCart(food),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Total: \$24${cart.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          cart.clearCart();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Order placed!')),
                          );
                        },
                        child: Text('Checkout'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
} 