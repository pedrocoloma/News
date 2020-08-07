import 'package:bloc/bloc.dart';
import 'package:newsapp/blocs/blocs.dart';
import 'package:newsapp/repositories/news_repository.dart';

class FeaturedNewsBloc extends Bloc<FeaturedNewsEvent, FeaturedNewsStaate> {
  final NewsRepository repository;
  FeaturedNewsBloc({this.repository})
      : assert(repository != null),
        super(FeaturedNewsInitial());

  @override
  Stream<FeaturedNewsStaate> mapEventToState(FeaturedNewsEvent event) async* {
    if (event is FeaturedNewsRequest) {
      yield FeaturedNewsIsLoading();
      try {
        final news = await repository.getNews();
        yield FeaturedNewsLoadedWithSuccess(news: news);
      } catch (_) {
        yield FeaturedNewsLoadedWithError();
      }
    }
  }
}
