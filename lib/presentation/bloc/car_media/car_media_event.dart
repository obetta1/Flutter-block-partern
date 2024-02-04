part of 'car_media_bloc.dart';

abstract class CarMediaEvent extends Equatable {
  const CarMediaEvent();
}

class LoadCarMediaEvent extends CarMediaEvent {
  final String id;
  const LoadCarMediaEvent({required this.id});
  @override
  List<Object?> get props => [];
}
