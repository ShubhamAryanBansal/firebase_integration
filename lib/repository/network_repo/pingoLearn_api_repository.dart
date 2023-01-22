
import '../../model/news/news_list_state.dart';

abstract class PingoLearnApiRepository{

  Future<NewsList> getNews(String countryCode);

}