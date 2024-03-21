import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_thursday/model/source_response/Source.dart';
import 'package:news_app_c10_thursday/ui/home/news/news_item_widget.dart';
import 'package:news_app_c10_thursday/ui/home/news/news_list_view_model.dart';

class NewsListWidget extends StatefulWidget {
  Source source;

  NewsListWidget({required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  NewsListViewModel viewModel = NewsListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    // calling api
    // return FutureBuilder(
    //   future: ApiManger.getNews(source.id!),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //     if (snapshot.hasError || snapshot.data?.message == 'error') {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.data?.message ?? snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = snapshot.data?.articles;
    //     print(newsList?.length);
    //     return Expanded(
    //       child: ListView.builder(
    //           itemBuilder: (context, index) => NewsItemWidget(
    //                 news: newsList![index],
    //               ),
    //           itemCount: newsList?.length ?? 0),
    //     );
    //   },
    // );

    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Text(state.errorMessage!),
                    ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                  ],
                ),
              );
            }
          case SuccessState():
            {
              var newsList = state.newsList;

              return Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) => NewsItemWidget(
                          news: newsList![index],
                        ),
                    itemCount: newsList?.length ?? 0),
              );
            }
        }
      },
    );
  }
}
