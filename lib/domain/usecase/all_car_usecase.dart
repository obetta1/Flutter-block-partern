import 'package:auto_ch_tech_assesment/data/model/all_car_model.dart';

import '../repository/repository.dart';

class AllCarUseCase {
  final Repository repository;

  AllCarUseCase(this.repository);

  Future<List<Result>> execute() async {
    final data = await repository.getAllCars();
    return data.result!;
  }
}
