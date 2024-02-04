part of 'popular_car_make_bloc.dart';

abstract class PopularCarMakeEvent extends Equatable {
  const PopularCarMakeEvent();
}

class LoadPopularCarMakeEvent extends PopularCarMakeEvent {
  @override
  List<Object?> get props => [];
}
