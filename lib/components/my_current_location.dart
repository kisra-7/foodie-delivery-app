import 'package:app/models/resturant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});

  TextEditingController locController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void loactionDialog() {
      showDialog(
        context: context,
        builder: (context) => Consumer<Resturant>(
          builder: (context, rest, child) => AlertDialog(
            title: const Text('Your location'),
            content: TextField(
              controller: locController,
              decoration: const InputDecoration(hintText: 'Search address..'),
            ),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  rest.addNewLocation(locController.text);
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Consumer<Resturant>(
        builder: (context, rest, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delievr now',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: loactionDialog,
              child: Row(
                children: [
                  Text(
                    rest.location,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
