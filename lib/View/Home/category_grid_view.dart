import 'package:flutter/material.dart';

// This is the Category Component for the Home Page
class CategoryGridView extends StatelessWidget {
  // Define a Category object to hold the category data
  Category category;

  int index;
  Function onClickItem;

  // Constructor to initialize Category object
  CategoryGridView(
      {required this.category, required this.index, required this.onClickItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickItem(category);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.lightGreen),
        child: Column(
          children: [
            Image.asset(category.categoryImage),
            Text(
              category.categoryTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
// Category class to hold the details of each category

class Category {
  String categoryID;
  String categoryImage;
  String categoryTitle;

  Category(
      {required this.categoryID,
      required this.categoryImage,
      required this.categoryTitle});
}
