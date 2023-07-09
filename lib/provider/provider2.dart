import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: themeModel.color, // Change the primary swatch color to blue
            ),
            useMaterial3: true,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary, // Use the updated theme color
        title: const Text('Flutter Demo'),
      ),
      body: const Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeModel>(context, listen: false).toggleTheme();
        },
        child: Icon(Icons.ads_click),
      ),
    );
  }
}

class ThemeModel extends ChangeNotifier {
  Color _color = Colors.white;

  Color get color => _color;

  void toggleTheme() {
    _color = (_color == Colors.white) ? Colors.black : Colors.white;
    notifyListeners();
  }
}
