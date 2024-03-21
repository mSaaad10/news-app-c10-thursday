import 'package:flutter/material.dart';
import 'package:news_app_c10_thursday/model/source_response/Source.dart';
import 'package:news_app_c10_thursday/ui/home/category_details/tab_item_widget.dart';
import 'package:news_app_c10_thursday/ui/home/news/news_list_widget.dart';

class SourcesTabWidget extends StatefulWidget {
  List<Source> sources;

  SourcesTabWidget({required this.sources});

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (newIndex) {
                selectedIndex = newIndex;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => TabItemWidget(
                        source: source, //                   0         0
                        isSelected:
                            widget.sources.indexOf(source) == selectedIndex,
                      ))
                  .toList(),
            ),
            NewsListWidget(source: widget.sources[selectedIndex])
          ],
        ));
  }
}
