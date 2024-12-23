import 'package:flutter/material.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(const String.fromEnvironment("TEST", defaultValue: "bad")),
      ),
      body: Center(
        child: Text("MovieListPage"),
      ),
    );
  }
}
