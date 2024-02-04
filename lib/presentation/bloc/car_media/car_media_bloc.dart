import 'package:auto_ch_tech_assesment/data/model/car_media_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecase/car_media_usecase.dart';

part 'car_media_event.dart';
part 'car_media_state.dart';

class CarMediaBloc extends Bloc<CarMediaEvent, CarMediaState> {
  final CarMediaUseCAse getCarMediaUseCAse;
  CarMediaBloc({required this.getCarMediaUseCAse}) : super(CarMediaInitial()) {
    on<CarMediaEvent>((event, emit) async {
      if (event is LoadCarMediaEvent) {
        try {
          emit(CarMediaLoading());
          final data = await getCarMediaUseCAse.execute(event.id);
          emit(CarMediaLoaded(makeList: data));
        } catch (e) {
          emit(const CarMediaError(errorMessage: 'Failed to load data'));
        }
      }
    });
  }
}
