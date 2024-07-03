import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/components/my_cart_tile.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:food_delivery/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child){
      // cart
      final userCart = restaurant.cart;

      // Scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            // Clear cart button
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure you want to clear the cart?"),
                      actions: [
                        // Cancel Button
                        TextButton(onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),

                        // Yes Button
                        TextButton(
                        onPressed: () {
                           Navigator.pop(context);
                           restaurant.clearCart();
                        },
                          child: const Text("Yes"),
                        ),

                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),),
          ],
        ),
        body: Column(
          children: [

            // List of cart
            Expanded(
              child: Column(
                children: [
                 userCart.isEmpty ?
                 const Expanded(
                     child: Center(child: Text("Cart is empty..."),),)
                     :Expanded(child:
                  ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) {
              
                      // Get individual cart item
                      final cartItem = userCart[index];
              
                      // Return cart tile UI
                      return MyCartTile(cartItem: cartItem);
                    },
                  ),
                  ),
                ],
              ),
            ),

            // Button to pay
            MyButton(onTap: () => Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => const PaymentPage(),
            ),
            ),
                text: "Go to checkout"),
            const SizedBox(height: 30),


          ],
        ),
      );

    });
  }
}
