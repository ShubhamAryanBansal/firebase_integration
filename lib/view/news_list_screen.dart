

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingo_learn_assignment/app_utils/utils.dart';
import 'package:pingo_learn_assignment/model/news/news_model.dart';

import '../model/news/news_list_state.dart';
import '../provider/news_view_model.dart';
import '../widgets/custom_colors.dart';
import '../widgets/custom_textStyle.dart';

class NewsListView extends ConsumerStatefulWidget {
  const NewsListView({Key? key}) : super(key: key);

  @override
  ConsumerState<NewsListView> createState() => _NewsState();
}

class _NewsState extends ConsumerState<NewsListView> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: backgroundColor,
      //appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 1.h),
        child: Center(
          child: Column(
            children: <Widget>[
              Consumer(
                builder: (context, ref, _) {
                  return ref.watch(newsListProvider).maybeWhen(
                    success: (content) => _buildNewsListContainer(context, content),
                    error: (error) => _buildErrorWidget(error),
                    orElse: () => Expanded(
                        child: Center(child: Platform.isAndroid ? const CircularProgressIndicator(color: headingColor,) : const CupertinoActivityIndicator(color: headingColor,))),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar(String countryCode) {
    return AppBar(
      title: Text(
        'MyNews',
        style: buttonText,
      ),
      backgroundColor: headingColor,
      elevation: 0,
      actions: [
       TextButton.icon(onPressed: (){},
           icon: const Icon(
              Icons.near_me,
              size: 22,
              color: textFieldColor,
              ),
           label: Text(countryCode.toUpperCase(),style: buttonText,)),
        SizedBox(width: 20.w,)
      ],
    );
  }


  Widget _buildNewsListContainer(final BuildContext context, final NewsList newsList) {
    return Expanded(child: _buildNewsList(context, newsList));
  }


  Widget _buildNewsList(final BuildContext context, final NewsList newsList) {

    if (newsList.length == 0) {
      return const Center(child: Text('No News to Show!'));
    } else {
      return Column(
        children: [
          _buildAppBar(newsList.countryCode),
          Padding(
            padding: EdgeInsets.only(top: 24.h,left: 12.w),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Top Headlines',style: newsHeadline,)),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              itemCount: newsList.length,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (final BuildContext context, final int index) {
                return _buildNewsListCardWidget(context, newsList[index]);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget _buildNewsListCardWidget(final BuildContext context, final News news) {
    try {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Card(
          color: textFieldColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(news.source.name, style: newsHeadingColor, overflow: TextOverflow.ellipsis),
                          SizedBox(height: 6.h,),
                          Text(news.description.length < 60 ? '${news.description.substring(0, news.description.length - 1)}...' : '${news.description.substring(0, 60)}...',
                            style: descriptionTextStyle,),
                          SizedBox(height: 12.h,),
                          Visibility(
                              visible: AppUtils.publishedAt(news.publishedAt) != '',
                              child: Text(AppUtils.publishedAt(news.publishedAt), style: publishedAtTextStyle, overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ),
                    news.description.length < 30 ? SizedBox(width: 60.h,) : SizedBox(width: 30.h,),
                    Expanded(
                      child: CachedNetworkImage(
                        height: 100.h,
                        width: 1.w,
                        imageUrl: news.urlToImage,
                        key: UniqueKey(),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,),
                          ),
                        ),
                        placeholder: (context, url) =>  Container(
                          alignment: Alignment.center,
                          height: 30.h,
                          width: 10.w,
                          child: Platform.isIOS ? const CupertinoActivityIndicator() : const CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }catch(e,stacktrace){
      print('exceptionNewsListView ${e.toString()}');
      print(stacktrace);
      return Container();
    }

  }

  Widget _buildErrorWidget(Exception error) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100.h,),
        const  Icon(Icons.network_check,size: 31,),
        Text(error.toString(),overflow: TextOverflow.ellipsis,),
      ],
    ));
  }



  @override
  void dispose() {
    super.dispose();
  }
}
