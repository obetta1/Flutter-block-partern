import 'package:auto_ch_tech_assesment/env/api_url.dart';

enum UrlEnvironment { development, production }

///this is used to configure the url depending on the environment[development] or [production]
class UrlConfig {
  static UrlEnvironment _environment = UrlEnvironment.development;
  static UrlEnvironment get environment => _environment;
  static void setEnvironment(UrlEnvironment env) => _environment = env;

  static String get baseUrl => "$_baseUrl";

  static get _baseUrl {
    switch (_environment) {
      case UrlEnvironment.development:
        return ApiUrl.BASEURL;

      ///The [ApiUrl.BASEURL] is include in gitignore file
      case UrlEnvironment.production:
        return ApiUrl.BASEURL;

      ///The [ApiUrl.BASEURL] is include in gitignore file
    }
  }

  static const String popularMakes = "/make?popular=true";
  static const String allCars = "/car/search";
  static const String carsDetailPage = "/car/";
  static const String carsMediaPage = "/car_media?carId=";
}
