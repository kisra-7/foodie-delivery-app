import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'cart_item.dart';
import 'food.dart';

class Resturant extends ChangeNotifier {
  final List<Food> _menu = [
    Food(
      name: 'Classic Cheeseburger',
      description:
          'Juicy beef patty with cheddar cheese, lettuce, tomato, onion, pickles, and house sauce on a sesame bun.',
      imagePath: 'assets/images/burgers/1.jpg',
      price: 9.99,
      foodCatogrie: FoodCatogrie.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.40),
      ],
    ),
    Food(
      name: 'BBQ Bacon Burger',
      description:
          'Grilled beef patty topped with bacon, smoked gouda, caramelized onions, and BBQ sauce on a brioche bun.',
      imagePath: 'assets/images/burgers/2.jpg',
      price: 9.29,
      foodCatogrie: FoodCatogrie.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.40),
      ],
    ),
    Food(
      name: 'Spicy Jalapeño Burger',
      description:
          'Beef patty with jalapeños, pepper jack cheese, chipotle mayo, and crispy onions on a potato bun.',
      imagePath: 'assets/images/burgers/3.jpg',
      price: 7.69,
      foodCatogrie: FoodCatogrie.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.40),
      ],
    ),
    Food(
      name: 'Mushroom Swiss Burger',
      description:
          'Beef patty with sautéed mushrooms, Swiss cheese, and garlic aioli on a toasted artisan bun.',
      imagePath: 'assets/images/burgers/4.jpg',
      price: 8.19,
      foodCatogrie: FoodCatogrie.burgers,
      availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.40),
      ],
    ),
    Food(
      name: 'Choklate Cookies',
      description:
          'Warm, gooey chocolate cake with a molten center, served with vanilla ice cream.',
      imagePath: 'assets/images/desserts/2.jpg',
      price: 3.29,
      foodCatogrie: FoodCatogrie.desserts,
      availableAddons: [Addon(name: 'Extra Cream', price: 1.49)],
    ),
    Food(
      name: 'Tiramisu Delight',
      description:
          'Layers of coffee-soaked ladyfingers, mascarpone cream, and a dusting of cocoa.',
      imagePath: 'assets/images/desserts/3.jpg',
      price: 12.76,
      foodCatogrie: FoodCatogrie.desserts,
      availableAddons: [Addon(name: 'Extra Cream', price: 1.49)],
    ),
    Food(
      name: 'Oreo Dessert',
      description: 'Oreo with sum suprizes',
      imagePath: 'assets/images/desserts/4.jpg',
      price: 6.89,
      foodCatogrie: FoodCatogrie.desserts,
      availableAddons: [Addon(name: 'Extra Cream', price: 1.49)],
    ),
    Food(
      name: 'Oreo Milkshake',
      description:
          'A creamy blend of vanilla ice cream and crushed Oreos, topped with whipped cream and cookie crumbles.',
      imagePath: 'assets/images/drinks/1.jpg',
      price: 4.69,
      foodCatogrie: FoodCatogrie.drinks,
      availableAddons: [Addon(name: 'Extra Cream', price: 1.49)],
    ),
    Food(
      name: 'Classic Mojito',
      description:
          'A refreshing mix of fresh mint, lime, and soda water with a hint of sweetness, served over ice.',
      imagePath: 'assets/images/drinks/2.jpg',
      price: 3.99,
      foodCatogrie: FoodCatogrie.drinks,
      availableAddons: [Addon(name: 'Extra Fruit', price: 1.49)],
    ),
    Food(
      name: 'Lemon Lime Cooler',
      description:
          'Freshly squeezed lemon and lime juice, chilled and topped with a lemon slice for a zesty finish.',
      imagePath: 'assets/images/drinks/3.jpg',
      price: 2.99,
      foodCatogrie: FoodCatogrie.drinks,
      availableAddons: [Addon(name: 'Extra Fruit', price: 1.49)],
    ),
    Food(
      name: 'Caesar Salad',
      description:
          'Fresh tomatoes, cucumbers, red onions, feta cheese, and olives, drizzled with olive oil.',
      imagePath: 'assets/images/salads/1.jpg',
      price: 3.29,
      foodCatogrie: FoodCatogrie.salads,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra Oil', price: 1.49)
      ],
    ),
    Food(
      name: 'Greek Salad',
      description:
          'Crisp romaine lettuce, parmesan, crunchy croutons, and creamy Caesar dressing.',
      imagePath: 'assets/images/salads/2.jpg',
      price: 4.50,
      foodCatogrie: FoodCatogrie.salads,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra Oil', price: 1.49)
      ],
    ),
    Food(
      name: 'Garden Salad',
      description:
          'A mix of fresh greens, cherry tomatoes, cucumbers, and carrots with your choice of dressing.',
      imagePath: 'assets/images/salads/3.jpg',
      price: 5.99,
      foodCatogrie: FoodCatogrie.salads,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra Oil', price: 1.49)
      ],
    ),
    Food(
      name: 'Creamy Mac & Cheese',
      description:
          'Rich, cheesy pasta baked to perfection with a crispy breadcrumb topping.',
      imagePath: 'assets/images/sides/1.jpg',
      price: 2.99,
      foodCatogrie: FoodCatogrie.sides,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra suace', price: 1.49)
      ],
    ),
    Food(
      name: 'Crispy French Fries',
      description: 'Golden, perfectly seasoned fries, served hot and crunchy.',
      imagePath: 'assets/images/sides/2.jpg',
      price: 3.99,
      foodCatogrie: FoodCatogrie.sides,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra suace', price: 1.49)
      ],
    ),
    Food(
      name: 'Sudanease Fool',
      description:
          'Beans in the Traditional sudanese way with Jibbnah and dakwa',
      imagePath: 'assets/images/sudanease/fool.jpg',
      price: 5.39,
      foodCatogrie: FoodCatogrie.sudanease,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra suace', price: 1.49)
      ],
    ),
    Food(
      name: 'Sudanease Agashi',
      description:
          'Grilled chicken in the sudanease way with tradional sauces and dressings',
      imagePath: 'assets/images/sudanease/agashi.jpg',
      price: 7.49,
      foodCatogrie: FoodCatogrie.sudanease,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra suace', price: 1.49)
      ],
    ),
    Food(
      name: 'Sudanease Assida',
      description:
          'A traditional sudanease dish from the west of sudan made with MULAH',
      imagePath: 'assets/images/sudanease/asida.jpg',
      price: 2.29,
      foodCatogrie: FoodCatogrie.sudanease,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra suace', price: 1.49)
      ],
    ),
    Food(
      name: 'Sudanease Slatat Aswad',
      description: 'Egg-plant in the sudanease way with some dakwa and onions',
      imagePath: 'assets/images/sudanease/aswad.jpg',
      price: 3.79,
      foodCatogrie: FoodCatogrie.sudanease,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.49),
        Addon(name: 'Extra suace', price: 1.49)
      ],
    ),
  ];
  final List<CartItem> _cart = [];
  String location = '619 Muscat, Sultan Qaboos Blv';
  // getter

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // adding to the cart

  void addNewLocation(String newLocation) {
    location = newLocation;
    notifyListeners();
  }

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;

      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });
    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  // removing from the cart
  void removeFromCart(CartItem cartItem) {
    final cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get the total price of the cart

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

  // get total number of items of the car
  int getTotalCartItems() {
    int totalItemsQuantity = 0;
    for (CartItem cartItem in _cart) {
      totalItemsQuantity += cartItem.quantity;
    }
    return totalItemsQuantity;
  }
  // clear cart

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String _forematPrice(double price) {
    return ' \$${price.toStringAsFixed(2)}';
  }

  String _formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name} (${_forematPrice(addon.price)})')
        .join();
  }

  String displayReceipt() {
    String formattedTime =
        DateFormat('yyyy-mm-dd HH:mm:ss').format(DateTime.now());
    final receipt = StringBuffer();
    receipt.writeln('Here is your receipt');
    receipt.writeln();
    receipt.writeln(formattedTime);
    receipt.write('--------------------------------------------------------');
    receipt.writeln();
    for (CartItem cartItem in _cart) {
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_forematPrice(cartItem.food.price)}');
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln(_formatAddon(cartItem.selectedAddons));
      }
      receipt.writeln();
    }
    receipt.writeln('--------------------------------------------------------');
    receipt.writeln();
    receipt.writeln('Total items: ${getTotalCartItems().toString()}');
    receipt.writeln('Total price: ${_forematPrice(getTotalPrice())}');
    receipt.writeln('Location :$location');
    return receipt.toString();
  }
}
