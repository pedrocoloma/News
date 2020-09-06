import 'package:flutter_test/flutter_test.dart';
import 'package:newsapp/blocs/blocs.dart';
import 'package:newsapp/models/article.dart';
import 'package:newsapp/repositories/news_repository.dart';
import 'package:mockito/mockito.dart';

class MockNewsRepository extends Mock implements NewsRepository {}

void main() {
  MockNewsRepository mockNewsRepository;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
  });

  group('Get featured news', () {
    List<Article> articles = [
      Article(
          title:
              'PIX, novo meio de pagamento eletrônico, começa a funcionar em novembro no Brasil',
          author: 'CNN Brasile',
          description:
              'O PIX será o novo meio de pagamento eletrônico brasileiro. A partir de 16 de novembro, o cliente poderá optar pelo serviço ao invés do DOC ou do TED na hora de realizar pagamentos ou transferências bancárias.',
          url: '',
          urlToImage:
              'https://medias.cnnbrasil.com.br/v1/proxy?image=https%3a%2f%2fmediastorage.cnnbrasil.com.br%2fIMAGES%2f00%2f00%2f01%2f13811_F5C2DB06ACA322CD.jpeg',
          content:
              'https://www.cnnbrasil.com.br/business/2020/09/06/pix-novo-meio-de-pagamento-eletronico-comeca-a-funcionar-em-novembro-no-brasil'),
    ];
    test('with success', () {
      when(mockNewsRepository.getNews()).thenAnswer((_) async => articles);

      final bloc = FeaturedNewsBloc(repository: mockNewsRepository);

      bloc.add(FeaturedNewsRequest());

      expectLater(
          bloc,
          emitsInOrder([
            FeaturedNewsIsLoading(),
            FeaturedNewsLoadedWithSuccess(news: articles),
          ]));
    });

    test('with error', () {
      when(mockNewsRepository.getNews()).thenThrow(Error());

      final bloc = FeaturedNewsBloc(repository: mockNewsRepository);
      bloc.add(FeaturedNewsRequest());

      expectLater(
          bloc,
          emitsInOrder([
            FeaturedNewsIsLoading(),
            FeaturedNewsLoadedWithError(),
          ]));
    });
  });
}
