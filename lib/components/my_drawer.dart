import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_delivery/services/auth/auth_service.dart';
import '../pages/settings_page.dart';
import 'my_drawer_list_tile.dart';

 class MyDrawer extends StatelessWidget {
   const MyDrawer({super.key});

   void logout() {
     final authService = AuthService();
     authService.signOut();
   }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            // App logo
            Padding(
        padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
                Icons.lock_open_rounded,
            size: 70,
            color:Theme.of(context).colorScheme.inversePrimary
            ),
            ),

            Padding(padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),

            ),
            
            //home list tile
            MyDrawerListTile(
              text: "H O M E",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),

            //setting list tile
            MyDrawerListTile(
                text: "S E T T I N G S",
                icon: Icons.settings,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SettingsPage(),
                    ),
                  );
                }
            ),

            const Spacer(),

            //logout list tile
            MyDrawerListTile(
                text: "L O G O U T",
                icon: Icons.logout,
                onTap: () {
                  logout();
                  Navigator.pop(context);
                },
            ),
            const SizedBox(height: 25,),
          ],
        ),
    );
  }
}
