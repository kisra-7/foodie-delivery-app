import 'package:app/components/cart_tile.dart';
import 'package:app/components/cust_button.dart';
import 'package:app/models/resturant.dart';
import 'package:app/pages/payment_page.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Consumer<Resturant>(
      builder: (context, restuarent, child) {
        final cart = restuarent.cart;
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SizedBox(
                        height: 500,
                        width: 300,
                        child: AlertDialog(
                          title: const Text(
                            'Do you want to clear the cart ?',
                            style: TextStyle(fontSize: 20),
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                restuarent.clearCart();
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.check,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        )),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
            centerTitle: true,
            title: const Text('C A R T'),
            foregroundColor: theme.inversePrimary,
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: theme.surface,
          body: cart.isEmpty
              ? const Center(
                  child: Text('Arent you hungry?, The cart is empty..'),
                )
              : Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: cart.length,
                              itemBuilder: (BuildContext context, int index) {
                                final sCart = cart[index];
                                return CartTile(citem: sCart);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: CustButton(
                        text: 'Go to checkout',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
