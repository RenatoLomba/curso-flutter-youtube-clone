import 'package:flutter/material.dart';
import 'package:youtube_clone/api.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    api.search('');

    return const Center(child: Text('Início'));
  }
}
