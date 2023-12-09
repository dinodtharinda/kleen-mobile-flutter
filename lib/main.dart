import 'package:flutter/material.dart';
import 'package:kleen/themes/themes.dart';
import 'package:kleen/widgets/app_widgets.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        leading: Padding(
           padding:const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        actions: const [Padding(
          padding: EdgeInsets.only(right: 20),
          child: CircleAvatar(),
        )],
      ),
    );
  }
}
