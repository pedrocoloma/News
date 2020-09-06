import 'package:equatable/equatable.dart';
import 'package:newsapp/models/article.dart';

abstract class FeaturedNewsStaate extends Equatable {
  FeaturedNewsStaate();

  @override
  List<Object> get props => [];
}

class FeaturedNewsInitial extends FeaturedNewsStaate {}

class FeaturedNewsIsLoading extends FeaturedNewsStaate {}

class FeaturedNewsLoadedWithSuccess extends FeaturedNewsStaate {
  final List<Article> news;
  FeaturedNewsLoadedWithSuccess({this.news});
}

class FeaturedNewsLoadedWithError extends FeaturedNewsStaate {}
