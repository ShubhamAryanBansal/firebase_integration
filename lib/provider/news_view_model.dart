

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo_learn_assignment/provider/states/state.dart';
import '../model/news/news_list_state.dart';
import '../network/network_provider.dart';
import '../repository/firebase_repo/firebase_repository_impl.dart';


final newsListProvider = StateNotifierProvider<NewsViewModel, State<NewsList>>((ref) {
  return NewsViewModel(ref.read);
});


class NewsViewModel extends StateNotifier<State<NewsList>> {

  final Reader read;

  NewsViewModel(this.read) : super(const State.init()) {
    _getAllNews();
  }


  _getAllNews() async {
    try {
      state = const State.loading();
      final countryCode = await read(firebaseRepositoryProvider).getRemoteConfig();
      final gemsList = await read(pingoLearnApiProvider).getNews(countryCode);
      state = State.success(gemsList);
    } on Exception catch (e, stacktrace) {
      state = State.error(e);
      print('providerModalException $e');
      print(stacktrace);
    }
  }

}
