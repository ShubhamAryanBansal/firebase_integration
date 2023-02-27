

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/news_entity/news_model/news_list_state.dart';
import '../../domain/news_entity/news_model/news_model.dart';
import '../datasource/newsfeed_impl.dart';

final newsFeedRepoProvider = Provider<NewsFeedRepo>((ref) => NewsFeedRepo(ref.read));

class NewsFeedRepo {

  final Reader _read;

  NewsFeedRepo(this._read);

  Future<NewsList> getNews(String countryCode)  async{

    Map<String,dynamic> queryParams = {
      'country' : countryCode,
      'category' : 'business',
      'apiKey' : 'fd32f8ae57794159b0719d981ba2988a'
    };

    final response = await _read(newsFeedApiProvider).getNews('top-headlines',countryCode,queryParams);

    List<dynamic> responseList = response.data['articles'];
    List<News> newsList = [];

    for (var news in responseList) {
      newsList.add(News.fromJson(news));
    }
    return NewsList(values: newsList,countryCode: countryCode);
  }

}