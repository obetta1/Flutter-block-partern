part of 'car_details_bloc.dart';

abstract class CarDetailsState extends Equatable {
  const CarDetailsState();
}

class CarDetailsInitial extends CarDetailsState {
  @override
  List<Object> get props => [];
}

class CarDetailsloading extends CarDetailsState {
  @override
  List<Object?> get props => [];
}

class CarDetailsLoaded extends CarDetailsState {
  final CarDetailsModel makeList;

  const CarDetailsLoaded({required this.makeList});

  @override
  List<Object> get props => [makeList];
}

class CarDetailsError extends CarDetailsState {
  final String errorMessage;

  const CarDetailsError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
