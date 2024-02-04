import 'package:flutter/material.dart';
import 'package:news_app/widgets/app_bar.dart';
import 'package:news_app/widgets/category_card.dart';
import 'package:news_app/widgets/all_catrgories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(newsName: "Cloud"),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoryCard(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            AllCategories(
              category: "general",
            ),
          ],
        ),
      ),
    );
  }
}
