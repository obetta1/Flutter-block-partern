part of 'car_details_bloc.dart';

abstract class CarDetailsEvent extends Equatable {
  const CarDetailsEvent();
}

class LoadCarDetailsEvent extends CarDetailsEvent {
  String id;
  LoadCarDetailsEvent({required this.id});
  @override
  List<Object?> get props => [];
}
