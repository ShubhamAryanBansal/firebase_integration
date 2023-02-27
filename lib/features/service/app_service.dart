

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/features/authentication/data/datasource/firebase_impl.dart';
import '../newsfeed/data/news_feed_repo/news_feed_repo.dart';
import '../newsfeed/domain/news_entity/news_model/news_list_state.dart';

final applicationService = Provider<ApplicationService>((ref) => ApplicationService(ref.read));

class ApplicationService {

  final Reader _read;

  ApplicationService(this._read);

  Future<NewsList> getNewsFeed() async{

    final countryCode = await _read(firebaseProvider).getRemoteConfig(); //fetching countryCode
    final gemsList = await _read(newsFeedRepoProvider).getNews(countryCode); //fetching news_model of that countryCode
    return gemsList;
  }
}

