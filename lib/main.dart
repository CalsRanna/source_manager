import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:source_manager/di.dart';
import 'package:source_manager/page/source_page.dart';

final globalKey = GlobalKey<NavigatorState>();

void main() {
  DI().ensureInitialized();
  runApp(ProviderScope(child: const SourceManagerApp()));
}

class SourceManagerApp extends StatelessWidget {
  const SourceManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Color(0xFF63BBD0),
    );
    return MaterialApp(
      home: const SourcePage(),
      navigatorKey: globalKey,
      theme: ThemeData(colorScheme: colorScheme),
      title: 'Source Manager',
    );
  }
}
