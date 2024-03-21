import 'package:flutter/material.dart';

typedef OnDrawerMenuItemClicked = void Function(DrawerMenuItem drawerMenuItem);

class HomeDrawer extends StatelessWidget {
  // static const int categories = 1;
  // static const settings = 2;
  OnDrawerMenuItemClicked onDrawerMenuItemClicked;

  HomeDrawer({required this.onDrawerMenuItemClicked});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 60),
              color: Colors.green,
              width: double.infinity,
              child: Text(
                'News App!',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
          InkWell(
            onTap: () {
              onDrawerMenuItemClicked(DrawerMenuItem.categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 42,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerMenuItemClicked(DrawerMenuItem.settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 42,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerMenuItem {
  categories,
  settings,
}
