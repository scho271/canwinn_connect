import 'package:equatable/equatable.dart';

abstract class BottomNavigationsEvents extends Equatable {
  const BottomNavigationsEvents();

  @override
  List<Object?> get props => [];
}

class ChangeBottom extends BottomNavigationsEvents {
  final int index;
  const ChangeBottom(this.index);

  @override
  List<Object?> get props => [index];
}
