part of 'all_car_bloc.dart';

abstract class AllCarState {
  const AllCarState();
  @override
  List<Object> get props => [];
}

class AllCarInitial extends AllCarState {
  @override
  List<Object> get props => [];
}

class AllCarLoading extends AllCarState {}

class AllCarLoaded extends AllCarState {
  final List<Result> carList;

  const AllCarLoaded({required this.carList});

  @override
  List<Object> get props => [carList];
}

class AllCarError extends AllCarState {
  final String errorMessage;

  const AllCarError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
