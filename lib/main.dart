import 'package:card_giver/providers/element_view.dart';
import 'package:card_giver/screens/card_constructor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Card diver';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ElementsView>(
      create: (_) => ElementsView(),
      child: MaterialApp(
        title: _title,
        routes: {
          '/': (context) => const CardConstructor(),
        },
      ),
    );
  }
}
