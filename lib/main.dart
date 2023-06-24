import 'package:borrow_buddy/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateProvider>(
            create: (_) => AppStateProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Borrow Buddy',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppStateProvider>(context, listen: true);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(state.isDarkMode ? "Dark Mode" : "Light Mode"),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                state.toggleDarkMode();
                print("🔥 Current setting isDarkMode => ${state.isDarkMode}");
              },
              child: const Text('Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
