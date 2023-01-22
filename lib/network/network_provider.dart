

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/repository/network_repo/pingoLearn_api_repository_impl.dart';

import 'interceptor.dart';

final clientProvider = Provider((ref) => Dio(BaseOptions(
    headers: {'Content-type': 'application/json'},
    connectTimeout: 10000,
    baseUrl: 'https://newsapi.org/v2/'))..interceptors.add(DioInterceptor())
);

final pingoLearnApiProvider = Provider<PingoLearnRepositoryImpl>((ref) => PingoLearnRepositoryImpl(ref.read));
