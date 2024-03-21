import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c10_thursday/model/category_model.dart';
import 'package:news_app_c10_thursday/ui/home/category_details/category_details_viwe_model.dart';
import 'package:news_app_c10_thursday/ui/home/category_details/sources_tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    // calling api
    // return FutureBuilder(
    //    future: ApiManger.getSources(category.id),
    //    builder: (context, snapshot) {
    //      if (snapshot.connectionState == ConnectionState.waiting) {
    //        return Center(
    //          child: CircularProgressIndicator(),
    //        );
    //      }
    //      if (snapshot.hasError || snapshot.data?.message == 'error') {
    //        return Center(
    //            child: Column(
    //          children: [
    //            Text(snapshot.data?.message ?? snapshot.error.toString()),
    //            ElevatedButton(onPressed: () {}, child: Text('Try Again'))
    //          ],
    //        ));
    //      }
    //
    //      var sourcesList = snapshot.data?.sources;
    //      return SourcesTabWidget(sources: sourcesList!);
    //    },
    //  );
//
    return BlocBuilder<CategoryDetailsViewModel, CategoryDetailsState>(
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
                  Text(state.errorMessage),
                  ElevatedButton(onPressed: () {}, child: Text('Try Again'))
                ],
              ));
            }
          case SuccessState():
            {
              var sourcesList = state.sourcesList;
              return SourcesTabWidget(sources: sourcesList!);
            }
        }
      },
    );
  }
}
