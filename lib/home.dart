import 'package:flutter/material.dart';
import 'package:youtube_clone/components/app_bar.dart';
import 'package:youtube_clone/views/initial_view.dart';
import 'package:youtube_clone/views/library_view.dart';
import 'package:youtube_clone/views/on_top_view.dart';
import 'package:youtube_clone/views/subscriptions_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentNavigationIndex = 0;
  String _queryResult = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> views = [
      InitialView(
        query: _queryResult,
      ),
      const OnTopView(),
      const SubscriptionsView(),
      const LibraryView(),
    ];

    return Scaffold(
      appBar: MyAppBar(
        onSearch: (query) {
          setState(() {
            _queryResult = query;
          });
        },
      ),
      body: views[_currentNavigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentNavigationIndex,
        onTap: (idx) => setState(() => _currentNavigationIndex = idx),
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            label: 'Início',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Em alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: 'Inscrições',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
