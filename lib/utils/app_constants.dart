// ignore_for_file: constant_identifier_names

import 'package:kleen/data/model/models/language_model.dart';
import 'package:kleen/utils/images.dart';

class AppConstants {
//Shared Key
  static const String LOCALIZATION_KEY = 'X-localization';
  static const String TOKEN = 'kleen-token';
//Languages
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
  ];
}
