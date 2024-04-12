import 'package:flutter/material.dart';
import 'package:youtube_clone/components/custom_search_delegate.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.onSearch});

  final Function(String val) onSearch;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Color of the app bar
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        border: const Border(
          bottom: BorderSide(
            color: Colors.grey, // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              String? queryResult = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );

              if (queryResult != null && queryResult.isNotEmpty) {
                onSearch(queryResult);
              }
            },
            tooltip: 'Search',
          ),
        ],
        iconTheme: const IconThemeData(
          color: Colors.grey,
          opacity: 1,
        ),
        title: Image.asset(
          'images/youtube.png',
          width: 104,
          height: 28,
        ),
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove app bar elevation
      ),
    );
  }
}