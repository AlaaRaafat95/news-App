import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

class AllCategories extends StatefulWidget {
  final String category;
  const AllCategories({super.key, required this.category});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  late Future<List<NewsModel>> getNews;
  @override
  void initState() {
    getNews = ApiServices().getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getNews,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: snapshot.data?.length,
              (context, index) => GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      snapshot.data?[index].url ?? "https://flutter.dev"));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: snapshot.data?[index].urlToImage != null
                            ? Image.network(
                                snapshot.data![index].urlToImage.toString(),
                              )
                            : Image.network(
                                "https://media.istockphoto.com/id/479607780/photo/good-news-concept-metal-letterpress-type.jpg?s=612x612&w=0&k=20&c=VFHXJBlQ_kemQzgeqR5TBsp9mLc5Kg0JE357N3Jt2As="),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data?[index].title != null
                            ? snapshot.data![index].title.toString()
                            : "",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        snapshot.data?[index].description != null
                            ? snapshot.data![index].description.toString()
                            : "Click To See More Description",
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
