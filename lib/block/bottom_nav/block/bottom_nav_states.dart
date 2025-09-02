import 'package:equatable/equatable.dart';

class BottomNavStates extends Equatable {
  final int selectIndex;

  const BottomNavStates({this.selectIndex = 0});

  BottomNavStates copywith({int? changeIndexNumber}) {
    return BottomNavStates(
      selectIndex: changeIndexNumber ?? selectIndex,
    );
  }

  @override
  List<Object?> get props => [selectIndex];
}
