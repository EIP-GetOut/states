import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _themeColor = Colors.blue; // Set initial theme color to blue

  void _toggleThemeColor() {
    setState(() {
      _themeColor = _themeColor == Colors.blue ? Colors.red : Colors.blue; // Toggle between blue and red color
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: _themeColor, // Use the updated theme color
        scaffoldBackgroundColor: _themeColor.withOpacity(0.1), // Adjust background color
        appBarTheme: AppBarTheme(
          backgroundColor: _themeColor, // Adjust app bar color
        ),
      ),
      home: MyHomePage(
        toggleThemeColor: _toggleThemeColor,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function() toggleThemeColor;

  const MyHomePage({super.key, required this.toggleThemeColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Theme.of(context).primaryColor, // Use the updated theme color
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: toggleThemeColor,
              child: const Text('Change Color'),
            ),
          ],
        ),
      ),
    );
  }
}
