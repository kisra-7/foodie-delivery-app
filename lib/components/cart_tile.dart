import 'package:app/models/cart_item.dart';
import 'package:app/models/resturant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartTile extends StatefulWidget {
  CartItem citem;
  CartTile({super.key, required this.citem});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Resturant>(builder: (context, restuarent, child) {
      void incrementQuantity() {
        restuarent.addToCart(widget.citem.food, widget.citem.selectedAddons);
      }

      void removeItem() {
        restuarent.removeFromCart(widget.citem);
      }

      return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.citem.food.imagePath,
                      width: 80,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.citem.food.name),
                      Text(
                        '\$ ${widget.citem.food.price.toString()}',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  // quantity controlls
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.tertiary),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: removeItem,
                          child: const Icon(
                            Icons.remove,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        SizedBox(
                          width: 17,
                          child: Text(
                            widget.citem.quantity.toString(),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          onTap: incrementQuantity,
                          child: const Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: widget.citem.selectedAddons.isEmpty ? 0 : 45,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: widget.citem.selectedAddons.length,
                itemBuilder: (BuildContext context, int index) {
                  final cartItem = widget.citem.selectedAddons[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(color: Colors.grey.shade800)),
                        child: Row(
                          children: [
                            Text(
                              cartItem.name,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              '(\$${cartItem.price.toString()})',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
