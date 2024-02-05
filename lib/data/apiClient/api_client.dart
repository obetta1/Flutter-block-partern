import 'package:auto_ch_tech_assesment/data/model/all_car_model.dart';
import 'package:auto_ch_tech_assesment/data/model/car_details_model.dart';
import 'package:auto_ch_tech_assesment/data/model/car_media_model.dart';
import 'package:auto_ch_tech_assesment/presentation/bloc/popular_car_makes/popular_car_make_bloc.dart';
import 'package:dio/dio.dart';

import '../../core/app_export.dart';
import '../../core/utils/utils.dart';
import '../url_config.dart';
import 'network_interceptor.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  static final ApiClient _apiClient = ApiClient._internal();
  var baseUrl = UrlConfig.baseUrl;

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
  ))
    ..interceptors.add(NetworkInterceptor())
    ..interceptors.add(
      LogInterceptor(requestBody: true, logPrint: printDioLogs),
    );

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      showSnackbar(
          'INTERNET ERROR', "No Internet Found!please check your internet ");
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  /// Returns a [PopularCarMakes] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PopularCarMakes> getPopularCarMakes() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.get(
        '$baseUrl${UrlConfig.popularMakes}',
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return PopularCarMakes.fromJson(data);
      } else {
        throw response.data != null
            ? PopularCarMakes.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Returns a [AllCarModel] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<AllCarModel> getAllCars() async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.get(
        '$baseUrl${UrlConfig.allCars}',
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return AllCarModel.fromJson(data);
      } else {
        throw response.data != null
            ? AllCarModel.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Returns a [CarMediaModel] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<CarMediaModel> getCarMedia(String id) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      //await isNetworkConnected();
      var response = await _dio.get(
        '$baseUrl${UrlConfig.carsMediaPage}$id',
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return CarMediaModel.fromJson(data);
      } else {
        throw response.data != null
            ? CarMediaModel.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Returns a list of [CarDetailsModel] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<CarDetailsModel> getCarDetails(String id) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      //await isNetworkConnected();
      var response = await _dio.get(
        '$baseUrl${UrlConfig.carsDetailPage}$id',
        options: Options(
          responseType: ResponseType.json,
        ),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        final data = response.data;

        return CarDetailsModel.fromJson(data);
      } else {
        throw response.data != null
            ? CarDetailsModel.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
