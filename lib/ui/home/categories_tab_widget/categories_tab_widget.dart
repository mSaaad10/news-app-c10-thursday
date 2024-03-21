import 'package:flutter/material.dart';
import 'package:news_app_c10_thursday/model/category_model.dart';
import 'package:news_app_c10_thursday/ui/home/categories_tab_widget/category_item_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryModel category);

class CategoriesTabWidget extends StatelessWidget {
  OnCategoryItemClicked onCategoryItemClicked;

  CategoriesTabWidget({required this.onCategoryItemClicked});

  List<CategoryModel> categoriesList = CategoryModel.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xFF4F5A69)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 25, crossAxisSpacing: 24, crossAxisCount: 2),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryItemClicked(categoriesList[index]);
                },
                child: CategoryItemWidget(
                  category: categoriesList[index],
                  index: index,
                ),
              ),
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
