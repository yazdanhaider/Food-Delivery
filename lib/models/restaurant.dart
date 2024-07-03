import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/models/cart_item.dart';
import 'package:food_delivery/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {

  // list of food menu
  final List<Food> _menu = [

    // Burgers
    Food(
      name: "Classic Veg Burger",
      description: "Veg cheese burger is a sandwich with a vegetable patty, cheese, and toppings in a bun.",
      imagePath: "lib/images/burgers/veg_cheese_burger.png",
      price: 99,
      category: FoodCategory.Burgers,
      availbleAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Bacon", price: 20),
        Addon(name: "Avocado", price: 20),
      ],
    ),

    Food(
      name: "Bbq Burger",
      description: "A BBQ burger is a hamburger topped with barbecue sauce, often accompanied by ingredients like cheese, bacon, onions, and pickles.",
      imagePath: "lib/images/burgers/bbq_burger.png",
      price: 149,
      category: FoodCategory.Burgers,
      availbleAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Bacon", price: 40),
        Addon(name: "Avocado", price: 50),
      ],
    ),

    Food(
      name: "Chiken Tikka Burger",
      description: "A chicken tikka burger is a sandwich with a chicken patty marinated in Indian spices, served in a bun with lettuce, tomato, and mayonnaise.",
      imagePath: "lib/images/burgers/chicken_burger.png",
      price: 149,
      category: FoodCategory.Burgers,
      availbleAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Chicken", price: 50),
        Addon(name: "Sauce", price: 20),
      ],
    ),

    Food(
      name: "Paneer Tikka Burger",
      description: "A paneer tikka burger is a sandwich with a grilled or fried paneer (Indian cottage cheese) patty, marinated in tikka spices, served in a bun with lettuce, tomato, and mayonnaise or other condiments.",
      imagePath: "lib/images/burgers/paneer_tikka_burger.png",
      price: 99,
      category: FoodCategory.Burgers,
      availbleAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Paneer", price: 40),
        Addon(name: "Avocado", price: 20),
      ],
    ),

    Food(
      name: "Paneer Burger",
      description: "A paneer burger is a sandwich featuring a grilled or fried paneer patty, typically seasoned with Indian spices, served in a bun with lettuce, tomato, onion, and various sauces or condiments.",
      imagePath: "lib/images/burgers/paneer_burger.jpeg",
      price: 99,
      category: FoodCategory.Burgers,
      availbleAddons: [
        Addon(name: "Extra Cheese", price: 20),
        Addon(name: "Paneer", price: 40),
        Addon(name: "Tomato", price: 20),
      ],
    ),


    // Salads
    Food(
      name: "Asian Salad",
      description: "Fresh mix of vegetables with Asian-inspired dressing, often topped with crispy wonton strips or sesame seeds.",
      imagePath: "lib/images/salads/asian_salad.png",
      price: 139,
      category: FoodCategory.Salads,
      availbleAddons: [
        Addon(name: "Seasame Seeds", price: 20),
        Addon(name: "Bacon", price: 20),
        Addon(name: "Avacado", price: 20),
      ],
    ),

    Food(
      name: "Brocolli Salad",
      description: "Salad made with broccoli florets, often mixed with bacon, red onions, and a creamy dressing.",
      imagePath: "lib/images/salads/brocolli_salad.png",
      price: 129,
      category: FoodCategory.Salads,
      availbleAddons: [
        Addon(name: "Brocolli", price: 30),
        Addon(name: "Chat Masala", price: 20),
        Addon(name: "Avacado", price: 20),
      ],
    ),

    Food(
      name: "Caesar Salad",
      description: "Romaine lettuce tossed with Caesar dressing, croutons, and grated Parmesan cheese.",
      imagePath: "lib/images/salads/caesar_salad.png",
      price: 139,
      category: FoodCategory.Salads,
      availbleAddons: [
        Addon(name: "Cheese", price: 20),
        Addon(name: "Caesar", price: 30),
        Addon(name: "Croutons", price: 20),
      ],
    ),

    Food(
      name: "Greek Salad",
      description: "Classic salad with tomatoes, cucumbers, onions, olives, and feta cheese, dressed with olive oil and herbs.",
      imagePath: "lib/images/salads/greek_salad.png",
      price: 149,
      category: FoodCategory.Salads,
      availbleAddons: [
        Addon(name: "Tomatoes", price: 20),
        Addon(name: "Cucumbers", price: 20),
        Addon(name: "Olives", price: 30),
      ],
    ),


    Food(
      name: "Veg Salad",
      description: "Assorted raw vegetables like lettuce, cucumber, carrots, and bell peppers, often served with a vinaigrette or ranch dressing.",
      imagePath: "lib/images/salads/veg_salad.png",
      price: 119,
      category: FoodCategory.Salads,
      availbleAddons: [
        Addon(name: "Carrots", price: 20),
        Addon(name: "Lettuce", price: 20),
        Addon(name: "Cucumber", price: 20),
      ],
    ),


    // Drinks
    Food(
      name: "Blueberry Shake",
      description: "Thick and creamy beverage made with fresh or frozen blueberries blended with milk and sometimes yogurt or ice cream.",
      imagePath: "lib/images/drinks/blueberry_shake.png",
      price: 139,
      category: FoodCategory.Drinks,
      availbleAddons: [
        Addon(name: "Blueberry", price: 30),
      ],
    ),

    Food(
      name: "Chocolate Shake",
      description: "Rich and indulgent drink made by blending chocolate syrup, cocoa powder, or chocolate ice cream with milk or ice cream.",
      imagePath: "lib/images/drinks/chocolate_shake.png",
      price: 129,
      category: FoodCategory.Drinks,
      availbleAddons: [
        Addon(name: "Chocolate", price: 30),
      ],
    ),

    Food(
      name: "Kesar Shake",
      description: "Sweet and fragrant shake flavored with saffron (kesar), often mixed with milk, sugar, and sometimes nuts like almonds or pistachios.",
      imagePath: "lib/images/drinks/kesar_shake.png",
      price: 139,
      category: FoodCategory.Drinks,
      availbleAddons: [
        Addon(name: "Kesar", price: 30),
      ],
    ),

    Food(
      name: "Rasberry Shake",
      description: "Refreshing beverage made with ripe raspberries blended with milk, yogurt, or ice cream to create a creamy and fruity treat.",
      imagePath: "lib/images/drinks/rasberry_shake.png",
      price: 139,
      category: FoodCategory.Drinks,
      availbleAddons: [
        Addon(name: "Rasberry", price: 30),
      ],
    ),

    Food(
      name: "Mint Mojito",
      description: "A classic cocktail made with fresh mint leaves, lime juice, sugar, and white rum, topped with soda water and served over ice for a refreshing and minty flavor.",
      imagePath: "lib/images/drinks/mint_mojito.png",
      price: 149,
      category: FoodCategory.Drinks,
      availbleAddons: [
        Addon(name: "Rum", price: 50),
      ],
    ),

    // Mains
    Food(
      name: "Paneer Tikka Masala",
      description: "Indian dish with grilled paneer (cottage cheese) in a creamy tomato-based sauce flavored with Indian spices like garam masala.",
      imagePath: "lib/images/mains/paneer_tikka_masala.png",
      price: 179,
      category: FoodCategory.Mains,
      availbleAddons: [
        Addon(name: "Paneer", price: 50),
        Addon(name: "Cheese", price: 20),
      ],
    ),

    Food(
      name: "Chicken Tikka Masala",
      description: "Indian dish featuring grilled chicken in a creamy tomato-based sauce with spices like cumin, coriander, and turmeric.",
      imagePath: "lib/images/mains/chicken_tikka_masala.png",
      price: 189,
      category: FoodCategory.Mains,
      availbleAddons: [
        Addon(name: "Chicken", price: 50),
        Addon(name: "Cheese", price: 20),
      ],
    ),

    Food(
      name: "Chicken Kebab",
      description: "Skewered and grilled pieces of marinated chicken, often served with vegetables or rice.",
      imagePath: "lib/images/mains/chicken_kebab.png",
      price: 149,
      category: FoodCategory.Mains,
      availbleAddons: [
        Addon(name: "cheese", price: 20),
      ],
    ),

    Food(
      name: "Mushroom Tikka Kebab",
      description: "Skewered and grilled mushrooms stuffed or coated with cheese, seasoned with herbs and spices for flavor.",
      imagePath: "lib/images/mains/mushroom_tikka_kebab.png",
      price: 159,
      category: FoodCategory.Mains,
      availbleAddons: [
        Addon(name: "Mushroom", price: 50),
        Addon(name: "Cheese", price: 20),
      ],
    ),

    Food(
      name: "Spaghetti",
      description: "Long, thin pasta noodles made from durum wheat semolina, typically served with various sauces such as marinara, carbonara, or pesto.",
      imagePath: "lib/images/mains/spaghetti.png",
      price: 129,
      category: FoodCategory.Mains,
      availbleAddons: [
        Addon(name: "Veggies", price: 50),
      ],
    ),


    // Desserts
    Food(
      name: "Kunafa",
      description: "Middle Eastern dessert made with shredded phyllo dough layered with sweet cheese or nuts, soaked in sugar syrup or honey.",
      imagePath: "lib/images/desserts/kunafa.png",
      price: 199,
      category: FoodCategory.Desserts,
      availbleAddons: [
        Addon(name: "Cream", price: 40),
      ],
    ),

    Food(
      name: "Cheesecake",
      description: "Rich dessert made with a sweetened cream cheese or ricotta cheese filling on a crust, often made from crushed cookies or graham crackers.",
      imagePath: "lib/images/desserts/cheesecake.png",
      price: 149,
      category: FoodCategory.Desserts,
      availbleAddons: [
        Addon(name: "Blueberry", price: 30),
      ],
    ),

    Food(
      name: "Shahi-Tukda",
      description: "Indian dessert made with fried bread slices soaked in sweetened milk, flavored with cardamom, saffron, and garnished with nuts.",
      imagePath: "lib/images/desserts/shahi_tukda.png",
      price: 159,
      category: FoodCategory.Desserts,
      availbleAddons: [
        Addon(name: "Saffron", price: 30),
        Addon(name: "Pista", price: 30),
      ],
    ),

    Food(
      name: "Gulab Jamun",
      description: "Indian dessert made from milk solids (khoya) or powdered milk, shaped into balls, deep-fried until golden brown, and then soaked in sugar syrup flavored with cardamom, saffron, and rose water.",
      imagePath: "lib/images/desserts/gulab_jamun.png",
      price: 119,
      category: FoodCategory.Desserts,
      availbleAddons: [
        Addon(name: "Pista", price: 30),
      ],
    ),

    Food(
      name: "Rabdi",
      description: "ndian sweet dish made by simmering milk until it thickens, flavored with sugar, cardamom, saffron, and often garnished with nuts like almonds and pistachios.",
      imagePath: "lib/images/desserts/rabdi.png",
      price: 129,
      category: FoodCategory.Desserts,
      availbleAddons: [
        Addon(name: "Pista", price: 30),
        Addon(name: "Saffron", price: 30),

      ],
    ),
  ];

  // User cart
  final List<CartItem> _cart = [];

  // delivery address which users can change and update
  String _deliveryAddress = "VIT Bhopal University";

  /*

  GETTERS

   */

  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

/*

  OPERATIONS

   */



// Add to Cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // See if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // Check if the food item are same
      bool isSameFood = item.food == food;

      // Check if the list of addons are the same
      bool isSameAddons = const ListEquality().equals(
          item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    // If item already exists, just increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // Otherwise, add a new cart item
    else {
      _cart.add(
        CartItem(
            food: food,
            selectedAddons: selectedAddons
        ),
      );
    }
    notifyListeners();
  }

// Remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart [cartIndex].quantity > 1) {
        _cart[cartIndex].quantity --;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

// Get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

// Get total numbers of items in the cart
  int getTotaItemCount() {
    int totalItemcount = 0;

    for (CartItem cartItem in _cart) {
      totalItemcount += cartItem.quantity;
    }
    return totalItemcount;
  }

// Clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Update the delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }


/*

  HELPERS

   */

  // Generate a receipt

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your ZWIGGY receipt.");
    receipt.writeln();

    // Format the date to include up to seconds only
    String formattedDate =
    DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(
              cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(
            "    Add-ons : ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotaItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }


// Format double value into money
  String _formatPrice(double price) {
    return "₹${price.toStringAsFixed(2)}";
  }

// format list addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "₹${addon.name} (₹${_formatPrice(addon.price)})").join(
        ", ");
  }
}