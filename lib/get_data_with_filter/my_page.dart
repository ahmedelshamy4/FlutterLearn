import 'package:flutter/material.dart';
import 'package:flutter_learn/get_data_with_filter/data_model.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> categories = [
    'All',
    'Category A',
    'Category B',
    'Category C',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Data'),
        bottom: TabBar(
          padding: const EdgeInsets.all(8),
          isScrollable: true,
          controller: _tabController,
          tabs: categories.map((category) => Tab(text: category)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((category) {
          final filteredList = category == 'All'
              ? allData
              : allData.where((data) => data.category == category).toList();
          return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredList[index].name),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
