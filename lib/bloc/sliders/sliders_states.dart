import 'package:equatable/equatable.dart';

class SlidersState extends Equatable {
  final List<Map<String, String>> slides;
  final int currentIndex;

  SlidersState({required this.slides, this.currentIndex = 0});

  SlidersState copyWith({List<Map<String, String>>? slides, int? currentIndex}) {
    return SlidersState(
      slides: slides ?? this.slides,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [slides, currentIndex];
}
