import 'package:app/components/cust_button.dart';
import 'package:app/models/food.dart';
import 'package:app/models/resturant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddon = {};
  FoodPage({super.key, required this.food}) {
    for (Addon addon in food.availableAddons) {
      selectedAddon[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addon, bool> selectedAddon) {
    List<Addon> currentlyselectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddon[addon] == true) {
        currentlyselectedAddons.add(addon);
      }
    }
    context.read<Resturant>().addToCart(food, currentlyselectedAddons);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: theme.surface,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // food image
                Image.asset(
                  widget.food.imagePath,
                ),
                const SizedBox(
                  height: 10,
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //food price
                      Text(
                        '\$ ${widget.food.price.toString()}',
                        style: TextStyle(fontSize: 18, color: theme.primary),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //food description
                      Text(
                        widget.food.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Divider(
                        color: theme.tertiary,
                      ),
                      // addons
                      Text(
                        'Add-ons',
                        style: TextStyle(
                            color: theme.inversePrimary, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            border: Border.all(color: theme.secondary),
                            borderRadius: BorderRadius.circular(12)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (BuildContext context, int index) {
                            final addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              value: widget.selectedAddon[addon],
                              onChanged: (bool? val) {
                                setState(() {
                                  widget.selectedAddon[addon] = val!;
                                });
                              },
                              title: Text(addon.name),
                              subtitle: Text(addon.price.toString()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),

                      //button // add to cart
                      CustButton(
                        text: 'Add to cart',
                        onTap: () =>
                            addToCart(widget.food, widget.selectedAddon),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Opacity(
              opacity: 0.4,
              child: Container(
                decoration: BoxDecoration(
                    color: theme.secondary, shape: BoxShape.circle),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
