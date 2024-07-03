import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_button.dart';
import 'package:food_delivery/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

   FoodPage({
    super.key,
    required this.food,
  }){
     // Initialze the selected addons to be false
     for (Addon addon in food.availbleAddons) {
       selectedAddons[addon] = false;
     }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {

    // close the current food page to go back to the menu
    Navigator.pop(context);

    // format the selectedAddons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availbleAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    // Add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }



  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Food Image
            Image.asset(widget.food.imagePath),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // Food Name
                Text(widget.food.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
                  // Food Price
                  Text(
                    '₹${widget.food.price}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 5),
                  // Food Description
                Text(widget.food.description),
                  const SizedBox( height:5),

                Divider(color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 8),

                // Addons
                  Text("Add ons", style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.food.availbleAddons.length,
                    padding: EdgeInsets.zero,

                    itemBuilder: (context, index) {

                      // Get individual addons
                      Addon addon = widget.food.availbleAddons[index];

                      // Return check box UI
                      return CheckboxListTile(
                          title: Text(addon.name),
                          subtitle: Text('₹${addon.price}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),),
                          value: widget.selectedAddons[addon],
                          onChanged: (bool? value) {
                            setState(() {
                              widget.selectedAddons[addon] = value!;
                            });
                          }
                      );
                    },
                  ),
                ),
              ],
              ),
            ),

            // Button Add to the Cart
            MyButton(onTap: () => addToCart(widget.food, widget.selectedAddons),
              text: "Add to cart",
            ),

            const SizedBox(height: 25),

          ],
        ),
      ),
    ),

      // Back button
      SafeArea(
        child: Opacity(
          opacity: 0.6,
          child: Container(
            margin: const EdgeInsets.only(left:10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_rounded),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
    ],
    );
  }
}

