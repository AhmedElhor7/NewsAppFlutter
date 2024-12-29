import 'package:flutter/material.dart';
import 'package:news_app/View/Home/category_grid_view.dart';
import 'package:news_app/View/category/category_news_list.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "homeView";

  List<Category> category = [
    Category(
        categoryID: "sports",
        categoryImage: "assets/images/ball.png",
        categoryTitle: "Sports"),
    Category(
        categoryID: "general",
        categoryImage: "assets/images/Politics.png",
        categoryTitle: "Politics"),
    Category(
        categoryID: "health",
        categoryImage: "assets/images/health.png",
        categoryTitle: "Health"),
    Category(
        categoryID: "business",
        categoryImage: "assets/images/bussines.png",
        categoryTitle: "Bussines"),
    Category(
        categoryID: "technology",
        categoryImage: "assets/images/environment.png",
        categoryTitle: "Technology"),
    Category(
        categoryID: "science",
        categoryImage: "assets/images/science.png",
        categoryTitle: "Science"),
  ];

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Category? selectedCategory;

  void onClickCategory(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          'News App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        // Apply rounded corners to the bottom left and right of the AppBar
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 20),
              width: double.infinity,
              color: Colors.green,
              height: 120,
              child: Text(
                'News App',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = null;
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: selectedCategory == null
          ? Container(
              padding: EdgeInsets.all(2),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  const Text(
                    'Pick Up Your Category  Of Interest',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 6 / 7),
                      itemBuilder: (context, index) => CategoryGridView(
                        category: widget.category[index],
                        index: index,
                        onClickItem: onClickCategory,
                      ),
                      itemCount: widget.category.length,
                    ),
                  ),
                ],
              ),
            )
          : CategoryNewsList(selectedCategory!),
    );
  }
}
