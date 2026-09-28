import 'package:flutter/material.dart';

import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 7, 62, 240),
        ),
      ),
      home: const ProfilePage(),
    );
  }
}

class ImageAssetSample extends StatelessWidget {
  const ImageAssetSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const CircleAvatar(
          key: Key('image-avatar'),
          radius: 103,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('images/david-laid.png'),
          ),
        ),
      ),
    );
  }
}

// Bài cũ: bố cục ba dòng.
// Muốn chạy lại bài này, đổi home thành: const ScaffoldSample().
class ScaffoldSample extends StatelessWidget {
  const ScaffoldSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: const [
                  Expanded(
                    child: _TopColumn(
                      label: 'Cột 1',
                      backgroundColor: Color.fromARGB(255, 232, 145, 138),
                    ),
                  ),
                  Expanded(
                    child: _TopColumn(
                      label: 'Cột 2',
                      backgroundColor: Color.fromARGB(255, 163, 230, 165),
                    ),
                  ),
                  Expanded(
                    child: _TopColumn(
                      label: 'Cột 3',
                      backgroundColor: Color.fromARGB(255, 153, 198, 235),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 6,
              child: ColoredBox(
                color: Color.fromARGB(255, 228, 186, 58),
                child: Center(
                  child: Icon(Icons.star, size: 50, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: const [
                  Expanded(child: _BottomColumn(text: 'Cột 1: Xin chào')),
                  Expanded(child: _BottomColumn(text: 'Cột 2: Flutter')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopColumn extends StatelessWidget {
  const _TopColumn({required this.label, required this.backgroundColor});

  final String label;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 20, color: Colors.white),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomColumn extends StatelessWidget {
  const _BottomColumn({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
