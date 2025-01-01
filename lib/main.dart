import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie_app/presentation/pages/movie_list/movie_list_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'Movie App',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MovieListPage(),
    );
  }
}
