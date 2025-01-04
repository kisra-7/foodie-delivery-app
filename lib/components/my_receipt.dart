import 'package:app/models/resturant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 5),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Thank you for your order!'),
            const SizedBox(
              height: 25,
            ),
            Consumer<Resturant>(
              builder: (context, restuarent, child) => Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    border: Border.all(color: theme.tertiary),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(restuarent.displayReceipt()),
              ),
            ),
            Lottie.asset(
              'assets/motor.json',
              width: 300,
              height: 300,
            ),
            Text(
              'Your order is been prepared...',
              style: GoogleFonts.cedarvilleCursive(
                fontSize: 25,
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
