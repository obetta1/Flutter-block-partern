part of 'popular_car_make_bloc.dart';

abstract class PopularCarMakeState extends Equatable {
  const PopularCarMakeState();
  @override
  List<Object> get props => [];
}

class PopularCarMakeInitial extends PopularCarMakeState {
  @override
  List<Object> get props => [];
}

class PopularCarMakeLoading extends PopularCarMakeState {}

class PopularCarMakeLoaded extends PopularCarMakeState {
  final List<MakeList> makeList;

  const PopularCarMakeLoaded({required this.makeList});

  @override
  List<Object> get props => [makeList];
}

class CarMakeError extends PopularCarMakeState {
  final String errorMessage;

  const CarMakeError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
