import 'dart:async';

import 'package:auto_ch_tech_assesment/domain/usecase/popular_make_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../core/app_export.dart';

part 'popular_car_make_event.dart';
part 'popular_car_make_state.dart';

class PopularCarMakeBloc
    extends Bloc<PopularCarMakeEvent, PopularCarMakeState> {
  final PopularCarMakeUseCase getPopularCarMakeUsecase;
  PopularCarMakeBloc({required this.getPopularCarMakeUsecase})
      : super(PopularCarMakeInitial()) {
    on<LoadPopularCarMakeEvent>((event, emit) async {
      print('bloc Received event: $event');
      try {
        emit(PopularCarMakeLoading());
        final makeList = await getPopularCarMakeUsecase.execute();
        emit(PopularCarMakeLoaded(makeList: makeList));
      } catch (e) {
        emit(const CarMakeError(
          errorMessage: 'Failed to load make list',
        ));
      }
      //mapEventToState(event);
    });
  }

  // Stream<PopularCarMakeState> mapEventToState(
  //   PopularCarMakeEvent event,
  // ) async* {
  //   print('bloc Received event: $event');
  //
  //   if (event is LoadPopularCarMakeEvent) {
  //     yield PopularCarMakeLoading();
  //     try {
  //       final makeList = await getPopularCarMakeUsecase.execute();
  //       if (kDebugMode) {
  //         print('bloc Received state: $makeList');
  //       }
  //
  //       yield PopularCarMakeLoaded(makeList: makeList);
  //     } catch (e) {
  //       yield const CarMakeError(
  //         errorMessage: 'Failed to load make list',
  //       );
  //     }
  //   }
  // }
}
