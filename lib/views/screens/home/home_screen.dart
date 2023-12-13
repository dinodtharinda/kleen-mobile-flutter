// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleen/utils/custom/app_custom_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Get.isDarkMode;
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        actions: [
          IconButton(
              onPressed: () {
                Get.changeThemeMode(
                    isDarkMode ? ThemeMode.light : ThemeMode.dark);
                (context as Element).reassemble();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              icon: isDarkMode
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: const [
                ServiceCard(
                  title: "Dry Clean",
                  description: "Dry Clean your Cloths",
                  rating: 3.5,
                  ratingCount: 3.5,
                  imageUrl:
                      "https://www.marthastewart.com/thmb/dM_cqMBhlcmnUpRSH4NaVIZ6r3s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/our-best-laundry-tips-sort-colors-whites-getty-0923-19487a0ec97d4b67bf4810505285dba9.jpg",
                ),
                ServiceCard(
                  title: "Dry Clean",
                  description: "Dry Clean your Cloths",
                  rating: 3.5,
                  ratingCount: 3.5,
                  imageUrl:
                      "https://www.marthastewart.com/thmb/dM_cqMBhlcmnUpRSH4NaVIZ6r3s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/our-best-laundry-tips-sort-colors-whites-getty-0923-19487a0ec97d4b67bf4810505285dba9.jpg",
                ),
                ServiceCard(
                  title: "Dry Clean",
                  description: "Dry Clean your Cloths",
                  rating: 3.5,
                  ratingCount: 3.5,
                  imageUrl:
                      "https://www.marthastewart.com/thmb/dM_cqMBhlcmnUpRSH4NaVIZ6r3s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/our-best-laundry-tips-sort-colors-whites-getty-0923-19487a0ec97d4b67bf4810505285dba9.jpg",
                ),
              ],
            ),
          ),
          CustomButton(title: "Submit", onTap: () {})
        ],
      ),
    );
  }
}
