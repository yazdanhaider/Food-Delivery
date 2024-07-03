
class Food {
  final String name;         // Burger
  final String description; // A burger with a cheese slice
  final String imagePath;     // lib/images/burger.png
  final double price;         // 100
  final FoodCategory category;   // Burger
  List<Addon> availbleAddons;    // Extra Chesse, cabbage, tomato


  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availbleAddons,
  });
}
// food categories
enum FoodCategory{
  Burgers,
  Salads,
  Mains,
  Desserts,
  Drinks,
}

// food addons
class Addon {
  String name;
  double price;

  Addon ({
    required this.name,
    required this.price,
  });
}


