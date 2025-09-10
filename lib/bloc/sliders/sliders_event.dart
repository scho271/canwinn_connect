import 'package:equatable/equatable.dart';

abstract class SlidersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadSliders extends SlidersEvent {}

class NextSlide extends SlidersEvent {}

class PreviousSlide extends SlidersEvent {}

class UpdateSlide extends SlidersEvent {
  final int index;
  UpdateSlide(this.index);

  @override
  List<Object?> get props => [index];
}