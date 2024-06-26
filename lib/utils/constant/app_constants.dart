// ignore_for_file: constant_identifier_names
import '../../data/model/models/language_model.dart';
import 'images.dart';

class AppConstants {
  static const String BASE_URL = 'http://matrixfinance.nexmatrixlab.com';
  static const String LOGIN_URI = '/api/v1/auth/login';

  static const String LANGUAGE_CODE = 'kleen_language_code';
  static const String ZONE_TOPIC = 'zone_topic';

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


// flutter version - 3.16.3
// cached_network_image: ^3.3.0
// get: ^4.6.6