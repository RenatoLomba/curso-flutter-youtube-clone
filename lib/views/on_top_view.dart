import 'package:flutter/material.dart';

class OnTopView extends StatefulWidget {
  const OnTopView({super.key});

  @override
  State<OnTopView> createState() => _OnTopViewState();
}

class _OnTopViewState extends State<OnTopView> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Em alta'));
  }
}
