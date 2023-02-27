

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../network/exception.dart';
import '../../../../network/network_provider.dart';
import 'newsfeed.dart';

final newsFeedApiProvider = Provider<NewsFeed>((ref) => NewsAPIImpl(ref.read));

class NewsAPIImpl implements NewsFeed{

  final Reader read;

  NewsAPIImpl(this.read);

  @override
  Future<Response> getNews(String pathParam,String countryCode, Map<String,dynamic> queryParams) async{

    try {

      final response = await read(clientProvider).get(pathParam,queryParameters: queryParams);
      return response;

    } on DioError catch (error) {
      print('******exceptionErrorDio $error');
      throw DataException.fromDioError(error);
    }
  }
}