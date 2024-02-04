part of 'car_media_bloc.dart';

abstract class CarMediaState extends Equatable {
  const CarMediaState();
}

class CarMediaInitial extends CarMediaState {
  @override
  List<Object> get props => [];
}

class CarMediaLoading extends CarMediaState {
  @override
  List<Object?> get props => [];
}

class CarMediaLoaded extends CarMediaState {
  final List<CarMediaList> makeList;

  const CarMediaLoaded({required this.makeList});

  @override
  List<Object> get props => [makeList];
}

class CarMediaError extends CarMediaState {
  final String errorMessage;

  const CarMediaError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
