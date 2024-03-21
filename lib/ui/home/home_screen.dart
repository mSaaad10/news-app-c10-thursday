import 'package:flutter/material.dart';
import 'package:news_app_c10_thursday/model/category_model.dart';
import 'package:news_app_c10_thursday/ui/home/categories_tab_widget/categories_tab_widget.dart';
import 'package:news_app_c10_thursday/ui/home/category_details/category_details.dart';
import 'package:news_app_c10_thursday/ui/home/home_drawer.dart';
import 'package:news_app_c10_thursday/ui/home/settings_tab_widget/settings_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTabWidget(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background_pattern.png'))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28),
                  bottomLeft: Radius.circular(28))),
          title: Text('Route News App'),
        ),
        drawer: HomeDrawer(
          onDrawerMenuItemClicked: onDrawerMenuItemClicked,
        ),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget;

  void onDrawerMenuItemClicked(DrawerMenuItem item) {
    if (DrawerMenuItem.categories == item) {
      selectedWidget = CategoriesTabWidget(
        onCategoryItemClicked: onCategoryItemClicked,
      );
      setState(() {});
    } else if (DrawerMenuItem.settings == item) {
      selectedWidget = SettingsTabWidget();
      setState(() {});
    }
    Navigator.pop(context);
  }

  void onCategoryItemClicked(CategoryModel category) {
    selectedWidget = CategoryDetails(category: category);
    setState(() {});
  }
}
