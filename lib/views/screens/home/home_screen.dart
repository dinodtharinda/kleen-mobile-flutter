// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kleen/utils/custom/app_custom_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Get.changeThemeMode(
                      isDarkMode ? ThemeMode.light : ThemeMode.dark);
                  isDarkMode = !isDarkMode;
                  (context as Element).reassemble();
                });
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SeeMoreButton(
                onTap: () {
                  print("See All");
                },
              ),
              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ImageCard(
                      title: "Wash and Fold",
                      imageUrl:
                          "https://dev.kleen.lk/storage/services/img/CrQuzUqbYS4kst2vQoTxbdsPQ_1698878794.png",
                      ratings: 3.4,
                    ),
                    ImageCard(
                      title: "Wash and Fold",
                      imageUrl:
                          "https://dev.kleen.lk/storage/services/img/hPw0vacwxfDeVhff9mvKxl8aF_1698878779.png",
                      ratings: 3.4,
                    ),
                    ImageCard(
                      title: "Wash and Fold",
                      imageUrl:
                          "https://dev.kleen.lk/storage/services/img/CrQuzUqbYS4kst2vQoTxbdsPQ_1698878794.png",
                      ratings: 3.4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const ProductListTile(
            title: "Dry Clean",
            subtitle: "Dry your cloths fast",
            imageUrl:
                "https://dev.kleen.lk/storage/services/img/CrQuzUqbYS4kst2vQoTxbdsPQ_1698878794.png",
            rating: 3.5,
          )
        ],
      ),
    );
  }
}
