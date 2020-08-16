import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/blocs/blocs.dart';
import 'feed.dart';
import 'package:newsapp/repositories/news_repository.dart';
import 'loading_error.dart';
import 'loading_feed.dart';

class HomeScreen extends StatelessWidget {
  final NewsRepository repository;

  HomeScreen({@required this.repository});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<FeaturedNewsBloc, FeaturedNewsStaate>(
          cubit: FeaturedNewsBloc(repository: repository)
            ..add(FeaturedNewsRequest()),
          builder: (context, state) {
            if (state is FeaturedNewsIsLoading) {
              return LoadingFeed();
            } else if (state is FeaturedNewsLoadedWithSuccess) {
              return Feed(state.news);
            }
            return LoadingError();
          }),
    );
  }
}
