import 'package:newsapp/models/article.dart';

abstract class FeaturedNewsStaate {
  FeaturedNewsStaate();
}

class FeaturedNewsInitial extends FeaturedNewsStaate {}

class FeaturedNewsIsLoading extends FeaturedNewsStaate {}

class FeaturedNewsLoadedWithSuccess extends FeaturedNewsStaate {
  final List<Article> news;
  FeaturedNewsLoadedWithSuccess({this.news});
}

class FeaturedNewsLoadedWithError extends FeaturedNewsStaate {}
