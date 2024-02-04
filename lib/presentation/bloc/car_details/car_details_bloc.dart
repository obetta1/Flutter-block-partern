import 'dart:async';

import 'package:auto_ch_tech_assesment/data/model/car_details_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecase/car_deetail_usecase.dart';

part 'car_details_event.dart';
part 'car_details_state.dart';

class CarDetailsBloc extends Bloc<CarDetailsEvent, CarDetailsState> {
  final CarDetailsUseCase carDetailsUseCase;
  CarDetailsBloc({required this.carDetailsUseCase})
      : super(CarDetailsInitial()) {
    on<CarDetailsEvent>((event, emit) async {
      if (event is LoadCarDetailsEvent) {
        try {
          emit(CarDetailsloading());
          final data = await carDetailsUseCase.execute(event.id);
          emit(CarDetailsLoaded(carDetails: data));
        } catch (err) {
          emit(const CarDetailsError(errorMessage: "Failed to load data"));
        }
      }
    });
  }
}
