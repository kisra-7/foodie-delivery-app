import 'package:app/pages/settings.dart';
import 'package:app/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _authServices = AuthServices();
    try {
      _authServices.logOut();
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: theme.surface,
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Lottie.asset(
              'assets/lot3.json',
              width: double.infinity,
              height: 300,
            ),
            DrawerTile(
              icon: Icons.home,
              text: 'H O M E',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const DrawerTile(
              icon: Icons.favorite,
              text: 'Favorite Meals',
            ),
            DrawerTile(
              icon: Icons.settings,
              text: 'S E T T I N G S',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
            ),
            const Spacer(),
            DrawerTile(
              text: 'Log out',
              icon: Icons.logout,
              onTap: () => logOut(context),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
