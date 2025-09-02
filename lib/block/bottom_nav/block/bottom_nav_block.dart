import 'package:bloc/bloc.dart';
import 'bottom_nav_events.dart';
import 'bottom_nav_states.dart';

class BottomNavBlock extends Bloc<BottomNavigationsEvents, BottomNavStates> {
  BottomNavBlock() : super(const BottomNavStates()) {
    on<ChangeBottom>(changeScreens);
  }

  void changeScreens(ChangeBottom event, Emitter<BottomNavStates> emit) {
    emit(state.copywith(changeIndexNumber: event.index));
  }
}
