import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_thursday/api_manager/api_manager.dart';
import 'package:news_app_c10_thursday/model/news_response/News.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState(message: 'Loading...'));

  void getNews(String sourceId) async {
    try {
      var response = await ApiManger.getNews(sourceId);
      if (response.message == 'error') {
        emit(ErrorState(errorMessage: response.message));
      } else {
        emit(SuccessState(newsList: response.articles));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class NewsListState {}

class LoadingState extends NewsListState {
  String? message;

  LoadingState({this.message});
}

class SuccessState extends NewsListState {
  List<News>? newsList;

  SuccessState({this.newsList});
}

class ErrorState extends NewsListState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}
