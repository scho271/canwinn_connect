import 'package:canwinn_project/block/counter_events.dart';
import 'package:canwinn_project/block/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlock extends Bloc<CounterEvent , CounterStates>{
  CounterBlock():super(CounterStates()){
    on<Increments>(_increments);
    on<Decrements>(_decrements);
  }
  void _increments(Increments event ,Emitter<CounterStates> emait){

     emit(state.copyWith(counter: state.count+1));
  }

  void _decrements(Decrements event ,Emitter<CounterStates> emait){
    if(state.count !=0){
      emit(state.copyWith(counter: state.count -1));
    }
  }
}


