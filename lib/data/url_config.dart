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
        return "https://api.staging.myautochek.com/v1";

      ///The [ApiUrl.BASEURL] is include in gitignore file
      case UrlEnvironment.production:
        return "https://api.staging.myautochek.com/v1";

      ///The [ApiUrl.BASEURL] is include in gitignore file
    }
  }

  static const String popularMakes = "/make?popular=true";
  static const String allCars = "/car/search?country=NG";
  static const String carsDetailPage = "/car/";
  static const String carsMediaPage = "/car_media?carId=";
}
