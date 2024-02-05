import 'dart:async';

import 'package:auto_ch_tech_assesment/data/model/all_car_model.dart';
import 'package:auto_ch_tech_assesment/domain/usecase/all_car_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'all_car_event.dart';
part 'all_car_state.dart';

class AllCarBloc extends Bloc<AllCarEvent, AllCarState> {
  final AllCarUseCase getAllCarUseCase;

  AllCarBloc(this.getAllCarUseCase) : super(AllCarInitial()) {
    on<LoadAllCarEvent>((event, emit) async {
      print('bloc Received event: ${event.props}');
      try {
        emit(AllCarLoading());
        final makeList = await getAllCarUseCase.execute();
        emit(AllCarLoaded(carList: makeList));
      } catch (e) {
        emit(const AllCarError(
          errorMessage: 'Failed to load',
        ));
      }
    });
  }
}
