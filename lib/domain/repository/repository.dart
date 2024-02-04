import 'package:auto_ch_tech_assesment/data/model/all_car_model.dart';
import 'package:auto_ch_tech_assesment/data/model/car_details_model.dart';
import 'package:auto_ch_tech_assesment/data/model/car_media_model.dart';

import '../../core/app_export.dart';

class Repository {
  final _apiClient = ApiClient();

  Future<PopularCarMakes> getPopularCarMakes() async {
    final data = await _apiClient.getPopularCarMakes();
    printDioLogs(data);
    return data;
  }

  Future<AllCarModel> getAllCars() async {
    final data = await _apiClient.getAllCars();
    printDioLogs(data);
    return data;
  }

  Future<CarMediaModel> getCarMedia(String id) async {
    final data = await _apiClient.getCarMedia(id);
    printDioLogs(data);
    return data;
  }

  Future<CarDetailsModel> getCarDetails(String id) async {
    final data = await _apiClient.getCarDetails(id);
    printDioLogs(data);
    return data;
  }
}
