class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCatogrie foodCatogrie;
  final List<Addon> availableAddons;

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.foodCatogrie,
      required this.availableAddons});
}

enum FoodCatogrie {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
  sudanease,
}

class Addon {
  String name;
  double price;
  Addon({
    required this.name,
    required this.price,
  });
}
