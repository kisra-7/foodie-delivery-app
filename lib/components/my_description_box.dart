import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myprimarytextstyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    var mysecondrytextstyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                '\$1.29',
                style: mysecondrytextstyle,
              ),
              Text(
                'Delivery fee',
                style: myprimarytextstyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '15-30 min',
                style: mysecondrytextstyle,
              ),
              Text(
                'Delivery time',
                style: myprimarytextstyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
