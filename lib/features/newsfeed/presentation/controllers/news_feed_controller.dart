
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../service/app_service.dart';
import '../../domain/news_entity/news_model/news_list_state.dart';


final newsFeedController = StateNotifierProvider<NewsFeedController, AsyncValue<NewsList>>((ref) {
  return NewsFeedController(ref.read);
});


class NewsFeedController extends StateNotifier<AsyncValue<NewsList>> {

  final Reader read;

  NewsFeedController(this.read) : super(const AsyncValue.loading()){
    _getAllNews();
  }


  _getAllNews() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => read(applicationService).getNewsFeed());
  }

}
