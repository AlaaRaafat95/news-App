import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/news_with_category.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  List<CategoryModel> categoriesList = [];

  void getCategory() async {
    String categoryData = await rootBundle.loadString("assets/data/data.json");
    List<Map<String, dynamic>> decodedData =
        List<Map<String, dynamic>>.from(jsonDecode(categoryData)["categories"]);
    categoriesList = decodedData.map((e) => CategoryModel.fromJson(e)).toList();
    setState(() {});
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsWithCategory(
                  categoryModel: categoriesList[index],
                ),
              ),
            );
          },
          child: Container(
            width: 150,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(categoriesList[index].image.toString()),
              ),
            ),
            child: Text(
              categoriesList[index].name.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
