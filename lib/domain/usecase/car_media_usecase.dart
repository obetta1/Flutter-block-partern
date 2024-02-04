import 'package:auto_ch_tech_assesment/data/model/car_media_model.dart';

import '../repository/repository.dart';

class CarMediaUseCAse {
  final Repository repository;

  CarMediaUseCAse({required this.repository});

  Future<List<CarMediaList>> execute(String id) async {
    final data = await repository.getCarMedia(id);
    return data.carMediaList!;
  }
}
