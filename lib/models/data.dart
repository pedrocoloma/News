import 'package:newsapp/models/category.dart';

List<Category> getCategories() {
  List<String> availableCategories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology',
  ];

  List<Category> categories = [];

  for (var item in availableCategories) {
    var category = Category(
      identifier: item,
      label: item,
    );
    categories.add(category);
  }

  return categories;
}
