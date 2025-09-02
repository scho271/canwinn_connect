import 'package:equatable/equatable.dart';

class CounterStates extends Equatable{
    final int count;
    const CounterStates({this.count=0});

    CounterStates copyWith({int? counter}) {
      return CounterStates(count: counter ?? this.count);
    }

    @override
  List<Object?> get props =>[count];
}

