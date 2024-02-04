import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/all_catrgories.dart';
import 'package:news_app/widgets/app_bar.dart';

class NewsWithCategory extends StatelessWidget {
  const NewsWithCategory({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(newsName: categoryModel.name.toString()),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            AllCategories(
              category: categoryModel.name.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
