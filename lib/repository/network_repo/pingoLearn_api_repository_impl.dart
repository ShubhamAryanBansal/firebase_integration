

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/model/news/news_list_state.dart';
import 'package:pingo_learn_assignment/repository/network_repo/pingoLearn_api_repository.dart';

import '../../model/news/news_model.dart';
import '../../network/exception.dart';
import '../../network/network_provider.dart';

class PingoLearnRepositoryImpl implements PingoLearnApiRepository{

  final Reader read;

  PingoLearnRepositoryImpl(this.read);

  @override
  Future<NewsList> getNews(String countryCode) async{

    try {

      Map<String,dynamic> queryParams = {
        'country' : countryCode,
        'category' : 'business',
        'apiKey' : 'fd32f8ae57794159b0719d981ba2988a'
      };

      final response = await read(clientProvider).get('top-headlines',queryParameters: queryParams);

      List<dynamic> responseList = response.data['articles'];
      List<News> newsList = [];

      for (var news in responseList) {
        newsList.add(News.fromJson(news));
      }

      return NewsList(values: newsList,countryCode: countryCode);
    } on DioError catch (error) {
      print('******exceptionErrorDio $error');
      throw DataException.fromDioError(error);
    }
  }
}