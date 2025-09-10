import 'package:canwinn_project/Constants/image_constants.dart';
import 'package:canwinn_project/bloc/sliders/sliders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sliders_event.dart';

class SlidersBloc extends Bloc<SlidersEvent, SlidersState> {
  bool _isSlidingForward = true;

  SlidersBloc() : super(SlidersState(slides: [], currentIndex: 0)) {
    on<LoadSliders>(_onLoadSliders);
    on<NextSlide>(_onNextSlide);
    on<PreviousSlide>(_onPreviousSlide);
    on<UpdateSlide>(_onUpdateSlide);
  }

  void _onLoadSliders(LoadSliders event, Emitter<SlidersState> emit) {
    final slides = [
      {"title": "Book Clinic Appointment", "image": doctorAppointment},
      {"title": "Instant Video Consultation", "image": doctorAppointment},
      {"title": "Doctor Visit", "image": doctorAppointment},
    ];
    emit(state.copyWith(slides: slides, currentIndex: 0));
  }

  void _onNextSlide(NextSlide event, Emitter<SlidersState> emit) {
    if (state.slides.isNotEmpty) {
      final nextIndex = (state.currentIndex + 1) % state.slides.length;
      _isSlidingForward = true;
      emit(state.copyWith(currentIndex: nextIndex));
    }
  }

  void _onPreviousSlide(PreviousSlide event, Emitter<SlidersState> emit) {
    if (state.slides.isNotEmpty) {
      final prevIndex = state.currentIndex == 0
          ? state.slides.length - 1
          : state.currentIndex - 1;
      _isSlidingForward = false;
      emit(state.copyWith(currentIndex: prevIndex));
    }
  }

  void _onUpdateSlide(UpdateSlide event, Emitter<SlidersState> emit) {
    if (state.slides.isNotEmpty) {
      emit(state.copyWith(currentIndex: event.index));
    }
  }

  bool get isSlidingForward => _isSlidingForward;
}