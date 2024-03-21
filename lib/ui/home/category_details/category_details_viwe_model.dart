import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_thursday/api_manager/api_manager.dart';
import 'package:news_app_c10_thursday/model/source_response/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  CategoryDetailsViewModel() : super(LoadingState(message: 'Loading'));

  //loading
  // error
  // success

  void loadSources(String categoryId) async {
    try {
      var response = await ApiManger.getSources(categoryId);
      if (response.message == 'error') {
        emit(ErrorState(errorMessage: response.message!));
      } else {
        emit(SuccessState(sourcesList: response.sources));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class LoadingState extends CategoryDetailsState {
  String? message;

  LoadingState({this.message});
}

class SuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;

  SuccessState({this.sourcesList});
}

class ErrorState extends CategoryDetailsState {
  String errorMessage;

  ErrorState({required this.errorMessage});
}
