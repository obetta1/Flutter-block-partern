import 'package:auto_ch_tech_assesment/data/model/car_details_model.dart';
import 'package:auto_ch_tech_assesment/domain/repository/repository.dart';

class CarDetailsUseCase {
  final Repository repository;

  CarDetailsUseCase({required this.repository});

  Future<CarDetailsModel> execute(String id) async {
    final data = await repository.getCarDetails(id);
    return data;
  }
}
