class CategoryModel {
  String? name;
  String? image;

  CategoryModel.fromJson(Map<String, dynamic> categories) {
    name = categories["name"];
    image = categories["image"];
  }
}
