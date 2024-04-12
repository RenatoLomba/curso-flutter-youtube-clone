import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  Widget? buildFlexibleSpace(BuildContext context) {
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
    );
  }
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, ''),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'Android', 'Navigation', 'IOS',
      'Games', 'AI', 'Flutter'
    ];

    if (query.isNotEmpty) {
      var filteredSuggestions = suggestions
          .where((s) => s.toLowerCase().contains(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemCount: filteredSuggestions.length,
        itemBuilder: (ctx, idx) {
          var suggestion = filteredSuggestions[idx];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              close(context, suggestion);
            },
          );
        },
      );
    }

    return const Center(
      child: Text('Nenhum resultado para a pesquisa'),
    );
  }
}