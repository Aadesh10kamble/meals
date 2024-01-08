import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.tileHandler});

  // final String currentPage;
  final void Function(String) tileHandler;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Icon(Icons.fastfood, size: 40),
                const SizedBox(width: 20),
                Text("Meals App",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white, fontSize: 30))
              ],
            ),
          )),
          ListTile(
            style: ListTileStyle.drawer,
            onTap: () => tileHandler("settings"),
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
          ListTile(
            style: ListTileStyle.drawer,
            onTap: () => tileHandler("meals"),
            leading: const Icon(Icons.no_meals),
            title: const Text("Meals"),
          ),
        ],
      ),
    );
  }
}
