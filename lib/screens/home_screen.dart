import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/blocs/featued_news_bloc.dart';
import 'package:newsapp/blocs/featured_news_event.dart';
import 'package:newsapp/blocs/featured_news_state.dart';
import 'package:newsapp/components/feed.dart';
import 'package:newsapp/repositories/news_repository.dart';
import 'package:shimmer/shimmer.dart';

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
              return Center(
                child: Container(
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: ListView.builder(
                        itemBuilder: (_, __) => Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 10.0,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: double.infinity,
                                    height: 180,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 70,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
              );
            } else if (state is FeaturedNewsLoadedWithSuccess) {
              return Feed(state.news);
            }
            return Container(
              width: 0,
              height: 0,
            );
          }),
    );
  }
}
