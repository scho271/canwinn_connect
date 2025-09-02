import 'package:equatable/equatable.dart';

class CounterEvent extends Equatable{
  const CounterEvent();
  @override

  List<Object?> get props => [];

}
class Increments extends CounterEvent{}
class Decrements extends CounterEvent{}


